
package com.guest.likehome.order.controller;


import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.support.PropertiesBeanDefinitionReader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonParser;
import com.guest.likehome.customer.mapper.CustomerSQLMapper;
import com.guest.likehome.customer.service.CustomerServiceImpl;
import com.guest.likehome.order.service.OrderServiceImpl;
import com.guest.likehome.product.mapper.ProductSQLMapper;
import com.guest.likehome.product.service.ProductServiceImpl;
import com.guest.likehome.vo.AddressVo;
import com.guest.likehome.vo.CartVo;
import com.guest.likehome.vo.CustomerVo;
import com.guest.likehome.vo.OrderDetailVo;
import com.guest.likehome.vo.OrderVo;
import com.guest.likehome.vo.ProductReviewVo;
import com.guest.likehome.vo.ProductVo;
import com.guest.likehome.vo.SubpostVo;

@Controller
@RequestMapping("/order/*")
public class OrderController {

	@Autowired
	private OrderServiceImpl orderService;
	@Autowired
	private CustomerServiceImpl customerService;
	
	
	
	@RequestMapping("cartPage")
	public String cartPage(Model model, HttpSession session) {
		
		//나의 customer_no 추출
		CustomerVo sessionCustomer = (CustomerVo)session.getAttribute("customerInfo");
		int customerNo = sessionCustomer.getCustomer_no(); 
		
		model.addAttribute("cartDataList", orderService.getCartList(customerNo));
		return "order/cartPage";
	}
		
	
	//주문정보 입력하는 페이지로 이동
	@RequestMapping("orderPage")
	public String orderPage(Model model, int[] cartNo, HttpSession session) {
		
		//나의 customer_no 추출
		CustomerVo sessionCustomer = (CustomerVo)session.getAttribute("customerInfo");
		int customerNo = sessionCustomer.getCustomer_no(); 
		
		System.out.println(sessionCustomer.getCustomer_total_point());
		
		model.addAttribute("addressList", customerService.getCustomerAddressList(customerNo));
		model.addAttribute("dataList", orderService.getCartListToOrder(cartNo));
		model.addAttribute("customerTotalPoint", sessionCustomer.getCustomer_total_point());
		model.addAttribute("couponList", customerService.getMyCouponList(customerNo));
		return "order/orderPage";
	}
	
	@RequestMapping("buyNowProcess")
	public String buyNowProcess(Model model, CartVo param, HttpSession session) {
		
		//나의 customer_no 추출
		CustomerVo sessionCustomer = (CustomerVo)session.getAttribute("customerInfo");
		int customerNo = sessionCustomer.getCustomer_no(); 
		
		param.setCustomer_no(customerNo);
		
		//카트에 없으면 인서트
		if(orderService.checkCart(param) == null) {
			orderService.addToCart(param);
		//카트에 이미 있다면 해당 수량으로 변경
		}else {
			orderService.updateCartProductQuantity(param);
		}
		
		CartVo cartVo = orderService.checkCart(param);
		int cartNo = cartVo.getCart_no();
		
		int[] cart_no = {cartNo};
		
		model.addAttribute("addressList", customerService.getCustomerAddressList(customerNo));
		model.addAttribute("customerTotalPoint", sessionCustomer.getCustomer_total_point());
		model.addAttribute("dataList",orderService.getCartListToOrder(cart_no));
		
		return "order/orderPage";
	}
	
	
	//주문정보 insert 프로세스
	@RequestMapping("orderProcess")
	public String orderProcess(OrderVo orderVo, int[] cart_no, Model model, HttpSession session) {
		
		System.out.println(orderVo.getOrder_purchaser_name());
		System.out.println(orderVo.getOrder_total_amount());
		//order info setting
		CustomerVo sessionCustomer = (CustomerVo)session.getAttribute("customerInfo");
		int customerNo = sessionCustomer.getCustomer_no(); //주문자 CustomerNo 추출
		orderVo.setCustomer_no(customerNo);
		
		//cart delete after order
//			for(int cartNo : cart_no) {
//				orderService.deleteCart(cartNo);
//			}
		
		//insert and get orderNo
		int orderNo = orderService.insertOrderAndOrderDetailInfo(orderVo, cart_no);
		
		return "redirect: ./orderCompletePage?orderNo="+ orderNo;
	}

	//주문상세보기로 이동
	@RequestMapping("orderDetailPage")
	public String orderDetailPage(int order_no, Model model, @RequestParam(value= "deliveryStatus", defaultValue = "3") int deliveryStatus) {
		
		model.addAttribute("dataList",orderService.getOrderDetailList(order_no, deliveryStatus));
		model.addAttribute("orderVo", orderService.getOrder(order_no));
		
		return "order/orderDetailPage";
	}
	
	@RequestMapping("orderCompletePage")
	public String orderCompletePage(int orderNo, Model model) {
		model.addAttribute("orderVo", orderService.getOrder(orderNo));
		return "order/orderCompletePage";
	}
	
	@RequestMapping("payWithKakaoPayProcess")
	public String payWithKakaoPayProcess(HttpServletRequest request) throws IOException{

		System.out.println(request.getParameter("order_receiver_name"));
//		System.out.println(orderVo.getOrder_receiver_name());
//		System.out.println(orderVo.getOrder_receiver_address1());
		
		URL url = new URL("https://kapi.kakao.com//v1/payment/ready");
		HttpURLConnection serverConnection = (HttpURLConnection)url.openConnection();
		serverConnection.setRequestMethod("POST");
		serverConnection.setRequestProperty("Authorization", "KakaoAK 5aec7610795a5137ea35cfb932191718");
		serverConnection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		serverConnection.setDoOutput(true);
		
		String param = "cid=TC0ONETIME"
				+ "&partner_order_id=partner_order_id"
				+ "&partner_user_id=partner_user_id"
				+ "&item_name=초코파이"
				+ "&quantity=1"
				+ "&total_amount=2200"
				+ "&tax_free_amount=0"
				+ "&approval_url=http://localhost:8181/likehome/order/orderCompletePage"
				+ "&cancel_url=http://localhost:8181/likehome/order/orderCompletePage"
				+ "&fail_url=http://localhost:8181/likehome/order/orderCompletePage";
		
		OutputStream output = serverConnection.getOutputStream();
		DataOutputStream dataoutput = new DataOutputStream(output);
		dataoutput.writeBytes(param);
		dataoutput.close(); 
		
		int resultCode = serverConnection.getResponseCode();
		
		InputStream input;
		if(resultCode == 200) {
			input = serverConnection.getInputStream();
		}else {
			input = serverConnection.getErrorStream();
		}
		
		InputStreamReader reader = new InputStreamReader(input);
		BufferedReader bf = new BufferedReader(reader);
		
		
		return bf.readLine();
	}
	
	@RequestMapping("registerReviewProcess")
	public String registerReviewProcess(HttpSession session, MultipartFile [] review_image , ProductReviewVo productReviewVo) {
		
		CustomerVo sessionCustomer = (CustomerVo)session.getAttribute("customerInfo");
		int customerNo = sessionCustomer.getCustomer_no(); 
		
		productReviewVo.setCustomer_no(customerNo);
		
		
		return "";
	}
	
}




























