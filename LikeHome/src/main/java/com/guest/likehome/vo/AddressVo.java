package com.guest.likehome.vo;

public class AddressVo {
	
	private int address_no;
	private int customer_no;
	private String address_detail1;
	private String address_detail2;
	private String address_postcode;
	private String address_name;
	private String address_phone;
	private String address_default;
	
	public AddressVo() {
		super();
	}

	public AddressVo(int address_no, int customer_no, String address_detail1, String address_detail2,
			String address_postcode, String address_name, String address_phone, String address_default) {
		super();
		this.address_no = address_no;
		this.customer_no = customer_no;
		this.address_detail1 = address_detail1;
		this.address_detail2 = address_detail2;
		this.address_postcode = address_postcode;
		this.address_name = address_name;
		this.address_phone = address_phone;
		this.address_default = address_default;
	}

	public int getAddress_no() {
		return address_no;
	}

	public void setAddress_no(int address_no) {
		this.address_no = address_no;
	}

	public int getCustomer_no() {
		return customer_no;
	}

	public void setCustomer_no(int customer_no) {
		this.customer_no = customer_no;
	}

	public String getAddress_detail1() {
		return address_detail1;
	}

	public void setAddress_detail1(String address_detail1) {
		this.address_detail1 = address_detail1;
	}

	public String getAddress_detail2() {
		return address_detail2;
	}

	public void setAddress_detail2(String address_detail2) {
		this.address_detail2 = address_detail2;
	}

	public String getAddress_postcode() {
		return address_postcode;
	}

	public void setAddress_postcode(String address_postcode) {
		this.address_postcode = address_postcode;
	}

	public String getAddress_name() {
		return address_name;
	}

	public void setAddress_name(String address_name) {
		this.address_name = address_name;
	}

	public String getAddress_phone() {
		return address_phone;
	}

	public void setAddress_phone(String address_phone) {
		this.address_phone = address_phone;
	}

	public String getAddress_default() {
		return address_default;
	}

	public void setAddress_default(String address_default) {
		this.address_default = address_default;
	}
	
	
	
}
