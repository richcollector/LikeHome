package com.guest.likehome.order.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guest.likehome.customer.mapper.CustomerSQLMapper;
import com.guest.likehome.order.mapper.OrderSQLMapper;
import com.guest.likehome.product.mapper.ProductSQLMapper;
import com.guest.likehome.vendor.mapper.VendorSQLMapper;
import com.guest.likehome.vo.CartVo;
import com.guest.likehome.vo.CustomerCouponVo;
import com.guest.likehome.vo.CustomerVo;
import com.guest.likehome.vo.OrderDetailVo;
import com.guest.likehome.vo.OrderVo;
import com.guest.likehome.vo.ProductTitleImageVo;
import com.guest.likehome.vo.ProductVo;
import com.guest.likehome.vo.VendorVo;

@Service
public class OrderServiceImpl {

	@Autowired
	private OrderSQLMapper orderSQLMapper;
	@Autowired
	private ProductSQLMapper productSQLMapper;
	@Autowired
	private VendorSQLMapper vendorSQLMapper;
	@Autowired
	private CustomerSQLMapper customerSQLMapper;
	
	public CartVo getCart(int CartNo) {
		return orderSQLMapper.selectCartByCartNo(CartNo);
	}
	
	public CartVo checkCart(CartVo cartVo) {
		return orderSQLMapper.selectCartByCustomerNoAndProductNo(cartVo);
	}
	
	public void addToCart(CartVo param) {
		
		if(checkCart(param) == null) {
			orderSQLMapper.insertCart(param);
		}else {
			CartVo cartVo = checkCart(param);
			cartVo.setCart_product_quantity(param.getCart_product_quantity() + cartVo.getCart_product_quantity());
			updateCartProductQuantity(cartVo);
		}
	}
	
	public void deleteCart(int cartNo) {
		orderSQLMapper.deleteCartByCartNo(cartNo);
	}
	
	
	public void increaseQuantity(int cartNo) {
		CartVo cartVo = orderSQLMapper.selectCartByCartNo(cartNo);
		int updatedQuantity = cartVo.getCart_product_quantity() + 1;
		cartVo.setCart_product_quantity(updatedQuantity);
		
		orderSQLMapper.updateCartProductQuantity(cartVo);
	}
	
	public void decreaseQuantity(int cartNo) {
		CartVo cartVo = orderSQLMapper.selectCartByCartNo(cartNo);
		int updatedQuantity = cartVo.getCart_product_quantity() - 1;
		cartVo.setCart_product_quantity(updatedQuantity);
		orderSQLMapper.updateCartProductQuantity(cartVo);
	}
	
	//장바구니 추가할 때 
	public void updateCartProductQuantity(CartVo cartVo) {
		orderSQLMapper.updateCartProductQuantity(cartVo);
	}
	
