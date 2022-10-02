package com.guest.likehome.customer.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.guest.likehome.vo.AddressVo;
import com.guest.likehome.vo.CouponVo;
import com.guest.likehome.vo.CustomerCouponVo;
import com.guest.likehome.vo.CustomerMailAuthVo;
import com.guest.likehome.vo.CustomerVo;
import com.guest.likehome.vo.FollowVo;

public interface CustomerSQLMapper {
	
	//일반회원 회원가입
	public void insertCustomer(CustomerVo customerVo);
	
	//이메일과 비밀번호로 회원정보가지고오기
	public CustomerVo selectByEmailAndPw(CustomerVo customerVo);
	
	public CustomerVo selectCustomerByCustomerNo(int customerNo);
	
	public int countSelectcustomerId(String customer_email);
	   
	public int countSelectcustomerPw(@Param("customer_email") String customer_email,
	               @Param("customer_pw") String customer_pw);
	public void updateCustomer(CustomerVo customerVo);
	public void updateCustomerPw(CustomerVo customerVo);
	
	
	//쿠폰
	public void insertCustomerCoupon(CustomerCouponVo customerCouponVo);
	public CouponVo selectCouponByCouponNo(int couponNo);
	public ArrayList<CustomerCouponVo> selectCustomerCouponAll();
	public CustomerCouponVo selectCustomerCouponByCustomerCouponNo(int customerCouponNo);
	public ArrayList<CustomerCouponVo> selectCustomerCouponByCustomerNo(int customerNo);
	public int selectCustomerCouponByCouponNoAndCustomerNo(CustomerCouponVo customerCouponVo);
	public CustomerCouponVo selectCustomerCouponByCoupon(int couponNo);
	public void updateCustomerCoupon(CustomerCouponVo customerCouponVo);
	public ArrayList<CouponVo> selectCouponByCustomerNo(int customerNo);
	
	//주소
	public void insertAddress(AddressVo addressVo);
	public AddressVo selectAddressByAddressNo(int addressNo); 
	public void deleteAddressByAddressNo(int addressNo);
	public void updateAddress(AddressVo addressVo);
	public ArrayList<AddressVo> selectAddressByAddressCustomerNo(int addressCustomerNo);
	public ArrayList<AddressVo> selectAddressByCustomerNo(int customerNo);
	
	
	//커뮤니티//
	public FollowVo selectFollowByFollowerAndFollowee(
			@Param("follower_no") int follower_no,
			@Param("followee_no") int followee_no
			);
	
	//사람 팔로우
	public void insertFollow(
			@Param("follower_no") int follower_no,
			@Param("followee_no") int followee_no
			);
	
	//사람 팔로우 해제
	public void deleteFollowByFollowerNoAndFolloweeNo(
			@Param("follower_no") int follower_no,
			@Param("followee_no") int followee_no
			);
	
	
	public int selectCountFollowByFollowerNo(int follower_no);
	
	public int selectCountFollowByFolloweeNo(int followee_no);
	
	public ArrayList<CustomerVo> selectCustomerByFollowerNo(int follower_no);
	
	public ArrayList<CustomerVo> selectCustomerByFolloweeNo(int followee_no);
	
	
	
	

	//메일 인증 
	public int selectCustomerCountByEmail(String customer_email);

	public void insertCustomerMailAuth(CustomerMailAuthVo customerMailAuthVo);
	public void updateCompleteY(String auth_Key);
	
	public int createCustomerPk();
	public CustomerMailAuthVo selectByAuth(@Param("customer_email") String customer_email,
											@Param("customer_pw") String customer_pw);

	
	
}
