package com.guest.likehome.vendor.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.guest.likehome.vendor.service.VendorServiceImpl;
import com.guest.likehome.vo.CustomerVo;
import com.guest.likehome.vo.OrderDetailVo;
import com.guest.likehome.vo.OrderVo;
import com.guest.likehome.vo.ProductVo;
import com.guest.likehome.vo.VendorVo;

@RestController
@RequestMapping("/vendor/*")
public class RestVendorController {
	
	@Autowired
	VendorServiceImpl vendorService; 

	@RequestMapping("isExistName")
	public HashMap<String, Object> isExistName(String product_name){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("result", "success");
		map.put("data", vendorService.isExistName(product_name));
		
		return map;
	}
	
	@RequestMapping("vendorLoginCheckProcess")
	public HashMap<String, Object> vendorLoginCheckProcess(String vendor_business_number,String vendor_pw) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("id", vendorService.countSelectVendorId(vendor_business_number));
		map.put("pw", vendorService.countSelectVendorPw(vendor_business_number, vendor_pw));
		map.put("state", vendorService.SelectVendorState(vendor_business_number, vendor_pw));
		map.put("auth", vendorService.selectByAuth(vendor_business_number, vendor_pw));

		return map;
	}
	
	@RequestMapping("categoryProcess")
	public HashMap<String, Object> categoryProcess(Model model) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
			
		map.put("result", "success");
		map.put("data", vendorService.getCategoryList1());
		
		return map;
	}
	
	@RequestMapping("categoryProcess2")
	public HashMap<String, Object> categoryProcess2
	(@RequestParam(value="product_category1_no", defaultValue = "0") int product_category1_no) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("result" , "success");
		map.put("data" , vendorService.getCategoryList1ByCategoryList2(product_category1_no));
		
		return map;
	}
	
	@RequestMapping("updateDeliveryProcess")
	public void updateDeliveryProcess(int delivery_statusageNum, int ORDER_DETAIL_NO) {
		vendorService.updateDelivery(delivery_statusageNum, ORDER_DETAIL_NO);
	}
	
	@RequestMapping("getDeliveryStatus")
	public int getDeliveryStatus(int detailNo) {
		OrderDetailVo orderDetailVo = (OrderDetailVo)vendorService.getDeliveryStatusNo(detailNo);
		
		int statusageNum = Integer.parseInt(orderDetailVo.getOrder_detail_delivery_status());
		
		return statusageNum;
	}
	
	@RequestMapping("isExistBrand")
	public HashMap<String, Object> isExistBrand(String brand_name){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("result", "success");
		map.put("data", vendorService.isExistBrand(brand_name));
		
		return map;
	}
	
	
	
}
