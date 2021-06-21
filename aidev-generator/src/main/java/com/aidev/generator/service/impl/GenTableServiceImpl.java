package com.aidev.generator.service.impl;

import com.aidev.common.constant.Constants;
import com.aidev.common.constant.GenConstants;
import com.aidev.common.core.text.CharsetKit;
import com.aidev.common.core.text.Convert;
import com.aidev.common.exception.BusinessException;
import com.aidev.common.utils.StringUtils;
import com.aidev.common.utils.snowflakeid.IdUtils;
import com.aidev.generator.domain.GenTable;
import com.aidev.generator.domain.GenTableColumn;
import com.aidev.generator.mapper.GenTableColumnMapper;
import com.aidev.generator.mapper.GenTableMapper;
import com.aidev.generator.service.IDbTableColumnService;
import com.aidev.generator.service.IGenTableService;
import com.aidev.generator.util.GenUtils;
import com.aidev.generator.util.VelocityInitializer;
import com.aidev.generator.util.VelocityUtils;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.Velocity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.StringWriter;
import java.util.*;
import java.util.stream.Collectors;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 * 业务 服务层实现
 *
 * @author aidev
 */
@Service
@Slf4j
public class GenTableServiceImpl extends ServiceImpl<GenTableMapper, GenTable> implements IGenTableService {
    @Resource
    private GenTableColumnMapper genTableColumnMapper;
    @Resource
    private IDbTableColumnService dbTableColumnService;

    /**
     * 获取代码生成地址
     *
     * @param table    业务表信息
     * @param template 模板文件路径
     * @return 生成地址
     */
    public static String getGenPath(GenTable table, String template) {
        String genPath = table.getGenPath();
        if (StringUtils.equals(genPath, "/")) {
            return System.getProperty("user.dir") + File.separator + "src" + File.separator + VelocityUtils.getFileName(template, table);
        }
        return genPath + File.separator + VelocityUtils.getFileName(template, table);
    }

    /**
     * 查询业务信息
     *
     * @param tableId
     * @return 业务信息
     */
    @Override
    public GenTable selectGenTableById(Long tableId) {
        GenTable genTable = getById(tableId);
        setTableFromOptions(genTable);
        return genTable;
    }

    /**
     * 修改业务
     *
     * @param genTable 业务信息
     * @return 结果
     */
    @Override
    @Transactional
    public void updateGenTable(GenTable genTable) {
        String options = JSON.toJSONString(genTable.getParams());
        genTable.setOptions(options);
        boolean update = updateById(genTable);
        if (update) {
            for (GenTableColumn cenTableColumn : genTable.getColumns()) {
                genTableColumnMapper.updateById(cenTableColumn);
            }
        }
    }

    /**
     * 删除业务对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    @Transactional
    public void deleteGenTableByIds(String ids) {
        removeByIds(Arrays.asList(Convert.toLongArray(ids)));
        genTableColumnMapper.deleteByTableIds(Convert.toLongArray(ids));
    }

    /**
     * 导入表结构
     *
     * @param tableList 导入表列表
     * @param operName  操作人员
     */
    @Override
    @Transactional
    public void importGenTable(List<GenTable> tableList, String operName) {
        try {
            for (GenTable table : tableList) {
                String tableName = table.getTableName();
                GenUtils.initTable(table, operName);
                if (save(table)) {
                    List<GenTableColumn> genTableColumns = dbTableColumnService.selectDbTableColumnsByName(tableName);
                    for (GenTableColumn column : genTableColumns) {
                        GenUtils.initColumnField(column, table);
                        genTableColumnMapper.insert(column);
                    }
                }
            }
        } catch (Exception e) {
            throw new BusinessException("导入失败：" + e.getMessage());
        }
    }

    /**
     * 预览代码
     *
     * @param tableId 表编号
     * @return 预览数据列表
     */
    @Override
    public Map<String, String> previewCode(Long tableId) {
        Map<String, String> dataMap = new LinkedHashMap<>();
        // 查询表信息
        GenTable table = getById(tableId)
                .setMenuId(IdUtils.nextId())
                .setListMenuId(IdUtils.nextId())
                .setAddMenuId(IdUtils.nextId())
                .setEditMenuId(IdUtils.nextId())
                .setRemoveMenuId(IdUtils.nextId())
                .setExportMenuId(IdUtils.nextId());
        // 设置主子表信息
        setSubTable(table);
        // 设置主键列信息
        setPkColumn(table);

        VelocityInitializer.initVelocity();

        VelocityContext context = VelocityUtils.prepareContext(table);

        // 获取模板列表
        List<String> templates = VelocityUtils.getTemplateList(table.getTplCategory());
        for (String template : templates) {
            // 渲染模板
            StringWriter sw = new StringWriter();
            Template tpl = Velocity.getTemplate(template, Constants.UTF8);
            tpl.merge(context, sw);
            dataMap.put(template, sw.toString());
        }
        return dataMap;
    }

