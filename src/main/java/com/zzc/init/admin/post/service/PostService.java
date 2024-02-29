package com.zzc.init.admin.post.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.zzc.init.admin.post.model.dto.PostAddRequest;
import com.zzc.init.admin.post.model.dto.PostDeleteRequest;
import com.zzc.init.admin.post.model.dto.PostEditRequest;
import com.zzc.init.admin.post.model.dto.PostUpdateRequest;
import com.zzc.init.admin.post.model.entity.Post;
import com.zzc.init.admin.post.model.vo.PostVO;
import org.springframework.web.bind.annotation.RequestBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 帖子服务
 */
public interface PostService extends IService<Post> {

    boolean addPost(PostAddRequest postAddRequest, HttpServletRequest request);

    boolean deletePost(PostDeleteRequest deleteRequest, HttpServletRequest request);

    /**
     * 校验
     *
     * @param post
     * @param add
     */
    void validPost(Post post, boolean add);

    List<PostVO> getPostsBySearchText(String searchText);

    List<PostVO> getMyPostsVO(HttpServletRequest request);

    boolean editPost(@RequestBody PostEditRequest postEditRequest, HttpServletRequest request);

    boolean updatePost(@RequestBody PostUpdateRequest postUpdateRequest);

    PostVO getPostById(Long id);

    List<String> getAllTags();


}
