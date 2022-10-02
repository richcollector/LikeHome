package com.guest.likehome.order.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.guest.likehome.vo.CartVo;
import com.guest.likehome.vo.CustomerVo;
import com.guest.likehome.vo.OrderDetailVo;
import com.guest.likehome.vo.OrderVo;
import com.guest.likehome.vo.ProductVo;
import com.guest.likehome.vo.VendorVo;

public interface OrderSQLMapper {

	//장바구니 관련
	public void insertCart(CartVo cartVo);
	public void updateCartProductQuantity(CartVo cartVo);
	public void deleteCartByCartNo(int cartNo);
	public CartVo selectCartByCartNo(int cartNo);
	public ArrayList<CartVo> selectCartByCustomerNo(int customerNo);
	public CartVo selectCartByCustomerNoAndProductNo(CartVo cartVo);
	
	//주문 관련
	public int createOrderPK();
	public void insertOrder(OrderVo orderVo);
	public void insertOrderDetail(OrderDetailVo orderDetailVo);
	public ArrayList<OrderDetailVo> selectOrderDetailByOrderNo(
			@Param("orderNo") int orderNo,
			@Param("deliveryStatus") int deliveryStatus);
	public OrderVo selectOrderByOrderNo(int orderNo);
	
	public int selectCartByCustomerNoAndProductNo(int customerNo, int productNo);
	public ArrayList<OrderVo> selectOrderByCustomerNo(int customerNo);
	
	//포인트관련
	public void updateCustomerTotalPoint(CustomerVo customerVo);
	
	//test
	public ArrayList<HashMap<String, Object>> selectCartMap(int customerNo);
	
}
