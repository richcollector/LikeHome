package com.guest.likehome.vo;

public class ProductTitleImageVo {
	private int titlle_image_no;
	private int product_no;
	private String title_image_link;
	private String title_image_filename;
	
	public ProductTitleImageVo() {
		super();
	}

	public ProductTitleImageVo(int titlle_image_no, int product_no, String title_image_link,
			String title_image_filename) {
		super();
		this.titlle_image_no = titlle_image_no;
		this.product_no = product_no;
		this.title_image_link = title_image_link;
		this.title_image_filename = title_image_filename;
	}

	public int getTitlle_image_no() {
		return titlle_image_no;
	}

	public void setTitlle_image_no(int titlle_image_no) {
		this.titlle_image_no = titlle_image_no;
	}

	public int getProduct_no() {
		return product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}

	public String getTitle_image_link() {
		return title_image_link;
	}

	public void setTitle_image_link(String title_image_link) {
		this.title_image_link = title_image_link;
	}

	public String getTitle_image_filename() {
		return title_image_filename;
	}

	public void setTitle_image_filename(String title_image_filename) {
		this.title_image_filename = title_image_filename;
	}
	
}
