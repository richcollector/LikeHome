package com.guest.likehome.vo;

import java.util.Date;

public class PostVo {
	private int post_no;
	private int customer_no;
	private int house_type_no;
	private int house_style_no;
	private int post_views;
	private Date post_write_date;
	
	public PostVo() {
		super();
	}

	public PostVo(int post_no, int customer_no, int house_type_no, int house_style_no, int post_views,
			Date post_write_date) {
		super();
		this.post_no = post_no;
		this.customer_no = customer_no;
		this.house_type_no = house_type_no;
		this.house_style_no = house_style_no;
		this.post_views = post_views;
		this.post_write_date = post_write_date;
	}

	public int getPost_no() {
		return post_no;
	}

	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}

	public int getCustomer_no() {
		return customer_no;
	}

	public void setCustomer_no(int customer_no) {
		this.customer_no = customer_no;
	}

	public int getHouse_type_no() {
		return house_type_no;
	}

	public void setHouse_type_no(int house_type_no) {
		this.house_type_no = house_type_no;
	}

	public int getHouse_style_no() {
		return house_style_no;
	}

	public void setHouse_style_no(int house_style_no) {
		this.house_style_no = house_style_no;
	}

	public int getPost_views() {
		return post_views;
	}

	public void setPost_views(int post_views) {
		this.post_views = post_views;
	}

	public Date getPost_write_date() {
		return post_write_date;
	}

	public void setPost_write_date(Date post_write_date) {
		this.post_write_date = post_write_date;
	}
	
	
}
