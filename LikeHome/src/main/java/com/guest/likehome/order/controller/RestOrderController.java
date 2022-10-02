package com.guest.likehome.order.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.guest.likehome.order.service.OrderServiceImpl;
import com.guest.likehome.vo.CartVo;
import com.guest.likehome.vo.CustomerVo;
import com.guest.likehome.vo.OrderDetailVo;
import com.guest.likehome.vo.OrderVo;

@RestController
@RequestMapping("/order/*")
public class RestOrderController {
	
	@Autowired
	private OrderServiceImpl orderService;
	
	@RequestMapping("restAddToCartProcess")
	public HashMap<String, Object> restAddToCartProcess(CartVo param, HttpSession session){
		HashMap<String, Object> map = new HashMap<String, Object>();

		CustomerVo sessionCustomer = (CustomerVo)session.getAttribute("customerInfo");
		param.setCustomer_no(sessionCustomer.getCustomer_no());
		
		orderService.addToCart(param);
		
		return map;
	}
	
	
	//주문 후 삭제기능에도 사용가능할지
	@RequestMapping("restDeleteCartProcess")
	public HashMap<String, Object> restDeleteCartProcess(int cartNo) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		
		orderService.deleteCart(cartNo);
		
		map.put("result", "success");
		
		return map;
	}
	
	//+버튼으로 수량 올리기
	@RequestMapping("restIncreaseQuantityProcess")
	public HashMap<String, Object> restIncreaseQuantityProcess(int cartNo){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		orderService.increaseQuantity(cartNo);
		
		map.put("result", "success");
		return map;
	}
	
	//-버튼으로 수량 내리기
	@RequestMapping("restDecreaseQuantityProcess")
	public HashMap<String, Object> restDecreaseQuantityProcess(int cartNo){
		System.out.println(cartNo);
		HashMap<String, Object> map = new HashMap<String, Object>();
		orderService.decreaseQuantity(cartNo);
		
		map.put("result", "success");
		return map;
	}
	
	
	@RequestMapping("restCartPage")
	public HashMap<String, Object> restCartPage(HttpSession session) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		
		//나의 customer_no 추출
		CustomerVo sessionCustomer = (CustomerVo)session.getAttribute("customerInfo");
		int customerNo = sessionCustomer.getCustomer_no(); 
		
		
		map.put("result", "success");
		map.put("cartDataList", orderService.getCartList(customerNo));
		
		return map;
	}
	
	@RequestMapping("restUsePointAllProcess")
	public HashMap<String, Object> restUsePointAllProcess(){

		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("result", "success");
		map.put("customerTotalPoint", 0);
		return map;
	}
	
	@RequestMapping("restUsePointProcess")
	public HashMap<String, Object> restUsePointProcess(HttpSession session){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		//나의 customer_no 추출
		CustomerVo sessionCustomer = (CustomerVo)session.getAttribute("customerInfo");
		
		map.put("result", "success");
		map.put("customerTotalPoint", sessionCustomer.getCustomer_total_point());
		
		return map;
	}
	
	@RequestMapping("restPayWithKakaoPayProcess")
	public String restPayWithKakaoPayProcess(OrderVo formData) throws IOException{
		
		System.out.println(formData.getOrder_purchaser_name());
		
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
				+ "&total_amount=0"
				+ "&tax_free_amount=0"
				+ "&approval_url=http://localhost:8181/likehome/order/orderCompletePage"
				+ "&cancel_url=http://localhost:8181/likehome/order/orderPage"
				+ "&fail_url=http://localhost:8181/likehome/order/cartPage";
		
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
