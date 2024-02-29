package com.zzc.init.admin.order.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zzc.init.admin.order.model.dto.OrderCreateRequest;
import com.zzc.init.admin.order.model.dto.OrderUpdateRequest;
import com.zzc.init.admin.order.model.entity.Order;
import com.zzc.init.admin.order.model.vo.OrderVO;

import java.util.List;

/**
 * 订单服务
 */
public interface OrderService extends IService<Order> {


    long createOrder(OrderCreateRequest createRequest);

    boolean updatePayStatus(OrderUpdateRequest updateRequest);

    List<OrderVO> getAllOrderVO();

    List<OrderVO> getOrderVOByNumber(int number);

    List<OrderVO> searchOrderVO(String searchText);

    List<OrderVO> getMyOrderVO(Long user_id);
}
