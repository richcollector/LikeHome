package com.guest.likehome.vo;

import java.util.Date;

public class CartVo {

	private int cart_no;
	private int customer_no;
	private int product_no;
	private int cart_product_quantity;
	private Date cart_date;
	
	public CartVo() {
		super();
	}

	public CartVo(int cart_no, int customer_no, int product_no, int cart_product_quantity, Date cart_date) {
		super();
		this.cart_no = cart_no;
		this.customer_no = customer_no;
		this.product_no = product_no;
		this.cart_product_quantity = cart_product_quantity;
		this.cart_date = cart_date;
	}

	public int getCart_no() {
		return cart_no;
	}

	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}

	public int getCustomer_no() {
		return customer_no;
	}

	public void setCustomer_no(int customer_no) {
		this.customer_no = customer_no;
	}

	public int getProduct_no() {
		return product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}

	public int getCart_product_quantity() {
		return cart_product_quantity;
	}

	public void setCart_product_quantity(int cart_product_quantity) {
		this.cart_product_quantity = cart_product_quantity;
	}

	public Date getCart_date() {
		return cart_date;
	}

	public void setCart_date(Date cart_date) {
		this.cart_date = cart_date;
	}
	
	
}
