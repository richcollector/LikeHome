package com.guest.likehome.vo;

public class SpaceTypeVo {
	private int space_type_no;
	private String space_type_name;
	
	public SpaceTypeVo() {
		super();
	}

	public SpaceTypeVo(int space_type_no, String space_type_name) {
		super();
		this.space_type_no = space_type_no;
		this.space_type_name = space_type_name;
	}

	public int getSpace_type_no() {
		return space_type_no;
	}

	public void setSpace_type_no(int space_type_no) {
		this.space_type_no = space_type_no;
	}

	public String getSpace_type_name() {
		return space_type_name;
	}

	public void setSpace_type_name(String space_type_name) {
		this.space_type_name = space_type_name;
	}
	
	
}
