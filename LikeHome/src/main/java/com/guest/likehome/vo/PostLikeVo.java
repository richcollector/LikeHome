package com.guest.likehome.vo;

import java.util.Date;

public class PostLikeVo {
	private int like_no;
	private int customer_no;
	private int post_no;
	private Date like_date;
	
	public PostLikeVo() {
		super();
	}

	public PostLikeVo(int like_no, int customer_no, int post_no, Date like_date) {
		super();
		this.like_no = like_no;
		this.customer_no = customer_no;
		this.post_no = post_no;
		this.like_date = like_date;
	}

	public int getLike_no() {
		return like_no;
	}

	public void setLike_no(int like_no) {
		this.like_no = like_no;
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

	public Date getLike_date() {
		return like_date;
	}

	public void setLike_date(Date like_date) {
		this.like_date = like_date;
	}
	
	
}
