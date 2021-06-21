package com.aidev.common.core.controller;

import com.aidev.common.core.domain.AjaxResult;
import com.aidev.common.core.domain.AjaxResult.Type;
import com.aidev.common.core.page.PageDomain;
import com.aidev.common.core.page.TableDataInfo;
import com.aidev.common.core.page.TableSupport;
import com.aidev.common.core.text.StrFormatter;
import com.aidev.common.utils.DateUtils;
import com.aidev.common.utils.ServletUtils;
import com.aidev.common.utils.sql.SqlUtil;
import com.github.pagehelper.ISelect;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.beans.PropertyEditorSupport;
import java.time.LocalDateTime;
import java.util.List;

/**
 * web层通用数据处理
 *
 * @author aidev
 */
public class BaseController {
    /**
     * 将前台传递过来的日期格式的字符串，自动转化为LocalDateTime类型
     */
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        // LocalDateTime类型转换
        binder.registerCustomEditor(LocalDateTime.class, new PropertyEditorSupport() {
            @Override
            public void setAsText(String text) {
                if (StringUtils.isNotBlank(text)) {
                    setValue(DateUtils.toLocalDateTime(DateUtils.parseDate(text)));
                }
            }
        });
    }

    /**
     * 设置请求分页数据
     */
    private Page<Object> startPage() {
        PageDomain pageDomain = TableSupport.buildPageRequest();
        Integer pageNum = pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize();
        String orderBy = SqlUtil.escapeOrderBySql(pageDomain.getOrderBy());
        return PageHelper.startPage(pageNum, pageSize, orderBy);
    }

    /**
     * 设置请求排序数据
     */
    protected void startOrderBy() {
        PageDomain pageDomain = TableSupport.buildPageRequest();
        if (StringUtils.isNotEmpty(pageDomain.getOrderBy())) {
            String orderBy = SqlUtil.escapeOrderBySql(pageDomain.getOrderBy());
            PageHelper.orderBy(orderBy);
        }
    }

    /**
     * 获取request
     */
    public HttpServletRequest getRequest() {
        return ServletUtils.getRequest();
    }

    /**
     * 获取response
     */
    public HttpServletResponse getResponse() {
        return ServletUtils.getResponse();
    }

    /**
     * 获取session
     */
    public HttpSession getSession() {
        return getRequest().getSession();
    }

    /**
     * 响应请求分页数据
     */
    protected TableDataInfo getPageDataTable(ISelect select) {
        PageInfo<Object> pageInfo = startPage().doSelectPageInfo(select);
        return new TableDataInfo()
                .setCode(0)
                .setTotal(pageInfo.getTotal())
                .setRows(pageInfo.getList());
    }

    /**
     * 响应请求数据
     */
    protected TableDataInfo getDataTable(List<?> list) {
        return new TableDataInfo()
                .setCode(0)
                .setTotal(list.size())
                .setRows(list);
    }

    /**
     * 响应返回结果
     *
     * @param rows 影响行数
     * @return 操作结果
     */
    protected AjaxResult toAjax(int rows) {
        return rows > 0 ? success() : error();
    }

    /**
     * 响应返回结果
     *
     * @param result 结果
     * @return 操作结果
     */
    protected AjaxResult toAjax(boolean result) {
        return result ? success() : error();
    }

    /**
     * 返回成功
     */
    public AjaxResult success() {
        return AjaxResult.success();
    }

    /**
     * 返回失败消息
     */
    public AjaxResult error() {
        return AjaxResult.error();
    }

    /**
     * 返回成功消息
     */
    public AjaxResult success(String message) {
        return AjaxResult.success(message);
    }

    /**
     * 返回失败消息
     */
    public AjaxResult error(String message) {
        return AjaxResult.error(message);
    }

    /**
     * 返回错误码消息
     */
    public AjaxResult error(Type type, String message) {
        return new AjaxResult(type, message);
    }

    /**
     * 页面跳转
     */
    public String redirect(String url) {
        return StrFormatter.format("redirect:{}", url);
    }
}
