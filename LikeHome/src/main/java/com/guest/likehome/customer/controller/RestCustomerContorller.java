package com.guest.likehome.customer.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.guest.likehome.customer.service.CustomerServiceImpl;
import com.guest.likehome.vo.AddressVo;
import com.guest.likehome.vo.CustomerCouponVo;
import com.guest.likehome.vo.CustomerVo;
import com.guest.likehome.vo.FollowVo;

@RestController
@RequestMapping("/customer/*")
public class RestCustomerContorller {
	
	@Autowired
	private CustomerServiceImpl  customerService;
	
	
	//배송지 모달 관련
	@RequestMapping("restDeleteAddressProcess")
	public HashMap<String, Object> restDeleteAddressProcess(int addressNo){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		customerService.deleteAddressContent(addressNo);
		
		map.put("result", "success");
		
		return map;
	}
	
	@RequestMapping("restUpdateAddressPage")
	public HashMap<String, Object> restUpdateAddressPage(int addressNo){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("result", "success");
		map.put("addressVo", customerService.getAddress(addressNo));

		return map;
	}
	
	@RequestMapping("restUpdateAddressProcess")
	public HashMap<String, Object> restUpdateAddressProcess(AddressVo addressVo){
		HashMap<String, Object> map = new HashMap<String, Object>();

		System.out.println("updated address name : " + addressVo.getAddress_name());
		
		customerService.updateAddressContent(addressVo);
		
		map.put("result", "success");
		
		return map;
	}
	
	@RequestMapping("restAddressListPage")
	public HashMap<String, Object> restAddressListPage(HttpSession session){
		HashMap<String, Object> map = new HashMap<String, Object>();

		CustomerVo sessionCustomer = (CustomerVo)session.getAttribute("customerInfo");
		int customerNo = sessionCustomer.getCustomer_no(); 
		
		map.put("addressDataList", customerService.getCustomerAddressList(customerNo));
		
		return map;
	}
	
	@RequestMapping("restApplyAddressProcess")
	public HashMap<String, Object> restApplyAddressProcess(int addressNo){
		HashMap<String, Object> map = new HashMap<String, Object>();

		System.out.println("rest apply");
		map.put("addressData", customerService.getAddress(addressNo));
		
		return map;
	}
	
	
	@RequestMapping("restRegisterAddressProcess") 
	public HashMap<String, Object> restRegisterAddressProcess(AddressVo param, HttpSession session) {
		

		if(param.getAddress_default() == null) {
			param.setAddress_default("F");
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		//사용자 정보 가져오기               
		CustomerVo customerInfo = (CustomerVo)session.getAttribute("customerInfo");
		int customerNo = customerInfo.getCustomer_no();   
		
		param.setCustomer_no(customerNo);                                                                                                          
		customerService.getWriteAddressContentList(param);                                                                                     
		                                       
		return map;     							
	}
	
	
	//쿠폰 받기
	@RequestMapping("getCouponProcess")
	public HashMap<String, Object> getCouponProcess(CustomerCouponVo customerCouponVo , HttpSession session){
		//System.out.println(customerCouponVo.getCoupon_no());
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		CustomerVo customerInfo = (CustomerVo)session.getAttribute("customerInfo");
		int customerNo = customerInfo.getCustomer_no();
		
		customerCouponVo.setCustomer_no(customerNo);
		
		customerService.CustomerCouponContentList(customerCouponVo);
		
		map.put("result", "success");
		return map;
	}
	
	//커뮤니티
	@RequestMapping("restFollowProcess")
	public HashMap<String, Object> customerFollow(int customer_no, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		CustomerVo customerVo = (CustomerVo)session.getAttribute("customerInfo");
		int follower_no = customerVo.getCustomer_no();
		int followee_no = customer_no;
		
		customerService.FollowCustomer(follower_no, followee_no);
		FollowVo followVo = customerService.hasFollow(follower_no, followee_no);
		map.put("result", "success");
		map.put("followVo", followVo);
		return map;
	}
	
	
	@RequestMapping("customerLoginCheckProcess")
	   public HashMap<String, Object> customerLoginCheckProcess(String customer_email,String customer_pw) {
	      HashMap<String, Object> map = new HashMap<String, Object>();
	      System.out.println("되니");
	      map.put("id", customerService.countSelectcustomerId(customer_email));
	      System.out.println("되니1");
	      map.put("pw", customerService.countSelectcustomerPw(customer_email, customer_pw));
	      System.out.println("되니2");
	      map.put("auth", customerService.selectByAuth(customer_email, customer_pw));
	      System.out.println("되니3");
	      return map;
	   }


	
	//추가 - 유저롬 ajax
	@RequestMapping("resrUserHomePage")
	public HashMap<String, Object> restUserHomePage(HttpSession session,int userNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int customer_no = 0;
		CustomerVo customerInfo = (CustomerVo)session.getAttribute("customerInfo");
		if(customerInfo != null) {
			customer_no = customerInfo.getCustomer_no();
		}
		HashMap<String, Object> data = customerService.userHomeData(customer_no, userNo);
		FollowVo followVo = customerService.hasFollow(customer_no,userNo);
		
		map.put("followVo", followVo);
		map.put("data", data);
		return map;
	}
	
	@RequestMapping("resrMyHomePage")
	public HashMap<String, Object> resrMyHomePage(HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int customer_no = 0;
		CustomerVo customerInfo = (CustomerVo)session.getAttribute("customerInfo");
		if(customerInfo != null) {
			customer_no = customerInfo.getCustomer_no();
		}
		HashMap<String, Object> data = customerService.myHomeData(customer_no);
		
		map.put("data", data);
		return map;
	}
	
	
	@RequestMapping("isExistEmail")
	public HashMap<String, Object> isExistEmail(String customer_email){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("result", "success");
		map.put("data", customerService.isExistEmail(customer_email));
		
		return map;
	}
	
	

}
