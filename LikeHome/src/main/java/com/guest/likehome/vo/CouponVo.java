package com.guest.likehome.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class CouponVo {
	private int coupon_no;
	private String coupon_name;
	private int coupon_amount;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date coupon_start_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date coupon_end_date;
	private String coupon_image_link;
	
	public CouponVo() {
		super();
	}

	public CouponVo(int coupon_no, String coupon_name, int coupon_amount, Date coupon_start_date, Date coupon_end_date,
			String coupon_image_link) {
		super();
		this.coupon_no = coupon_no;
		this.coupon_name = coupon_name;
		this.coupon_amount = coupon_amount;
		this.coupon_start_date = coupon_start_date;
		this.coupon_end_date = coupon_end_date;
		this.coupon_image_link = coupon_image_link;
	}

	public int getCoupon_no() {
		return coupon_no;
	}

	public void setCoupon_no(int coupon_no) {
		this.coupon_no = coupon_no;
	}

	public String getCoupon_name() {
		return coupon_name;
	}

	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}

	public int getCoupon_amount() {
		return coupon_amount;
	}

	public void setCoupon_amount(int coupon_amount) {
		this.coupon_amount = coupon_amount;
	}

	public Date getCoupon_start_date() {
		return coupon_start_date;
	}

	public void setCoupon_start_date(Date coupon_start_date) {
		this.coupon_start_date = coupon_start_date;
	}

	public Date getCoupon_end_date() {
		return coupon_end_date;
	}

	public void setCoupon_end_date(Date coupon_end_date) {
		this.coupon_end_date = coupon_end_date;
	}

	public String getCoupon_image_link() {
		return coupon_image_link;
	}

	public void setCoupon_image_link(String coupon_image_link) {
		this.coupon_image_link = coupon_image_link;
	}
	
	
	
}
