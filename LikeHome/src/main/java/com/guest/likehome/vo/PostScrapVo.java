package com.guest.likehome.vo;

import java.util.Date;

public class PostScrapVo {
	private int post_scrap_no;
	private int customer_no;
	private int post_no;
	private Date post_scrap_date;
	
	public PostScrapVo() {
		super();
	}

	public PostScrapVo(int post_scrap_no, int customer_no, int post_no, Date post_scrap_date) {
		super();
		this.post_scrap_no = post_scrap_no;
		this.customer_no = customer_no;
		this.post_no = post_no;
		this.post_scrap_date = post_scrap_date;
	}

	public int getPost_scrap_no() {
		return post_scrap_no;
	}

	public void setPost_scrap_no(int post_scrap_no) {
		this.post_scrap_no = post_scrap_no;
	}

	public int getCustomer_no() {
		return customer_no;
	}

	public void setCustomer_no(int customer_no) {
		this.customer_no = customer_no;
	}

	public int getPost_no() {
		return post_no;
	}

	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}

	public Date getPost_scrap_date() {
		return post_scrap_date;
	}

	public void setPost_scrap_date(Date post_scrap_date) {
		this.post_scrap_date = post_scrap_date;
	}
	
	
}
