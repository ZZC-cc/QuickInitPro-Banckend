package com.zzc.init.admin.order.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zzc.init.admin.order.model.dto.OrderCreateRequest;
import com.zzc.init.admin.order.model.dto.OrderUpdateRequest;
import com.zzc.init.admin.order.model.entity.Order;
import com.zzc.init.admin.order.model.vo.OrderVO;
import com.zzc.init.admin.order.service.OrderService;
import com.zzc.init.admin.orderDetail.service.OrderDetailService;
import com.zzc.init.admin.user.service.UserService;
import com.zzc.init.constant.OrderConstant;
import com.zzc.init.mapper.OrderMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;

/**
 * 订单服务实现
 */
@Service
@Slf4j
public class OrderServiceImpl extends ServiceImpl<OrderMapper, Order> implements OrderService {

    @Resource
    private UserService userService;

    @Resource
    private OrderDetailService orderDetailService;

    /**
     * 创建订单
     */
    @Override
    public long createOrder(OrderCreateRequest createRequest) {
        Order order = new Order();
        BeanUtils.copyProperties(createRequest, order);
        order.setOrderTime(LocalDateTime.now());
        order.setStatus(0);//默认未支付
        save(order);
        return order.getId();
    }

    /**
     * 更新支付状态
     */
    @Override
    public boolean updatePayStatus(OrderUpdateRequest updateRequest) {
        Order order = this.getById(updateRequest.getId());
        if (Objects.equals(updateRequest.getStatus(), OrderConstant.PAY)) {
            order.setPayTime(LocalDateTime.now());
            order.setStatus(1);
        } else if (Objects.equals(updateRequest.getStatus(), OrderConstant.CANCEL)) {
            order.setStatus(2);
        } else if (Objects.equals(updateRequest.getStatus(), OrderConstant.CLOSE)) {
            order.setStatus(3);
        } else if (Objects.equals(updateRequest.getStatus(), OrderConstant.FINISH)) {
            order.setStatus(4);
        }

        return updateById(order);
    }

    /**
     * 获取全部订单VO列表
     */
    @Override
    public List<OrderVO> getAllOrderVO() {
        QueryWrapper<Order> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("createTime");
        List<Order> orders = this.list(queryWrapper);
        List<OrderVO> orderVOS = orders.stream().map(OrderVO::objToVo).collect(java.util.stream.Collectors.toList());
        for (OrderVO orderVO : orderVOS) {
            orderVO.setUser(userService.getUserByUserId(orderVO.getUserId()));
            orderVO.setOrderDetails(orderDetailService.getOrderDetailByOrderId(orderVO.getId()));
        }
        return orderVOS;
    }

    /**
     * 多类型搜索
     */
    @Override
    public List<OrderVO> searchOrderVO(String searchText) {
        QueryWrapper<Order> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("createTime");
        queryWrapper.like("name", searchText).or().like("phone", searchText).or().like("address", searchText).like("payMethod", searchText);
        List<Order> orders = this.list(queryWrapper);
        List<OrderVO> orderVOS = orders.stream().map(OrderVO::objToVo).collect(java.util.stream.Collectors.toList());
        for (OrderVO orderVO : orderVOS) {
            orderVO.setUser(userService.getUserByUserId(orderVO.getUserId()));
            orderVO.setOrderDetails(orderDetailService.getOrderDetailByOrderId(orderVO.getId()));
        }
        return orderVOS;
    }

    /**
     * 根据用户id获取个人全部订单VO
     */
    @Override
    public List<OrderVO> getMyOrderVO(Long user_id) {
        QueryWrapper<Order> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("createTime");
        queryWrapper.eq("userId", user_id);
        List<Order> orders = this.list(queryWrapper);
        List<OrderVO> orderVOS = orders.stream().map(OrderVO::objToVo).collect(java.util.stream.Collectors.toList());
        for (OrderVO orderVO : orderVOS) {
            orderVO.setUser(userService.getUserByUserId(orderVO.getUserId()));
            orderVO.setOrderDetails(orderDetailService.getOrderDetailByOrderId(orderVO.getId()));
        }
        return orderVOS;
    }
}




