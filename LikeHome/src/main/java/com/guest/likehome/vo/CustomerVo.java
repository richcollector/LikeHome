package com.guest.likehome.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class CustomerVo {
	private int customer_no;
	private String customer_email;
	private String customer_pw;
	private String customer_nick;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date customer_birth;
	private String customer_gender;
	private Date customer_join_date;
	private String customer_state;
	private String customer_intro;
	private String customer_profile_image;
	private int customer_total_point;
	private String customer_grade;
	
	public CustomerVo() {
		super();
	}

	public CustomerVo(int customer_no, String customer_email, String customer_pw, String customer_nick,
			Date customer_birth, String customer_gender, Date customer_join_date, String customer_state,
			String customer_intro, String customer_profile_image, int customer_total_point, String customer_grade) {
		super();
		this.customer_no = customer_no;
		this.customer_email = customer_email;
		this.customer_pw = customer_pw;
		this.customer_nick = customer_nick;
		this.customer_birth = customer_birth;
		this.customer_gender = customer_gender;
		this.customer_join_date = customer_join_date;
		this.customer_state = customer_state;
		this.customer_intro = customer_intro;
		this.customer_profile_image = customer_profile_image;
		this.customer_total_point = customer_total_point;
		this.customer_grade = customer_grade;
	}

	public int getCustomer_no() {
		return customer_no;
	}

	public void setCustomer_no(int customer_no) {
		this.customer_no = customer_no;
	}

	public String getCustomer_email() {
		return customer_email;
	}

	public void setCustomer_email(String customer_email) {
		this.customer_email = customer_email;
	}

	public String getCustomer_pw() {
		return customer_pw;
	}

	public void setCustomer_pw(String customer_pw) {
		this.customer_pw = customer_pw;
	}

	public String getCustomer_nick() {
		return customer_nick;
	}

	public void setCustomer_nick(String customer_nick) {
		this.customer_nick = customer_nick;
	}

	public Date getCustomer_birth() {
		return customer_birth;
	}

	public void setCustomer_birth(Date customer_birth) {
		this.customer_birth = customer_birth;
	}

	public String getCustomer_gender() {
		return customer_gender;
	}

	public void setCustomer_gender(String customer_gender) {
		this.customer_gender = customer_gender;
	}

	public Date getCustomer_join_date() {
		return customer_join_date;
	}

	public void setCustomer_join_date(Date customer_join_date) {
		this.customer_join_date = customer_join_date;
	}

	public String getCustomer_state() {
		return customer_state;
	}

	public void setCustomer_state(String customer_state) {
		this.customer_state = customer_state;
	}

	public String getCustomer_intro() {
		return customer_intro;
	}

	public void setCustomer_intro(String customer_intro) {
		this.customer_intro = customer_intro;
	}

	public String getCustomer_profile_image() {
		return customer_profile_image;
	}

	public void setCustomer_profile_image(String customer_profile_image) {
		this.customer_profile_image = customer_profile_image;
	}

	public int getCustomer_total_point() {
		return customer_total_point;
	}

	public void setCustomer_total_point(int customer_total_point) {
		this.customer_total_point = customer_total_point;
	}

	public String getCustomer_grade() {
		return customer_grade;
	}

	public void setCustomer_grade(String customer_grade) {
		this.customer_grade = customer_grade;
	}

	
	
}
