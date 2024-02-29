package com.zzc.init.admin.post.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.json.JSONUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zzc.init.admin.post.model.dto.PostAddRequest;
import com.zzc.init.admin.post.model.dto.PostDeleteRequest;
import com.zzc.init.admin.post.model.dto.PostEditRequest;
import com.zzc.init.admin.post.model.dto.PostUpdateRequest;
import com.zzc.init.admin.post.model.entity.Post;
import com.zzc.init.admin.post.model.vo.PostVO;
import com.zzc.init.admin.post.service.PostService;
import com.zzc.init.admin.user.model.entity.User;
import com.zzc.init.admin.user.service.UserService;
import com.zzc.init.common.ErrorCode;
import com.zzc.init.constant.UserConstant;
import com.zzc.init.exception.BusinessException;
import com.zzc.init.exception.ThrowUtils;
import com.zzc.init.mapper.PostMapper;
import com.zzc.init.utils.PostTagUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 帖子服务实现
 */
@Service
@Slf4j
public class PostServiceImpl extends ServiceImpl<PostMapper, Post> implements PostService {

    @Resource
    private UserService userService;


    /**
     * 添加帖子
     */
    @Override
    public boolean addPost(PostAddRequest postAddRequest, HttpServletRequest request) {
        Post post = new Post();
        BeanUtils.copyProperties(postAddRequest, post);
        List<String> tags = postAddRequest.getTagList();
        if (tags != null) {
            post.setTags(JSONUtil.toJsonStr(tags));
        }
        validPost(post, true);
        User loginUser = new User();
        BeanUtils.copyProperties(userService.getLoginUser(request), loginUser);
        post.setUserId(loginUser.getUser_id());
        post.setFavourNum(0);
        post.setThumbNum(0);
        boolean result = this.save(post);
        ThrowUtils.throwIf(!result, ErrorCode.OPERATION_ERROR);
        return true;
    }

    /**
     * 删除帖子
     */
    @Override
    public boolean deletePost(PostDeleteRequest deleteRequest, HttpServletRequest request) {
        User user = new User();
        BeanUtil.copyProperties(userService.getLoginUser(request), user);
        long id = deleteRequest.getPost_id();
        // 判断是否存在
        Post oldPost = this.getById(id);
        ThrowUtils.throwIf(oldPost == null, ErrorCode.NOT_FOUND_ERROR);
        // 仅本人或管理员可删除
        if (!oldPost.getUserId().equals(user.getUser_id()) && !user.getRole().equals(UserConstant.ADMIN_ROLE)) {
            throw new BusinessException(ErrorCode.NO_AUTH_ERROR);
        }
        boolean b = this.removeById(id);
        return true;
    }

