package com.guest.likehome.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guest.likehome.admin.mapper.AdminSQLMapper;
import com.guest.likehome.customer.mapper.CustomerSQLMapper;
import com.guest.likehome.vo.AdminVo;
import com.guest.likehome.vo.CouponVo;
import com.guest.likehome.vo.CustomerCouponVo;
import com.guest.likehome.vo.CustomerVo;
import com.guest.likehome.vo.OrderVo;
import com.guest.likehome.vo.ProductCategory2Vo;
import com.guest.likehome.vo.ProductVo;
import com.guest.likehome.vo.VendorVo;

@Service
public class AdminServiceImpl {
	
	@Autowired
	AdminSQLMapper adminSQLMapper;
	@Autowired
	CustomerSQLMapper customerSQLMapper;

	//계정관련//
	public AdminVo adminLogin(AdminVo adminVo) {
		AdminVo result = adminSQLMapper.selectByIdAndPw(adminVo);
	 
		return result;
	}
	
	//쿠폰//
	
	public void insertCoupon(CouponVo couponVo) {
		adminSQLMapper.insertCoupon(couponVo);
	}
	
	//관리자 쿠폰 리스트
	public ArrayList<CouponVo> getAdminCouponList(){
		return adminSQLMapper.selectCouponByAll();
	}      
	    
	//customer , 쿠폰 리스트         
	public ArrayList<HashMap<String, Object>> getCouponData(){
		ArrayList<HashMap<String, Object>> couponDataList = new ArrayList<HashMap<String,Object>>();
				
		ArrayList<CouponVo> couponVoList = adminSQLMapper.selectUnusedCoupon();
		for(CouponVo couponVo : couponVoList) {
			int couponNo = couponVo.getCoupon_no();
			CustomerCouponVo customerCouponVo = customerSQLMapper.selectCustomerCouponByCoupon(couponNo);
					
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("couponVo", couponVo);
			map.put("customerCouponVo", customerCouponVo);
			couponDataList.add(map);
		}
						
		return couponDataList;
	}	
		
	public void deleteCoupon(int coupon_no) {
		adminSQLMapper.deleteCouponByCouponNo(coupon_no);
	}		
	
	
	public ArrayList<VendorVo> selectByVendorInfo(String searchType, String searchWord, int pageNum) {
		ArrayList<VendorVo> vendorVo = adminSQLMapper.selectByVendorInfo(searchType, searchWord, pageNum);
		
		return vendorVo;
	}
	
	public int getVendorCount (String searchType, String searchWord) {
		return adminSQLMapper.getVendorCount(searchType, searchWord);
	}
	
	public void updateByVendorState(String vendor_state, int vendor_no) {
		adminSQLMapper.updateByVendorState(vendor_state,vendor_no);
	}
	
	public boolean selectByVendorState(int vendor_no) {
		
		String falseValue = "F";
		String state = adminSQLMapper.selectByVendorState(vendor_no);
		System.out.println(state);
		if(state.equals(falseValue)) {
			return false;
		}else {
			return true;
		}

	}
	
	public ArrayList<ProductVo> selectProduct(String searchType,String searchWord,int pageNum){
		
		return adminSQLMapper.selectProduct(searchType,searchWord,pageNum);
	}
	
	public int getProductCount (String searchType, String searchWord) {
		return adminSQLMapper.getProductCount(searchType, searchWord);
	}
	
	public int countVendorProduct(int vendor_no) {
		return adminSQLMapper.countVendorProduct(vendor_no);
	}
	
	public ArrayList<VendorVo> selectVendor(String vendor_state,String searchType, String searchWord) {
		return adminSQLMapper.selectVendor(vendor_state,searchType,searchWord);
	}
	
	public ArrayList<HashMap<String, Object>> selectByCustomerInfo(String searchTypeCustomer, String searchWordCustomer) {
		ArrayList<HashMap<String, Object>> dataList = new ArrayList<HashMap<String,Object>>();
		ArrayList<CustomerVo> customerVoList = adminSQLMapper.selectByCustomerInfo(searchTypeCustomer,searchWordCustomer);
		
		
		for(CustomerVo customerVo : customerVoList) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			int customer_no = customerVo.getCustomer_no();
			ArrayList<OrderVo> orderVoList = adminSQLMapper.selectOrderByCustomer(customer_no);
			map.put("customerVo", customerVo);
			int countTotalProduct = 0;
			
			for(OrderVo orderVo : orderVoList) {
				int countProduct = adminSQLMapper.countDetailProduct(orderVo.getOrder_no());
				countTotalProduct += countProduct;
				
				
			}
			
			map.put("countTotalProduct", countTotalProduct);
			dataList.add(map);
		}
		
		return dataList;
	}
	
	public ArrayList<ProductCategory2Vo> selectCategory2(int product_category2_no) {
		ArrayList<ProductCategory2Vo> categoy2List = adminSQLMapper.selectCategory2(product_category2_no);
		return categoy2List;
	}
	
	public void deleteProduct(int product_no) {
		adminSQLMapper.deleteProduct(product_no);
	}
	
	public boolean countSelectAdminId(String admin_id) {
		
		if(adminSQLMapper.countSelectAdminId(admin_id) > 0) {
			return true;
		}else {
			return false;
		}
		
	}
	
	public boolean countSelectAdminPw(String admin_id, String admin_pw) {
		
		if (adminSQLMapper.countSelectAdminPw(admin_id, admin_pw) > 0) {
			return true;
		}else {
			return false;
		}
		
	}

}
