package com.zzc.init.admin.order.model.dto;

import com.zzc.init.admin.orderDetail.model.dto.OrderDetailCreateRequest;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * 创建请求
 */
@Data
public class OrderCreateRequest implements Serializable {

    /**
     * 收货人姓名
     */
    private String name;

    /**
     * 收货人电话
     */
    private String phone;

    /**
     * 收货详细地址
     */
    private String address;


    /**
     * 总价
     */
    private Double totalPrice;

    /**
     * 支付方式
     */
    private String payMethod;

    /**
     * 商品数量
     */
    private int count;

    /**
     * 用户id
     */
    private long userId;

    List<OrderDetailCreateRequest> orderDetails;
}
