package com.zzc.init.admin.post.controller;

import com.zzc.init.admin.comment.service.CommentService;
import com.zzc.init.admin.post.model.dto.*;
import com.zzc.init.admin.post.model.vo.PostVO;
import com.zzc.init.admin.post.service.PostService;
import com.zzc.init.annotation.AuthCheck;
import com.zzc.init.common.BaseResponse;
import com.zzc.init.common.ErrorCode;
import com.zzc.init.common.ResultUtils;
import com.zzc.init.constant.UserConstant;
import com.zzc.init.exception.BusinessException;
import io.swagger.v3.oas.annotations.Operation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 帖子接口
 */
@RestController
@RequestMapping("/post")
@Slf4j
public class PostController {

    @Resource
    private PostService postService;

    @Resource
    private CommentService commentService;


    /**
     * 创建
     *
     * @param postAddRequest
     * @param request
     * @return
     */
    @PostMapping("/add")
    @Operation(summary = "创建帖子")
    public BaseResponse<String> addPost(@RequestBody PostAddRequest postAddRequest, HttpServletRequest request) {
        if (postAddRequest == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        boolean b = postService.addPost(postAddRequest, request);
        if (b) {
            return ResultUtils.success("添加帖子成功");
        } else {
            return ResultUtils.error(ErrorCode.OPERATION_ERROR);
        }
    }

    /**
     * 删除
     *
     * @param deleteRequest
     * @param request
     * @return
     */
    @Operation(summary = "删除帖子")
    @PostMapping("/delete")
    public BaseResponse<String> deletePost(@RequestBody PostDeleteRequest deleteRequest, HttpServletRequest request) {
        if (deleteRequest == null || deleteRequest.getPost_id() <= 0) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        boolean b = postService.deletePost(deleteRequest, request);
        //删除评论
        commentService.deleteCommentsByPostId(deleteRequest.getPost_id());
        if (b) {
            return ResultUtils.success("删除帖子成功");
        } else {
            return ResultUtils.error(ErrorCode.OPERATION_ERROR);
        }
    }

    /**
     * 更新
     *
     * @param postUpdateRequest
     * @return
     */
    @Operation(summary = "更新帖子")
    @PostMapping("/update")
    @AuthCheck(mustRole = UserConstant.ADMIN_ROLE)
    public BaseResponse<String> updatePost(@RequestBody PostUpdateRequest postUpdateRequest) {
        if (postUpdateRequest == null || postUpdateRequest.getId() <= 0) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        boolean b = postService.updatePost(postUpdateRequest);
        if (b) {
            return ResultUtils.success("更新帖子成功");
        } else {
            return ResultUtils.error(ErrorCode.OPERATION_ERROR);
        }
    }
//
//    /**
//     * 根据 id 获取
//     *
//     * @param id
//     * @return
//     */
//    @GetMapping("/get/vo")
//    public BaseResponse<PostVO> getPostVOById(long id, HttpServletRequest request) {
//        if (id <= 0) {
//            throw new BusinessException(ErrorCode.PARAMS_ERROR);
//        }
//        Post post = postService.getById(id);
//        if (post == null) {
//            throw new BusinessException(ErrorCode.NOT_FOUND_ERROR);
//        }
//        return ResultUtils.success(postService.getPostVO(post, request));
//    }
//

    /**
     * 获取列表（仅管理员）
     *
     * @param postQueryRequest
     * @return
     */
    @Operation(summary = "获取帖子列表")
    @PostMapping("/list")
//    @AuthCheck(mustRole = UserConstant.ADMIN_ROLE)
    public BaseResponse<List<PostVO>> listPostByPage(@RequestBody PostQueryRequest postQueryRequest) {
        List<PostVO> posts = postService.getPostsBySearchText(postQueryRequest.getSearchText());
        return ResultUtils.success(posts);
    }
//
//    /**
//     * 分页获取列表（封装类）
//     *
//     * @param postQueryRequest
//     * @param request
//     * @return
//     */
//    @PostMapping("/list/page/vo")
//    public BaseResponse<Page<PostVO>> listPostVOByPage(@RequestBody PostQueryRequest postQueryRequest,
//                                                       HttpServletRequest request) {
//        long current = postQueryRequest.getCurrent();
//        long size = postQueryRequest.getPageSize();
//        // 限制爬虫
//        ThrowUtils.throwIf(size > 20, ErrorCode.PARAMS_ERROR);
//        Page<Post> postPage = postService.page(new Page<>(current, size),
//                postService.getQueryWrapper(postQueryRequest));
//        return ResultUtils.success(postService.getPostVOPage(postPage, request));
//    }
//

    /**
     * 获取当前用户创建的资源列表
     *
     * @param request
     * @return
     */
    @PostMapping("/my/list/vo")
    @Operation(summary = "获取当前用户创建的资源列表")
    public BaseResponse<List<PostVO>> listMyPostVO(HttpServletRequest request) {
        List<PostVO> myPostsVO = postService.getMyPostsVO(request);
        return ResultUtils.success(myPostsVO);
    }
//
//    // endregion
//
//    /**
//     * 分页搜索（从 ES 查询，封装类）
//     *
//     * @param postQueryRequest
//     * @param request
//     * @return
//     */
//    @PostMapping("/search/page/vo")
//    public BaseResponse<Page<PostVO>> searchPostVOByPage(@RequestBody PostQueryRequest postQueryRequest,
//                                                         HttpServletRequest request) {
//        long size = postQueryRequest.getPageSize();
//        // 限制爬虫
//        ThrowUtils.throwIf(size > 20, ErrorCode.PARAMS_ERROR);
//        Page<Post> postPage = postService.searchFromEs(postQueryRequest);
//        return ResultUtils.success(postService.getPostVOPage(postPage, request));
//    }
//

    /**
     * 多类型搜索
     *
     * @param searchText 搜索文本
     */
    @GetMapping("/search")
    @Operation(summary = "多类型搜索")
    public BaseResponse<List<PostVO>> searchPostBySearchText(@RequestParam(value = "searchText", required = false) String searchText) {
        List<PostVO> posts = postService.getPostsBySearchText(searchText);
        return ResultUtils.success(posts);
    }

    /**
     * 通过id获取文章
     */
    @GetMapping("/get/vo")
    @Operation(summary = "通过id获取文章")
    public BaseResponse<PostVO> getPostVOById(long id) {
        return ResultUtils.success(postService.getPostById(id));
    }

    /**
     * 获取全部标签名称
     */
    @GetMapping("/get/all/tags")
    @Operation(summary = "获取全部标签名称")
    public BaseResponse<List<String>> getAllTags() {
        List<String> tags = postService.getAllTags();
        return ResultUtils.success(tags);
    }


}
