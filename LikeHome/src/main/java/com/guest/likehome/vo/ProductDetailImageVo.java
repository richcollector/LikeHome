package com.guest.likehome.vo;

public class ProductDetailImageVo {
	private int detail_image_no;
	private int product_no;
	private String detail_image_link;
	private String detail_image_filename;
	
	public ProductDetailImageVo() {
		super();
	}

	public ProductDetailImageVo(int detail_image_no, int product_no, String detail_image_link,
			String detail_image_filename) {
		super();
		this.detail_image_no = detail_image_no;
		this.product_no = product_no;
		this.detail_image_link = detail_image_link;
		this.detail_image_filename = detail_image_filename;
	}

	public int getDetail_image_no() {
		return detail_image_no;
	}

	public void setDetail_image_no(int detail_image_no) {
		this.detail_image_no = detail_image_no;
	}

	public int getProduct_no() {
		return product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}

	public String getDetail_image_link() {
		return detail_image_link;
	}

	public void setDetail_image_link(String detail_image_link) {
		this.detail_image_link = detail_image_link;
	}

	public String getDetail_image_filename() {
		return detail_image_filename;
	}

	public void setDetail_image_filename(String detail_image_filename) {
		this.detail_image_filename = detail_image_filename;
	}

}
