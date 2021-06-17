package com.aidev.system.service.impl;

import com.aidev.common.constant.UserConstants;
import com.aidev.common.core.text.Convert;
import com.aidev.common.exception.BusinessException;
import com.aidev.system.domain.SysPost;
import com.aidev.system.domain.SysUserPost;
import com.aidev.system.mapper.SysPostMapper;
import com.aidev.system.service.ISysPostService;
import com.aidev.system.service.ISysUserPostService;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;

/**
 * 岗位信息 服务层处理
 *
 * @author aidev
 */
@Service
public class SysPostServiceImpl extends ServiceImpl<SysPostMapper, SysPost> implements ISysPostService {
    @Resource
    private ISysUserPostService userPostService;

    /**
     * 查询岗位信息集合
     *
     * @param domain 岗位信息
     * @return 岗位信息集合
     */
    @Override
    public List<SysPost> selectPostList(SysPost domain) {
        return lambdaQuery()
                .like(StringUtils.isNotBlank(domain.getPostCode()), SysPost::getPostCode, domain.getPostCode())
                .eq(StringUtils.isNotBlank(domain.getStatus()), SysPost::getStatus, domain.getStatus())
                .like(StringUtils.isNotBlank(domain.getPostName()), SysPost::getPostName, domain.getPostName())
                .list();
    }

    /**
     * 根据用户ID查询岗位
     *
     * @param userId 用户ID
     * @return 岗位列表
     */
    @Override
    public List<SysPost> selectPostsByUserId(Long userId) {
        List<SysPost> userPosts = getBaseMapper().selectPostsByUserId(userId);
        List<SysPost> posts = lambdaQuery().list();
        for (SysPost post : posts) {
            for (SysPost userRole : userPosts) {
                if (post.getPostId().longValue() == userRole.getPostId().longValue()) {
                    post.setFlag(true);
                    break;
                }
            }
        }
        return posts;
    }

    /**
     * 批量删除岗位信息
     *
     * @param ids 需要删除的数据ID
     * @return
     * @throws Exception
     */
    @Override
    public boolean deletePostByIds(String ids) throws BusinessException {
        Long[] postIds = Convert.toLongArray(ids);
        for (Long postId : postIds) {
            SysPost post = getById(postId);
            if (userPostService.lambdaQuery().eq(SysUserPost::getPostId, postId).count() > 0) {
                throw new BusinessException(String.format("%1$s已分配,不能删除", post.getPostName()));
            }
        }
        return removeByIds(Arrays.asList(postIds));
    }

    /**
     * 校验岗位名称是否唯一
     *
     * @param post 岗位信息
     * @return 结果
     */
    @Override
    public String checkPostNameUnique(SysPost post) {
        Long postId = Objects.isNull(post.getPostId()) ? -1L : post.getPostId();
        List<SysPost> sysPosts = lambdaQuery().eq(SysPost::getPostName, post.getPostName()).page(new Page<>(1, 1)).getRecords();
        if (!CollectionUtils.isEmpty(sysPosts) && !Objects.equals(sysPosts.get(0).getPostId(), postId)) {
            return UserConstants.POST_NAME_NOT_UNIQUE;
        }
        return UserConstants.POST_NAME_UNIQUE;
    }

    /**
     * 校验岗位编码是否唯一
     *
     * @param post 岗位信息
     * @return 结果
     */
    @Override
    public String checkPostCodeUnique(SysPost post) {
        Long postId = Objects.isNull(post.getPostId()) ? -1L : post.getPostId();
        List<SysPost> sysPosts = lambdaQuery().eq(SysPost::getPostCode, post.getPostCode()).page(new Page<>(1, 1)).getRecords();
        if (!CollectionUtils.isEmpty(sysPosts) && !Objects.equals(sysPosts.get(0).getPostId(), postId)) {
            return UserConstants.POST_CODE_NOT_UNIQUE;
        }
        return UserConstants.POST_CODE_UNIQUE;
    }
}
