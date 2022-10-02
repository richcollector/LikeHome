package com.guest.likehome.vo;

import java.util.Date;

public class OrderVo {

	private int order_no;
	private int customer_no;
	private int coupon_no;
	private String order_code;
	private Date order_date;
	private int order_total_amount;
	private String order_purchaser_name;
	private String order_purchaser_phone;
	private String order_receiver_name;
	private String order_receiver_phone;
	private String order_receiver_postcode;
	private String order_receiver_address1;
	private String order_receiver_address2;
	private String order_payment;
	
	public OrderVo() {
		super();
	}

	public OrderVo(int order_no, int customer_no, int coupon_no, String order_code, Date order_date,
			int order_total_amount, String order_purchaser_name, String order_purchaser_phone,
			String order_receiver_name, String order_receiver_phone, String order_receiver_postcode,
			String order_receiver_address1, String order_receiver_address2, String order_payment) {
		super();
		this.order_no = order_no;
		this.customer_no = customer_no;
		this.coupon_no = coupon_no;
		this.order_code = order_code;
		this.order_date = order_date;
		this.order_total_amount = order_total_amount;
		this.order_purchaser_name = order_purchaser_name;
		this.order_purchaser_phone = order_purchaser_phone;
		this.order_receiver_name = order_receiver_name;
		this.order_receiver_phone = order_receiver_phone;
		this.order_receiver_postcode = order_receiver_postcode;
		this.order_receiver_address1 = order_receiver_address1;
		this.order_receiver_address2 = order_receiver_address2;
		this.order_payment = order_payment;
	}

	public int getOrder_no() {
		return order_no;
	}

	public void setOrder_no(int order_no) {
		this.order_no = order_no;
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

	public String getOrder_code() {
		return order_code;
	}

	public void setOrder_code(String order_code) {
		this.order_code = order_code;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public int getOrder_total_amount() {
		return order_total_amount;
	}

	public void setOrder_total_amount(int order_total_amount) {
		this.order_total_amount = order_total_amount;
	}

	public String getOrder_purchaser_name() {
		return order_purchaser_name;
	}

	public void setOrder_purchaser_name(String order_purchaser_name) {
		this.order_purchaser_name = order_purchaser_name;
	}

	public String getOrder_purchaser_phone() {
		return order_purchaser_phone;
	}

	public void setOrder_purchaser_phone(String order_purchaser_phone) {
		this.order_purchaser_phone = order_purchaser_phone;
	}

	public String getOrder_receiver_name() {
		return order_receiver_name;
	}

	public void setOrder_receiver_name(String order_receiver_name) {
		this.order_receiver_name = order_receiver_name;
	}

	public String getOrder_receiver_phone() {
		return order_receiver_phone;
	}

	public void setOrder_receiver_phone(String order_receiver_phone) {
		this.order_receiver_phone = order_receiver_phone;
	}

	public String getOrder_receiver_postcode() {
		return order_receiver_postcode;
	}

	public void setOrder_receiver_postcode(String order_receiver_postcode) {
		this.order_receiver_postcode = order_receiver_postcode;
	}

	public String getOrder_receiver_address1() {
		return order_receiver_address1;
	}

	public void setOrder_receiver_address1(String order_receiver_address1) {
		this.order_receiver_address1 = order_receiver_address1;
	}

	public String getOrder_receiver_address2() {
		return order_receiver_address2;
	}

	public void setOrder_receiver_address2(String order_receiver_address2) {
		this.order_receiver_address2 = order_receiver_address2;
	}

	public String getOrder_payment() {
		return order_payment;
	}

	public void setOrder_payment(String order_payment) {
		this.order_payment = order_payment;
	}
	
	
}
