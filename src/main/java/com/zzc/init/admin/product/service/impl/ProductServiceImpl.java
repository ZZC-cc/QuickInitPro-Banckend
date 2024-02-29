package com.zzc.init.admin.product.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zzc.init.admin.product.model.dto.ProductAddRequest;
import com.zzc.init.admin.product.model.dto.ProductUpdateRequest;
import com.zzc.init.admin.product.model.entity.Product;
import com.zzc.init.admin.product.model.vo.ProductVO;
import com.zzc.init.admin.product.service.ProductService;
import com.zzc.init.mapper.ProductMapper;
import com.zzc.init.utils.ProductTagUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

/**
 * 帖子服务实现
 */
@Service
@Slf4j
public class ProductServiceImpl extends ServiceImpl<ProductMapper, Product> implements ProductService {

    /**
     * 添加商品
     */
    @Override
    public boolean addProduct(ProductAddRequest addRequest) {
        // 1. 验证商品
        this.validProduct(addRequest);
        // 2. 添加商品
        Product product = new Product();
        BeanUtils.copyProperties(addRequest, product);
        return this.save(product);
    }

    /**
     * 获取所有商品VO列表（管理员）
     */
    @Override
    public List<ProductVO> getAllProductsByAdmin() {
        QueryWrapper<Product> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("createTime");
        List<Product> products = this.list(queryWrapper);
        List<ProductVO> productVOS = products.stream().map(ProductVO::objToVo).collect(Collectors.toList());
        return productVOS;
    }

    /**
     * 获取所有商品VO列表（用户）
     */
    @Override
    public List<ProductVO> getAllProductsByUser() {
        QueryWrapper<Product> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("createTime")
                .eq("is_shelves", 1);
        List<Product> products = this.list(queryWrapper);
        List<ProductVO> productVOS = products.stream().map(ProductVO::objToVo).collect(Collectors.toList());
        return productVOS;
    }

    /**
     * 更新商品
     */
    @Override
    public boolean updateProduct(ProductUpdateRequest updateRequest) {
        // 1. 验证商品
        this.validProduct(updateRequest);
        // 2. 更新商品
        Product product = new Product();
        BeanUtils.copyProperties(updateRequest, product);
        return this.updateById(product);
    }

    /**
     * 切换商品上下架状态
     */
    @Override
    public String changeShelvesStatus(Long id) {
        Product product = this.getById(id);
        if (product.getIsShelves() == 1) {
            product.setIsShelves(0);
            this.updateById(product);
            return "下架成功";
        } else {
            product.setIsShelves(1);
            this.updateById(product);
            return "上架成功";
        }
    }

    /**
     * 多类型搜索
     */
    @Override
    public List<ProductVO> searchProductBySearchText(String searchText) {
        QueryWrapper<Product> queryWrapper = new QueryWrapper<>();
        queryWrapper.like("title", searchText)
                .or()
                .like("tags", searchText)
                .or()
                .like("description", searchText)
                .orderByDesc("createTime");
        List<Product> products = this.list(queryWrapper);
        List<ProductVO> productVOS = products.stream().map(ProductVO::objToVo).collect(Collectors.toList());
        return productVOS;
    }

    /**
     * 获取全部标签名称
     */
    @Override
    public List<String> getAllTags() {
        List<Product> list = this.list();
        ProductTagUtils productTagUtils = new ProductTagUtils();
        return productTagUtils.getAllTags(list);
    }

    /**
     * 通过id获取VO
     */
    @Override
    public ProductVO getProductById(Long id) {
        Product product = this.getById(id);
        ProductVO productVO = ProductVO.objToVo(product);
        return productVO;
    }

    /**
     * 通过标签名称获取商品列表
     */
    @Override
    public List<ProductVO> getProductsByTags(String tags) {
        QueryWrapper<Product> queryWrapper = new QueryWrapper<>();
        queryWrapper.like("tags", tags)
                .orderByDesc("createTime");
        List<Product> products = this.list(queryWrapper);
        List<ProductVO> productVOS = products.stream().map(ProductVO::objToVo).collect(Collectors.toList());
        return productVOS;
    }

    private <T> void validProduct(T request) {
        if (request instanceof ProductAddRequest) {
            ProductAddRequest product = (ProductAddRequest) request;
            // 1. 验证商品标题
            if (StringUtils.isEmpty(product.getTitle())) {
                throw new RuntimeException("商品标题不能为空");
            }
            // 2. 验证商品描述
            if (StringUtils.isEmpty(product.getDescription())) {
                throw new RuntimeException("商品描述不能为空");
            }
            // 3. 验证商品价格
            if (StringUtils.isEmpty(product.getPrice().toString())) {
                throw new RuntimeException("商品价格不能为空");
            }
            if (product.getPrice() <= 0) {
                throw new RuntimeException("商品价格必须大于 0");
            }
            // 4. 验证商品库存
            if (product.getStock() <= 0) {
                throw new RuntimeException("商品库存必须大于 0");
            }
            // 5. 验证商品图片
            if (StringUtils.isEmpty(product.getImages())) {
                throw new RuntimeException("商品图片不能为空");
            }
            // 6. 验证商品标签
            if (StringUtils.isEmpty(product.getTags())) {
                throw new RuntimeException("商品标签不能为空");
            }
            // 7. 验证商品描述
            if (StringUtils.isEmpty(product.getDescription())) {
                throw new RuntimeException("商品描述不能为空");
            }
        } else if (request instanceof ProductUpdateRequest) {
            ProductUpdateRequest product = (ProductUpdateRequest) request;
            // 1. 验证商品标题
            if (StringUtils.isEmpty(product.getTitle())) {
                throw new RuntimeException("商品标题不能为空");
            }
            // 2. 验证商品描述
            if (StringUtils.isEmpty(product.getDescription())) {
                throw new RuntimeException("商品描述不能为空");
            }
            // 3. 验证商品价格
            if (StringUtils.isEmpty(product.getPrice().toString())) {
                throw new RuntimeException("商品价格不能为空");
            }
            if (product.getPrice() <= 0) {
                throw new RuntimeException("商品价格必须大于 0");
            }
            // 4. 验证商品库存
            if (product.getStock() <= 0) {
                throw new RuntimeException("商品库存必须大于 0");
            }
            // 5. 验证商品图片
            if (StringUtils.isEmpty(product.getImages())) {
                throw new RuntimeException("商品图片不能为空");
            }
            // 6. 验证商品标签
            if (StringUtils.isEmpty(product.getTags())) {
                throw new RuntimeException("商品标签不能为空");
            }
            // 7. 验证商品描述
            if (StringUtils.isEmpty(product.getDescription())) {
                throw new RuntimeException("商品描述不能为空");
            }
            // 8. 验证商品id
            if (product.getId() == null || product.getId() <= 0) {
                throw new RuntimeException("商品id不能为空");
            }
        } else {
            throw new IllegalArgumentException("Invalid request type");
        }

    }

}




