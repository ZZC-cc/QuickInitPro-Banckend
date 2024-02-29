package com.zzc.init.admin.order.model.vo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.zzc.init.admin.order.model.entity.Order;
import com.zzc.init.admin.orderDetail.model.vo.OrderDetailVO;
import com.zzc.init.admin.user.model.vo.UserVO;
import lombok.Data;
import org.springframework.beans.BeanUtils;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

/**
 * 商品VO
 */
@Data
public class OrderVO implements Serializable {

    /**
     * id
     */
    @TableId(type = IdType.ASSIGN_ID)
    private Long id;

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
     * 支付方式
     */
    private String payMethod;


    /**
     * 总价
     */
    private Double totalPrice;

    /**
     * 状态：0-未支付，1-已支付，2-已取消，3-已关闭，4-已发货，5-已收货
     */
    private int status;

    /**
     * 商品数量
     */
    private int count;

    /**
     * 用户id
     */
    private Long userId;

    private UserVO user;

    private List<OrderDetailVO> orderDetails;

    /**
     * 下单时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime orderTime;

    /**
     * 支付时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime payTime;

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
     * @param orderVO
     * @return
     */
    public static OrderVO voToObj(OrderVO orderVO) {
        if (orderVO == null) {
            return null;
        }
        OrderVO order = new OrderVO();
        BeanUtils.copyProperties(orderVO, order);
        return order;
    }

    /**
     * 对象转包装类
     *
     * @param order
     * @return
     */
    public static OrderVO objToVo(Order order) {
        if (order == null) {
            return null;
        }
        OrderVO orderVO = new OrderVO();
        BeanUtils.copyProperties(order, orderVO);
        return orderVO;
    }
}