    @Override
    public void validPost(Post post, boolean add) {
        if (post == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        String title = post.getTitle();
        String content = post.getContent();
        String tags = post.getTags();
        // 创建时，参数不能为空
        if (add) {
            ThrowUtils.throwIf(StringUtils.isAnyBlank(title, content, tags), ErrorCode.PARAMS_ERROR);
        }
        // 有参数则校验
        if (StringUtils.isNotBlank(title) && title.length() > 80) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "标题过长");
        }
        if (StringUtils.isNotBlank(content) && content.length() > 10000) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "内容过长");
        }
    }

    /**
     * 多类型搜索
     *
     * @param searchText 搜索文本
     */
    @Override
    public List<PostVO> getPostsBySearchText(String searchText) {
        QueryWrapper<Post> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("createTime");
        if (StringUtils.isBlank(searchText)) {

            List<Post> posts = this.list(queryWrapper);
            List<PostVO> postVOS = posts.stream().map(post1 -> PostVO.objToVo(post1)).collect(java.util.stream.Collectors.toList());
            postVOS.forEach(postVO -> {
                postVO.setUser(userService.getUserByUserId(postVO.getUserId()));
            });
            return postVOS;
        }
        queryWrapper.like("title", searchText)
                .or()
                .like("content", searchText)
                .or()
                .like("tags", searchText);
        List<Post> posts = this.list(queryWrapper);
        List<PostVO> postVOS = posts.stream().map(post1 -> PostVO.objToVo(post1)).collect(java.util.stream.Collectors.toList());
        postVOS.forEach(postVO -> {
            postVO.setUser(userService.getUserByUserId(postVO.getUserId()));
        });
        return postVOS;
    }

    /**
     * 获取当前用户创建的资源列表
     */
    @Override
    public List<PostVO> getMyPostsVO(HttpServletRequest request) {
        User loginUser = new User();
        BeanUtils.copyProperties(userService.getLoginUser(request), loginUser);

        QueryWrapper<Post> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("userId", loginUser.getUser_id());
        List<Post> posts = this.list(queryWrapper);
        List<PostVO> postVOS = posts.stream().map(post1 -> PostVO.objToVo(post1)).collect(java.util.stream.Collectors.toList());
        postVOS.forEach(postVO -> {
            postVO.setUser(userService.getUserByUserId(loginUser.getUser_id()));
        });
        return postVOS;
    }

    /**
     * 获取指定数量的VO
     */
    @Override
    public List<PostVO> getPostsVOByNumber(int number) {
        QueryWrapper<Post> queryWrapper = new QueryWrapper<>();
        queryWrapper.last("limit " + number).orderByDesc("createTime");
        List<Post> posts = this.list(queryWrapper);
        List<PostVO> postVOS = posts.stream().map(post1 -> PostVO.objToVo(post1)).collect(java.util.stream.Collectors.toList());
        postVOS.forEach(postVO -> {
            postVO.setUser(userService.getUserByUserId(postVO.getUserId()));
        });
        return postVOS;
    }

    /**
     * 编辑帖子（用户）
     */
    @Override
    public boolean editPost(@RequestBody PostEditRequest postEditRequest, HttpServletRequest request) {
        if (postEditRequest == null || postEditRequest.getId() <= 0) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        Post post = new Post();
        BeanUtils.copyProperties(postEditRequest, post);
        List<String> tags = postEditRequest.getTags();
        if (tags != null) {
            post.setTags(JSONUtil.toJsonStr(tags));
        }
        // 参数校验
        this.validPost(post, false);
        User loginUser = new User();
        BeanUtils.copyProperties(userService.getLoginUser(request), loginUser);
        long id = postEditRequest.getId();
        // 判断是否存在
        Post oldPost = this.getById(id);
        ThrowUtils.throwIf(oldPost == null, ErrorCode.NOT_FOUND_ERROR);
        // 仅本人或管理员可编辑
        if (!oldPost.getUserId().equals(loginUser.getUser_id()) && !loginUser.getRole().equals(UserConstant.ADMIN_ROLE)) {
            throw new BusinessException(ErrorCode.NO_AUTH_ERROR);
        }
        boolean result = this.updateById(post);
        return result;
    }

    /**
     * 更新（仅管理员）
     */
    @Override
    public boolean updatePost(@RequestBody PostUpdateRequest postUpdateRequest) {
        Post post = new Post();
        BeanUtils.copyProperties(postUpdateRequest, post);
        List<String> tags = postUpdateRequest.getTagList();
        if (tags != null) {
            post.setTags(JSONUtil.toJsonStr(tags));
        }
        // 参数校验
        this.validPost(post, false);
        long id = postUpdateRequest.getId();
        // 判断是否存在
        Post oldPost = this.getById(id);
        ThrowUtils.throwIf(oldPost == null, ErrorCode.NOT_FOUND_ERROR);
        boolean result = this.updateById(post);
        return result;
    }

    /**
     * 通过id获取
     */
    @Override
    public PostVO getPostById(Long id) {
        Post post = this.getById(id);
        if (post == null) {
            throw new BusinessException(ErrorCode.NOT_FOUND_ERROR, "资源不存在");
        }
        PostVO postVO = PostVO.objToVo(post);
        postVO.setUser(userService.getUserByUserId(post.getUserId()));
        return postVO;
    }

    /**
     * 获取全部标签名称
     */
    @Override
    public List<String> getAllTags() {
        List<Post> posts = this.list();
        PostTagUtils postTagUtils = new PostTagUtils();
        return postTagUtils.getAllTags(posts);
    }


}




