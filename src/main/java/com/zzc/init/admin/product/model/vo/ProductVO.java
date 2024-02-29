package com.zzc.init.admin.product.model.vo;

import cn.hutool.json.JSONUtil;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.zzc.init.admin.product.model.entity.Product;
import lombok.Data;
import org.springframework.beans.BeanUtils;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

/**
 * 商品VO
 */
@Data
public class ProductVO implements Serializable {

    /**
     * id
     */
    private Long id;

    /**
     * 标题
     */
    private String title;

    /**
     * 商品图片
     */
    private String images;

    /**
     * 商品描述
     */
    private String description;

    /**
     * 标签列表
     */
    private List<String> tags;

    /**
     * 价格
     */
    private Double price;

    /**
     * 库存
     */
    private int stock;

    /**
     * 是否上架
     */
    private Integer isShelves;

    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime createTime;

    /**
     * 更新时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime updateTime;


    /**
     * 包装类转对象
     *
     * @param productVO
     * @return
     */
    public static Product voToObj(ProductVO productVO) {
        if (productVO == null) {
            return null;
        }
        Product product = new Product();
        BeanUtils.copyProperties(productVO, product);
        List<String> tagList = productVO.getTags();
        product.setTags(JSONUtil.toJsonStr(tagList));
        return product;
    }

    /**
     * 对象转包装类
     *
     * @param product
     * @return
     */
    public static ProductVO objToVo(Product product) {
        if (product == null) {
            return null;
        }
        ProductVO productVO = new ProductVO();
        BeanUtils.copyProperties(product, productVO);
        String tags = product.getTags();
        productVO.setTags(JSONUtil.toList(tags, String.class));
        return productVO;
    }
}
