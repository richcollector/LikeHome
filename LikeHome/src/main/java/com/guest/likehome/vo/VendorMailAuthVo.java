package com.guest.likehome.vo;

import java.util.Date;

public class VendorMailAuthVo {
	private int auth_no;
	private int vendor_no;
	private String auth_key;
	private String auth_complete;
	private Date auth_date;
	
	public VendorMailAuthVo() {
		super();
	}

	public VendorMailAuthVo(int auth_no, int vendor_no, String auth_key, String auth_complete, Date auth_date) {
		super();
		this.auth_no = auth_no;
		this.vendor_no = vendor_no;
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

	public int getVendor_no() {
		return vendor_no;
	}

	public void setVendor_no(int vendor_no) {
		this.vendor_no = vendor_no;
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
