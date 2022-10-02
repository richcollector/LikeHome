package com.guest.likehome.vo;

import java.util.Date;

public class PostReportVo {
	private int post_report_no;
	private int customer_no;
	private int post_no;
	private Date post_report_date;
	
	public PostReportVo() {
		super();
	}

	public PostReportVo(int post_report_no, int customer_no, int post_no, Date post_report_date) {
		super();
		this.post_report_no = post_report_no;
		this.customer_no = customer_no;
		this.post_no = post_no;
		this.post_report_date = post_report_date;
	}

	public int getPost_report_no() {
		return post_report_no;
	}

	public void setPost_report_no(int post_report_no) {
		this.post_report_no = post_report_no;
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

	public Date getPost_report_date() {
		return post_report_date;
	}

	public void setPost_report_date(Date post_report_date) {
		this.post_report_date = post_report_date;
	}
	
	
}