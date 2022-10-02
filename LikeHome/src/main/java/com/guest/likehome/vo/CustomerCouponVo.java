package com.guest.likehome.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class CustomerCouponVo {
	private int customer_coupon_no;
	private int customer_no;
	private int coupon_no;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date coupon_use_date;
	
	public CustomerCouponVo() {
		super();
	}

	public CustomerCouponVo(int customer_coupon_no, int customer_no, int coupon_no, Date coupon_use_date) {
		super();
		this.customer_coupon_no = customer_coupon_no;
		this.customer_no = customer_no;
		this.coupon_no = coupon_no;
		this.coupon_use_date = coupon_use_date;
	}

	public int getCustomer_coupon_no() {
		return customer_coupon_no;
	}

	public void setCustomer_coupon_no(int customer_coupon_no) {
		this.customer_coupon_no = customer_coupon_no;
	}

	public int getCustomer_no() {
		return customer_no;
	}

	public void setCustomer_no(int customer_no) {
		this.customer_no = customer_no;
	}

	public int getCoupon_no() {
		return coupon_no;
	}

	public void setCoupon_no(int coupon_no) {
		this.coupon_no = coupon_no;
	}

	public Date getCoupon_use_date() {
		return coupon_use_date;
	}

	public void setCoupon_use_date(Date coupon_use_date) {
		this.coupon_use_date = coupon_use_date;
	}
	
	
}
