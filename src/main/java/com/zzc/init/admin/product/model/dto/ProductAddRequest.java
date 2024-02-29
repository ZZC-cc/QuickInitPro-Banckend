package com.zzc.init.admin.product.model.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * 创建请求
 */
@Data
public class ProductAddRequest implements Serializable {

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
    private String tags;

    /**
     * 价格
     */
    private Double price;

    /**
     * 库存
     */
    private int stock;
}