    /**
     * 生成代码（下载方式）
     *
     * @param tableName 表名称
     * @return 数据
     */
    @Override
    public byte[] downloadCode(String tableName) {
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        ZipOutputStream zip = new ZipOutputStream(outputStream);
        generatorCode(tableName, zip);
        IOUtils.closeQuietly(zip);
        return outputStream.toByteArray();
    }

    /**
     * 生成代码（自定义路径）
     *
     * @param tableName 表名称
     */
    @Override
    public void generatorCode(String tableName) {
        // 查询表信息
        GenTable table = lambdaQuery().eq(GenTable::getTableName, tableName).one()
                .setMenuId(IdUtils.nextId())
                .setListMenuId(IdUtils.nextId())
                .setAddMenuId(IdUtils.nextId())
                .setEditMenuId(IdUtils.nextId())
                .setRemoveMenuId(IdUtils.nextId())
                .setExportMenuId(IdUtils.nextId());
        // 设置主子表信息
        setSubTable(table);
        // 设置主键列信息
        setPkColumn(table);

        VelocityInitializer.initVelocity();

        VelocityContext context = VelocityUtils.prepareContext(table);

        // 获取模板列表
        List<String> templates = VelocityUtils.getTemplateList(table.getTplCategory());
        for (String template : templates) {
            if (!StringUtils.contains(template, "sql.vm")) {
                // 渲染模板
                StringWriter sw = new StringWriter();
                Template tpl = Velocity.getTemplate(template, Constants.UTF8);
                tpl.merge(context, sw);
                try {
                    String path = getGenPath(table, template);
                    FileUtils.writeStringToFile(new File(path), sw.toString(), CharsetKit.UTF_8);
                } catch (IOException e) {
                    throw new BusinessException("渲染模板失败，表名：" + table.getTableName());
                }
            }
        }
    }

    /**
     * 同步数据库
     *
     * @param tableName 表名称
     */
    @Override
    @Transactional
    public void synchDb(String tableName) {
        GenTable table = lambdaQuery().eq(GenTable::getTableName, tableName).one();
        List<GenTableColumn> tableColumns = table.getColumns();
        List<String> tableColumnNames = tableColumns.stream().map(GenTableColumn::getColumnName).collect(Collectors.toList());

        List<GenTableColumn> dbTableColumns = dbTableColumnService.selectDbTableColumnsByName(tableName);
        if (StringUtils.isEmpty(dbTableColumns)) {
            throw new BusinessException("同步数据失败，原表结构不存在");
        }
        List<String> dbTableColumnNames = dbTableColumns.stream().map(GenTableColumn::getColumnName).collect(Collectors.toList());

        dbTableColumns.forEach(column -> {
            if (!tableColumnNames.contains(column.getColumnName())) {
                GenUtils.initColumnField(column, table);
                genTableColumnMapper.insert(column);
            }
        });

        List<Long> columnIds = tableColumns.stream()
                .filter(column -> !dbTableColumnNames.contains(column.getColumnName()))
                .map(GenTableColumn::getColumnId)
                .collect(Collectors.toList());
        if (CollectionUtils.isNotEmpty(columnIds)) {
            genTableColumnMapper.deleteBatchIds(columnIds);
        }
    }

    /**
     * 批量生成代码
     *
     * @param tableNames 表数组
     * @return 数据
     */
    @Override
    public byte[] downloadCode(String[] tableNames) {
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        ZipOutputStream zip = new ZipOutputStream(outputStream);
        for (String tableName : tableNames) {
            generatorCode(tableName, zip);
        }
        IOUtils.closeQuietly(zip);
        return outputStream.toByteArray();
    }

