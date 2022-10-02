package com.guest.likehome.vo;

public class AdminVo {
	private int admin_no;
	private String admin_id;
	private String admin_pw;
	private String admin_email;
	private String admin_phone;
	
	public AdminVo() {
		super();
	}

	public AdminVo(int admin_no, String admin_id, String admin_pw, String admin_email, String admin_phone) {
		super();
		this.admin_no = admin_no;
		this.admin_id = admin_id;
		this.admin_pw = admin_pw;
		this.admin_email = admin_email;
		this.admin_phone = admin_phone;
	}

	public int getAdmin_no() {
		return admin_no;
	}

	public void setAdmin_no(int admin_no) {
		this.admin_no = admin_no;
	}

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public String getAdmin_pw() {
		return admin_pw;
	}

	public void setAdmin_pw(String admin_pw) {
		this.admin_pw = admin_pw;
	}

	public String getAdmin_email() {
		return admin_email;
	}

	public void setAdmin_email(String admin_email) {
		this.admin_email = admin_email;
	}

	public String getAdmin_phone() {
		return admin_phone;
	}

	public void setAdmin_phone(String admin_phone) {
		this.admin_phone = admin_phone;
	}
	
	
	
}