	public ArrayList<HashMap<String, Object>> getCartList(int customerNo){
		
		ArrayList<HashMap<String, Object>> cartList = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<CartVo> cartVoList = orderSQLMapper.selectCartByCustomerNo(customerNo);
		
		for(CartVo cartVo : cartVoList) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			int productNo = cartVo.getProduct_no();
			ProductVo productVo = productSQLMapper.selectProductByProductNo(productNo);
			ProductTitleImageVo productTitleImageVo = vendorSQLMapper.selectByTitleImage(productNo).get(0);
			VendorVo vendorVo = vendorSQLMapper.selectVendorByVendorNo(productVo.getVendor_no());
			map.put("cartVo", cartVo);
			map.put("productVo", productVo);
			map.put("productTitleImageVo", productTitleImageVo);
			map.put("vendorVo", vendorVo);
			
			cartList.add(map);
		}
		return cartList;
	}
	
	//카트에서 주문할 때
	public ArrayList<HashMap<String, Object>> getCartListToOrder(int[] cart_no){
		
		ArrayList<HashMap<String, Object>> cartListToOrder = new ArrayList<HashMap<String,Object>>();
		
		for(int cartNo : cart_no ) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			CartVo cartVo = orderSQLMapper.selectCartByCartNo(cartNo);
			ProductVo productVo = productSQLMapper.selectProductByProductNo(cartVo.getProduct_no());
			ProductTitleImageVo productTitleImageVo = vendorSQLMapper.selectByTitleImage(cartVo.getProduct_no()).get(0);
			VendorVo vendorVo = vendorSQLMapper.selectVendorByVendorNo(productVo.getVendor_no());
			map.put("cartVo", cartVo);
			map.put("productVo", productVo);
			map.put("productTitleImageVo", productTitleImageVo);
			map.put("vendorVo", vendorVo);
			
			cartListToOrder.add(map);
			
		}
		return cartListToOrder;
	}
	

	public int insertOrderAndOrderDetailInfo(OrderVo orderVo, int[] cartNo) {
		
		//insert order
		int orderNo = orderSQLMapper.createOrderPK();
		orderVo.setOrder_no(orderNo);
		
		
		//주문번호 생성
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String orderDate = sdf.format(today);
		String subNum = "";
		for(int i = 1; i <= 4; i ++) {
			subNum += (int)(Math.random() * 10);
		}
		String orderCode = "L" + orderDate + subNum + orderNo;
		orderVo.setOrder_code(orderCode);
		
		orderSQLMapper.insertOrder(orderVo);
		
		//order detail setting
		for(int no : cartNo) {
			CartVo cartVo = orderSQLMapper.selectCartByCartNo(no);
			
			OrderDetailVo orderDetailVo = new OrderDetailVo();
			orderDetailVo.setOrder_no(orderNo);
			orderDetailVo.setProduct_no(cartVo.getProduct_no());
			orderDetailVo.setOrder_detail_quantity(cartVo.getCart_product_quantity());
			ProductVo productVo = productSQLMapper.selectProductByProductNo(cartVo.getProduct_no());
			orderDetailVo.setOrder_detail_quote_price(productVo.getProduct_price());
			
			orderSQLMapper.insertOrderDetail(orderDetailVo);
		}
		
		//사용쿠폰 인서트
		CustomerCouponVo customerCouponVo = new CustomerCouponVo();
		customerCouponVo.setCustomer_no(orderVo.getCustomer_no());
		customerCouponVo.setCoupon_no(orderVo.getCoupon_no());
		
		customerSQLMapper.updateCustomerCoupon(customerCouponVo);

		return orderNo; //바로 출력
	}
	
	
	public ArrayList<HashMap<String, Object>> getOrderDetailList(int orderNo, int deliveryStatus){
		
		ArrayList<HashMap<String, Object>> orderDetailList = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<OrderDetailVo> orderDetailVoList = orderSQLMapper.selectOrderDetailByOrderNo(orderNo, deliveryStatus);
				
		for(OrderDetailVo orderDetailVo : orderDetailVoList) {
			HashMap<String, Object> map = new HashMap<String, Object>();

			int productNo = orderDetailVo.getProduct_no();
			
			ProductVo productVo = productSQLMapper.selectProductByProductNo(productNo);
			VendorVo vendorVo = vendorSQLMapper.selectVendorByVendorNo(productVo.getVendor_no());
			ProductTitleImageVo productTitleImageVo = vendorSQLMapper.selectByTitleImage(productNo).get(0);
			map.put("orderDetailVo", orderDetailVo);
			map.put("productVo", productVo);
			map.put("vendorVo", vendorVo);
			map.put("productTitleImageVo", productTitleImageVo);
			
			orderDetailList.add(map);
		}
		return orderDetailList;
	}
	
	public OrderVo getOrder(int orderNo) {
		
		return orderSQLMapper.selectOrderByOrderNo(orderNo);
		
	}

	public ArrayList<HashMap<String, Object>> getOrderList(int customerNo, int deliveryStatus){
		
		ArrayList<HashMap<String, Object>> orderDataList = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<OrderVo> orderVoList = orderSQLMapper.selectOrderByCustomerNo(customerNo);
		
		for(OrderVo orderVo : orderVoList) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			if(!getOrderDetailList(orderVo.getOrder_no(), deliveryStatus).isEmpty()) {
				map.put("orderVo", orderVo);
				map.put("orderDetailList", getOrderDetailList(orderVo.getOrder_no(), deliveryStatus));
				orderDataList.add(map);
			}			
		}
		 return orderDataList;
	}
//	//map test
//	public ArrayList<HashMap<String, Object>> getCartList(int customerNo){
//		return orderSQLMapper.selectCartMap(customerNo);
//	}

}




	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

