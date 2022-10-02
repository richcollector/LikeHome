package com.guest.likehome.vo;

import java.util.Date;

public class ProductReviewVo {

	private int review_no;
	private int product_no;
	private int customer_no;
	private String review_content;
	private int review_rating;
	private Date review_write_date;
	private String review_img_link;
	private String review_img_filename;
	
	
	public ProductReviewVo() {
		super();
	}


	public ProductReviewVo(int review_no, int product_no, int customer_no, String review_content, int review_rating,
			Date review_write_date, String review_img_link, String review_img_filename) {
		super();
		this.review_no = review_no;
		this.product_no = product_no;
		this.customer_no = customer_no;
		this.review_content = review_content;
		this.review_rating = review_rating;
		this.review_write_date = review_write_date;
		this.review_img_link = review_img_link;
		this.review_img_filename = review_img_filename;
	}


	public int getReview_no() {
		return review_no;
	}


	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}


	public int getProduct_no() {
		return product_no;
	}


	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}


	public int getCustomer_no() {
		return customer_no;
	}


	public void setCustomer_no(int customer_no) {
		this.customer_no = customer_no;
	}


	public String getReview_content() {
		return review_content;
	}


	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}


	public int getReview_rating() {
		return review_rating;
	}


	public void setReview_rating(int review_rating) {
		this.review_rating = review_rating;
	}


	public Date getReview_write_date() {
		return review_write_date;
	}


	public void setReview_write_date(Date review_write_date) {
		this.review_write_date = review_write_date;
	}


	public String getReview_img_link() {
		return review_img_link;
	}


	public void setReview_img_link(String review_img_link) {
		this.review_img_link = review_img_link;
	}


	public String getReview_img_filename() {
		return review_img_filename;
	}


	public void setReview_img_filename(String review_img_filename) {
		this.review_img_filename = review_img_filename;
	}
	
	
	
	
}
