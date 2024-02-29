package com.zzc.init.admin.product.model.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 商品
 */
@TableName(value = "product")
@Data
public class Product implements Serializable {

    /**
     * id
     */
    @TableId(type = IdType.ASSIGN_ID)
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
    private String tags;

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
     * 是否删除
     */
    @TableLogic
    private Integer isDelete;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

}
