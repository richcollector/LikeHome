package com.guest.likehome.vo;

public class VendorVo {
	
	private int vendor_no;
	private String vendor_business_number;
	private String vendor_pw;
	private String vendor_brand_name;
	private String vendor_email;
	private String vendor_phone;
	private String vendor_address;
	private String vendor_license_link;
	private String vendor_license_filename ;
	private String vendor_state;
	
	
	public VendorVo() {
		super();
	}


	public VendorVo(int vendor_no, String vendor_business_number, String vendor_pw, String vendor_brand_name,
			String vendor_email, String vendor_phone, String vendor_address, String vendor_license_link,
			String vendor_license_filename, String vendor_state) {
		super();
		this.vendor_no = vendor_no;
		this.vendor_business_number = vendor_business_number;
		this.vendor_pw = vendor_pw;
		this.vendor_brand_name = vendor_brand_name;
		this.vendor_email = vendor_email;
		this.vendor_phone = vendor_phone;
		this.vendor_address = vendor_address;
		this.vendor_license_link = vendor_license_link;
		this.vendor_license_filename = vendor_license_filename;
		this.vendor_state = vendor_state;
	}


	public int getVendor_no() {
		return vendor_no;
	}


	public void setVendor_no(int vendor_no) {
		this.vendor_no = vendor_no;
	}


	public String getVendor_business_number() {
		return vendor_business_number;
	}


	public void setVendor_business_number(String vendor_business_number) {
		this.vendor_business_number = vendor_business_number;
	}


	public String getVendor_pw() {
		return vendor_pw;
	}


	public void setVendor_pw(String vendor_pw) {
		this.vendor_pw = vendor_pw;
	}


	public String getVendor_brand_name() {
		return vendor_brand_name;
	}


	public void setVendor_brand_name(String vendor_brand_name) {
		this.vendor_brand_name = vendor_brand_name;
	}


	public String getVendor_email() {
		return vendor_email;
	}


	public void setVendor_email(String vendor_email) {
		this.vendor_email = vendor_email;
	}


	public String getVendor_phone() {
		return vendor_phone;
	}


	public void setVendor_phone(String vendor_phone) {
		this.vendor_phone = vendor_phone;
	}


	public String getVendor_address() {
		return vendor_address;
	}


	public void setVendor_address(String vendor_address) {
		this.vendor_address = vendor_address;
	}


	public String getVendor_license_link() {
		return vendor_license_link;
	}


	public void setVendor_license_link(String vendor_license_link) {
		this.vendor_license_link = vendor_license_link;
	}


	public String getVendor_license_filename() {
		return vendor_license_filename;
	}


	public void setVendor_license_filename(String vendor_license_filename) {
		this.vendor_license_filename = vendor_license_filename;
	}


	public String getVendor_state() {
		return vendor_state;
	}


	public void setVendor_state(String vendor_state) {
		this.vendor_state = vendor_state;
	}
	
	
}
