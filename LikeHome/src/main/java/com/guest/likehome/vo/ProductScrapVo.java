package com.guest.likehome.vo;

import java.util.Date;

public class ProductScrapVo {

	private int product_scrap_no;
	private int customer_no;
	private int product_no;
	private Date product_scrap_date;
	
	public ProductScrapVo() {
		super();
	}

	public ProductScrapVo(int product_scrap_no, int customer_no, int product_no, Date product_scrap_date) {
		super();
		this.product_scrap_no = product_scrap_no;
		this.customer_no = customer_no;
		this.product_no = product_no;
		this.product_scrap_date = product_scrap_date;
	}

	public int getProduct_scrap_no() {
		return product_scrap_no;
	}

	public void setProduct_scrap_no(int product_scrap_no) {
		this.product_scrap_no = product_scrap_no;
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

	public Date getProduct_scrap_date() {
		return product_scrap_date;
	}

	public void setProduct_scrap_date(Date product_scrap_date) {
		this.product_scrap_date = product_scrap_date;
	}
	
	
	
	
}
