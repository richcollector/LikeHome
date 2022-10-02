package com.guest.likehome.vo;

import java.util.Date;

public class CustomerMailAuthVo {
	private int auth_no;
	private int customer_no;
	private String auth_key;
	private String auth_complete;
	private Date auth_date;
	
	public CustomerMailAuthVo() {
		super();
	}

	public CustomerMailAuthVo(int auth_no, int customer_no, String auth_key, String auth_complete, Date auth_date) {
		super();
		this.auth_no = auth_no;
		this.customer_no = customer_no;
		this.auth_key = auth_key;
		this.auth_complete = auth_complete;
		this.auth_date = auth_date;
	}

	public int getAuth_no() {
		return auth_no;
	}

	public void setAuth_no(int auth_no) {
		this.auth_no = auth_no;
	}

	public int getCustomer_no() {
		return customer_no;
	}

	public void setCustomer_no(int customer_no) {
		this.customer_no = customer_no;
	}

	public String getAuth_key() {
		return auth_key;
	}

	public void setAuth_key(String auth_key) {
		this.auth_key = auth_key;
	}

	public String getAuth_complete() {
		return auth_complete;
	}

	public void setAuth_complete(String auth_complete) {
		this.auth_complete = auth_complete;
	}

	public Date getAuth_date() {
		return auth_date;
	}

	public void setAuth_date(Date auth_date) {
		this.auth_date = auth_date;
	}
	
}
