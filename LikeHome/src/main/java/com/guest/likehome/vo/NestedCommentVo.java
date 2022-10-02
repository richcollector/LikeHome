package com.guest.likehome.vo;

import java.util.Date;

public class NestedCommentVo {
	private int nested_comment_no;
	private int post_comment_no;
	private int customer_no;
	private String nested_comment_content;
	private int nick_trace_no;
	private Date nested_comment_write_data;
	
	public NestedCommentVo() {
		super();
	}

	public NestedCommentVo(int nested_comment_no, int post_comment_no, int customer_no, String nested_comment_content,
			int nick_trace_no, Date nested_comment_write_data) {
		super();
		this.nested_comment_no = nested_comment_no;
		this.post_comment_no = post_comment_no;
		this.customer_no = customer_no;
		this.nested_comment_content = nested_comment_content;
		this.nick_trace_no = nick_trace_no;
		this.nested_comment_write_data = nested_comment_write_data;
	}

	public int getNested_comment_no() {
		return nested_comment_no;
	}

	public void setNested_comment_no(int nested_comment_no) {
		this.nested_comment_no = nested_comment_no;
	}

	public int getPost_comment_no() {
		return post_comment_no;
	}

	public void setPost_comment_no(int post_comment_no) {
		this.post_comment_no = post_comment_no;
	}

	public int getCustomer_no() {
		return customer_no;
	}

	public void setCustomer_no(int customer_no) {
		this.customer_no = customer_no;
	}

	public String getNested_comment_content() {
		return nested_comment_content;
	}

	public void setNested_comment_content(String nested_comment_content) {
		this.nested_comment_content = nested_comment_content;
	}

	public int getNick_trace_no() {
		return nick_trace_no;
	}

	public void setNick_trace_no(int nick_trace_no) {
		this.nick_trace_no = nick_trace_no;
	}

	public Date getNested_comment_write_data() {
		return nested_comment_write_data;
	}

	public void setNested_comment_write_data(Date nested_comment_write_data) {
		this.nested_comment_write_data = nested_comment_write_data;
	}
	
	
}