    /**
     * 查询表信息并生成代码
     */
    private void generatorCode(String tableName, ZipOutputStream zip) {
        // 查询表信息
        GenTable table = lambdaQuery().eq(GenTable::getTableName, tableName).one()
                .setMenuId(IdUtils.nextId())
                .setListMenuId(IdUtils.nextId())
                .setAddMenuId(IdUtils.nextId())
                .setEditMenuId(IdUtils.nextId())
                .setRemoveMenuId(IdUtils.nextId())
                .setExportMenuId(IdUtils.nextId());
        // 设置主子表信息
        setSubTable(table);
        // 设置主键列信息
        setPkColumn(table);

        VelocityInitializer.initVelocity();

        VelocityContext context = VelocityUtils.prepareContext(table);

        // 获取模板列表
        List<String> templates = VelocityUtils.getTemplateList(table.getTplCategory());
        for (String template : templates) {
            // 渲染模板
            StringWriter sw = new StringWriter();
            Template tpl = Velocity.getTemplate(template, Constants.UTF8);
            tpl.merge(context, sw);
            try {
                // 添加到zip
                zip.putNextEntry(new ZipEntry(VelocityUtils.getFileName(template, table)));
                IOUtils.write(sw.toString(), zip, Constants.UTF8);
                IOUtils.closeQuietly(sw);
                zip.flush();
                zip.closeEntry();
            } catch (IOException e) {
                log.error("渲染模板失败，表名：" + table.getTableName(), e);
            }
        }
    }

    /**
     * 修改保存参数校验
     *
     * @param genTable 业务信息
     */
    @Override
    public void validateEdit(GenTable genTable) {
        if (GenConstants.TPL_TREE.equals(genTable.getTplCategory())) {
            String options = JSON.toJSONString(genTable.getParams());
            JSONObject paramsObj = JSONObject.parseObject(options);
            if (StringUtils.isEmpty(paramsObj.getString(GenConstants.TREE_CODE))) {
                throw new BusinessException("树编码字段不能为空");
            } else if (StringUtils.isEmpty(paramsObj.getString(GenConstants.TREE_PARENT_CODE))) {
                throw new BusinessException("树父编码字段不能为空");
            } else if (StringUtils.isEmpty(paramsObj.getString(GenConstants.TREE_NAME))) {
                throw new BusinessException("树名称字段不能为空");
            }
        } else if (GenConstants.TPL_SUB.equals(genTable.getTplCategory())) {
            if (StringUtils.isEmpty(genTable.getSubTableName())) {
                throw new BusinessException("关联子表的表名不能为空");
            } else if (StringUtils.isEmpty(genTable.getSubTableFkName())) {
                throw new BusinessException("子表关联的外键名不能为空");
            }
        }
    }

    /**
     * 设置主键列信息
     *
     * @param table 业务表信息
     */
    public void setPkColumn(GenTable table) {
        for (GenTableColumn column : table.getColumns()) {
            if (column.isPk()) {
                table.setPkColumn(column);
                break;
            }
        }
        if (Objects.isNull(table.getPkColumn())) {
            table.setPkColumn(table.getColumns().get(0));
        }
        if (GenConstants.TPL_SUB.equals(table.getTplCategory())) {
            for (GenTableColumn column : table.getSubTable().getColumns()) {
                if (column.isPk()) {
                    table.getSubTable().setPkColumn(column);
                    break;
                }
            }
            if (Objects.isNull(table.getSubTable().getPkColumn())) {
                table.getSubTable().setPkColumn(table.getSubTable().getColumns().get(0));
            }
        }
    }

    /**
     * 设置主子表信息
     *
     * @param table 业务表信息
     */
    public void setSubTable(GenTable table) {
        String subTableName = table.getSubTableName();
        if (StringUtils.isNotEmpty(subTableName)) {
            table.setSubTable(lambdaQuery().eq(GenTable::getTableName, subTableName).one());
        }
    }

    /**
     * 设置代码生成其他选项值
     *
     * @param genTable 设置后的生成对象
     */
    private void setTableFromOptions(GenTable genTable) {
        JSONObject paramsObj = JSONObject.parseObject(genTable.getOptions());
        if (Objects.nonNull(paramsObj)) {
            genTable.setTreeCode(paramsObj.getString(GenConstants.TREE_CODE))
                    .setTreeParentCode(paramsObj.getString(GenConstants.TREE_PARENT_CODE))
                    .setTreeName(paramsObj.getString(GenConstants.TREE_NAME))
                    .setParentMenuId(paramsObj.getString(GenConstants.PARENT_MENU_ID))
                    .setParentMenuName(paramsObj.getString(GenConstants.PARENT_MENU_NAME));
        }
    }
}