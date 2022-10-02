package com.guest.likehome.vo;


public class OrderDetailVo {

	private int order_detail_no;
	private int order_no;
	private int product_no;
	private int order_detail_quantity;
	private int order_detail_quote_price;
	private String order_detail_delivery_status;
	

	public OrderDetailVo() {
		super();
	}

	public OrderDetailVo(int order_detail_no, int order_no, int product_no, int order_detail_quantity,
			int order_detail_quote_price, String order_detail_delivery_status) {
		super();
		this.order_detail_no = order_detail_no;
		this.order_no = order_no;
		this.product_no = product_no;
		this.order_detail_quantity = order_detail_quantity;
		this.order_detail_quote_price = order_detail_quote_price;
		this.order_detail_delivery_status = order_detail_delivery_status;
	}

	public int getOrder_detail_no() {
		return order_detail_no;
	}

	public void setOrder_detail_no(int order_detail_no) {
		this.order_detail_no = order_detail_no;
	}

	public int getOrder_no() {
		return order_no;
	}

	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}

	public int getProduct_no() {
		return product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}

	public int getOrder_detail_quantity() {
		return order_detail_quantity;
	}

	public void setOrder_detail_quantity(int order_detail_quantity) {
		this.order_detail_quantity = order_detail_quantity;
	}

	public int getOrder_detail_quote_price() {
		return order_detail_quote_price;
	}

	public void setOrder_detail_quote_price(int order_detail_quote_price) {
		this.order_detail_quote_price = order_detail_quote_price;
	}

	public String getOrder_detail_delivery_status() {
		return order_detail_delivery_status;
	}

	public void setOrder_detail_delivery_status(String order_detail_delivery_status) {
		this.order_detail_delivery_status = order_detail_delivery_status;
	}
	
	
	
	
	
}
