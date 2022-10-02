package com.guest.likehome.vo;

public class ProductCategory1Vo {
	private int product_category1_no;
	private String product_category1_name;
	
	public ProductCategory1Vo() {
		super();
	}

	public ProductCategory1Vo(int product_category1_no, String product_category1_name) {
		super();
		this.product_category1_no = product_category1_no;
		this.product_category1_name = product_category1_name;
	}

	public int getProduct_category1_no() {
		return product_category1_no;
	}

	public void setProduct_category1_no(int product_category1_no) {
		this.product_category1_no = product_category1_no;
	}

	public String getProduct_category1_name() {
		return product_category1_name;
	}

	public void setProduct_category1_name(String product_category1_name) {
		this.product_category1_name = product_category1_name;
	}
	
}
