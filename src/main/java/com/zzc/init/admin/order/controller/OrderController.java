package com.zzc.init.admin.order.controller;

import com.zzc.init.admin.order.model.dto.OrderCreateRequest;
import com.zzc.init.admin.order.model.dto.OrderUpdateRequest;
import com.zzc.init.admin.order.model.vo.OrderVO;
import com.zzc.init.admin.order.service.OrderService;
import com.zzc.init.admin.orderDetail.service.OrderDetailService;
import com.zzc.init.common.BaseResponse;
import com.zzc.init.common.DeleteRequest;
import com.zzc.init.common.ErrorCode;
import com.zzc.init.common.ResultUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * 订单接口
 */
@RestController
@RequestMapping("/order")
@Slf4j
public class OrderController {

    @Resource
    private OrderService orderService;

    @Resource
    private OrderDetailService orderDetailsService;


    /**
     * 创建订单
     */
    @PostMapping("/create")
    public BaseResponse<Long> createOrder(@RequestBody OrderCreateRequest createRequest) {
        Long orderId = orderService.createOrder(createRequest);
        boolean res = orderDetailsService.createOrderDetail(createRequest.getOrderDetails(), orderId);
        if (!res) {
            return ResultUtils.error(ErrorCode.PARAMS_ERROR, "创建订单失败！");
        }
        return ResultUtils.success(orderId);
    }

    /**
     * 更新支付状态
     */
    @PostMapping("/update/pay/status")
    public BaseResponse<String> updatePayStatus(@RequestBody OrderUpdateRequest orderUpdateRequest) {
        boolean res = orderService.updatePayStatus(orderUpdateRequest);
        if (!res) {
            return ResultUtils.error(ErrorCode.PARAMS_ERROR, "操作失败");
        }
        return ResultUtils.success("操作成功");
    }

    /**
     * 获取全部订单VO列表
     */
    @PostMapping("/get/all/vo")
    public BaseResponse<List<OrderVO>> getAllOrderVO() {
        return ResultUtils.success(orderService.getAllOrderVO());
    }

    /**
     * 通过id获取订单VO
     */
    @GetMapping("/get/vo")
    public BaseResponse<OrderVO> getOrderVOById(@RequestParam Long id) {
        return ResultUtils.success(OrderVO.objToVo(orderService.getById(id)));
    }

    /**
     * 删除订单
     */
    @PostMapping("/delete")
    public BaseResponse<String> deleteOrder(@RequestBody DeleteRequest deleteRequest) {
        boolean res = orderService.removeById(deleteRequest.getId());
        if (!res) {
            return ResultUtils.error(ErrorCode.PARAMS_ERROR, "删除失败");
        }
        return ResultUtils.success("删除成功");
    }

    /**
     * 多类型搜索
     */
    @GetMapping("/search")
    public BaseResponse<List<OrderVO>> searchOrderBySearchText(@RequestParam(value = "searchText", required = false) String searchText) {
        return ResultUtils.success(orderService.searchOrderVO(searchText));
    }

    /**
     * 获取个人全部订单列表
     */
    @PostMapping("/get/my/all/vo")
    public BaseResponse<List<OrderVO>> getAllMyOrderVO(@RequestBody DeleteRequest request) {
        return ResultUtils.success(orderService.getMyOrderVO(request.getId()));
    }
}
