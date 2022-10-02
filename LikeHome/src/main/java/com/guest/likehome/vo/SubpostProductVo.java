package com.guest.likehome.vo;

public class SubpostProductVo {

	private int subpost_product_no;
	private int subpost_no;
	private int product_no;
	
	public SubpostProductVo() {
		super();
	}

	public SubpostProductVo(int subpost_product_no, int subpost_no, int product_no) {
		super();
		this.subpost_product_no = subpost_product_no;
		this.subpost_no = subpost_no;
		this.product_no = product_no;
	}

	public int getSubpost_product_no() {
		return subpost_product_no;
	}

	public void setSubpost_product_no(int subpost_product_no) {
		this.subpost_product_no = subpost_product_no;
	}

	public int getSubpost_no() {
		return subpost_no;
	}

	public void setSubpost_no(int subpost_no) {
		this.subpost_no = subpost_no;
	}

	public int getProduct_no() {
		return product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	
	
}
