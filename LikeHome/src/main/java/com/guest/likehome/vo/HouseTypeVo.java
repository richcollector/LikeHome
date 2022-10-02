package com.guest.likehome.vo;

public class HouseTypeVo {

	private int house_type_no;
	private String house_type_name;
	
	public HouseTypeVo() {
		super();
	}

	public HouseTypeVo(int house_type_no, String house_type_name) {
		super();
		this.house_type_no = house_type_no;
		this.house_type_name = house_type_name;
	}

	public int getHouse_type_no() {
		return house_type_no;
	}

	public void setHouse_type_no(int house_type_no) {
		this.house_type_no = house_type_no;
	}

	public String getHouse_type_name() {
		return house_type_name;
	}

	public void setHouse_type_name(String house_type_name) {
		this.house_type_name = house_type_name;
	}
	
	
}
