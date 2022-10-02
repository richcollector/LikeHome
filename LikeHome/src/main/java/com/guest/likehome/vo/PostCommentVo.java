package com.guest.likehome.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class PostCommentVo {
	private int post_comment_no;
	private int post_no;
	private int customer_no;
	private String post_comment_content;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date post_comment_write_date;
	
	public PostCommentVo() {
		super();
	}

	public PostCommentVo(int post_comment_no, int post_no, int customer_no, String post_comment_content,
			Date post_comment_write_date) {
		super();
		this.post_comment_no = post_comment_no;
		this.post_no = post_no;
		this.customer_no = customer_no;
		this.post_comment_content = post_comment_content;
		this.post_comment_write_date = post_comment_write_date;
	}

	public int getPost_comment_no() {
		return post_comment_no;
	}

	public void setPost_comment_no(int post_comment_no) {
		this.post_comment_no = post_comment_no;
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

	public String getPost_comment_content() {
		return post_comment_content;
	}

	public void setPost_comment_content(String post_comment_content) {
		this.post_comment_content = post_comment_content;
	}

	public Date getPost_comment_write_date() {
		return post_comment_write_date;
	}

	public void setPost_comment_write_date(Date post_comment_write_date) {
		this.post_comment_write_date = post_comment_write_date;
	}
	
	
	
}
