package com.guest.likehome.vo;

public class ProductCategory2Vo {
	private int product_category2_no;
	private int product_category1_no;
	private String product_category2_name;
	
	public ProductCategory2Vo() {
		super();
	}

	public ProductCategory2Vo(int product_category2_no, int product_category1_no, String product_category2_name) {
		super();
		this.product_category2_no = product_category2_no;
		this.product_category1_no = product_category1_no;
		this.product_category2_name = product_category2_name;
	}

	public int getProduct_category2_no() {
		return product_category2_no;
	}

	public void setProduct_category2_no(int product_category2_no) {
		this.product_category2_no = product_category2_no;
	}

	public int getProduct_category1_no() {
		return product_category1_no;
	}

	public void setProduct_category1_no(int product_category1_no) {
		this.product_category1_no = product_category1_no;
	}

	public String getProduct_category2_name() {
		return product_category2_name;
	}

	public void setProduct_category2_name(String product_category2_name) {
		this.product_category2_name = product_category2_name;
	}
	
}
