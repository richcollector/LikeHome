package com.guest.likehome.admin.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.guest.likehome.vo.AdminVo;
import com.guest.likehome.vo.CouponVo;
import com.guest.likehome.vo.CustomerVo;
import com.guest.likehome.vo.OrderVo;
import com.guest.likehome.vo.ProductCategory2Vo;
import com.guest.likehome.vo.ProductVo;
import com.guest.likehome.vo.VendorVo;

public interface AdminSQLMapper {

	//계정 관련
	public AdminVo selectByIdAndPw(AdminVo adminVo);
	
	
	
	//쿠폰 관련
	public void insertCoupon(CouponVo couponVo);
	public ArrayList<CouponVo> selectCouponByAll();
	public ArrayList<CouponVo> selectUnusedCoupon();
	public void deleteCouponByCouponNo(int coupon_no);
	
	//관리
	public ArrayList<VendorVo> selectByVendorInfo(
			@Param("searchType") String searchType, 
			@Param("searchWord") String searchWord,
			@Param("pageNum") int pageNum);
	
	public void updateByVendorState(@Param("vendor_state") String vendor_state,
									@Param("vendor_no") int vendor_no);
	
	public String selectByVendorState(int vendor_no);
	
	public int getVendorCount(
	@Param("searchType") String searchType, 
	@Param("searchWord") String searchWord);
	
	public ArrayList<ProductVo> selectProduct(
			@Param("searchType") String searchType, 
			@Param("searchWord") String searchWord,
			@Param("pageNum") int pageNum);
	
	public int getProductCount(
	@Param("searchType") String searchType, 
	@Param("searchWord") String searchWord);
	
	public int countVendorProduct(int vendor_no);
	
	public ArrayList<VendorVo> selectVendor(@Param("vendor_state") String vendor_state,
			@Param("searchType") String searchType,@Param("searchWord") String searchWord);
	
	public ArrayList<CustomerVo> selectByCustomerInfo(@Param("searchTypeCustomer") String searchTypeCustomer, 
														@Param("searchWordCustomer") String searchWordCustomer);
	
	public ArrayList<OrderVo> selectOrderByCustomer(int customer_no);
	
	public int countDetailProduct(int order_no);
	
	public ArrayList<ProductCategory2Vo> selectCategory2(int product_category2_no);
	
	public void deleteProduct(int product_no);

	public int countSelectAdminId(String admin_id);
	
	public int countSelectAdminPw(@Param("admin_id") String admin_id, 
									@Param("admin_pw") String admin_pw);
}
