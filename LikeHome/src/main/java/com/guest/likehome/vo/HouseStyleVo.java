package com.guest.likehome.vo;

public class HouseStyleVo {
	
	private int house_style_no;
	private String house_style_name;
	
	public HouseStyleVo() {
		super();
	}

	public HouseStyleVo(int house_style_no, String house_style_name) {
		super();
		this.house_style_no = house_style_no;
		this.house_style_name = house_style_name;
	}

	public int getHouse_style_no() {
		return house_style_no;
	}

	public void setHouse_style_no(int house_style_no) {
		this.house_style_no = house_style_no;
	}

	public String getHouse_style_name() {
		return house_style_name;
	}

	public void setHouse_style_name(String house_style_name) {
		this.house_style_name = house_style_name;
	}
	
	
}
