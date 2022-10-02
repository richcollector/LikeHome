package com.guest.likehome.vo;

public class SubpostVo {
	private int subpost_no;
	private int post_no;
	private int space_type_no;
	private String subpost_content;
	private String subpost_image_filename;
	private String subpost_image_link;
	
	public SubpostVo() {
		super();
	}

	public SubpostVo(int subpost_no, int post_no, int space_type_no, String subpost_content,
			String subpost_image_filename, String subpost_image_link) {
		super();
		this.subpost_no = subpost_no;
		this.post_no = post_no;
		this.space_type_no = space_type_no;
		this.subpost_content = subpost_content;
		this.subpost_image_filename = subpost_image_filename;
		this.subpost_image_link = subpost_image_link;
	}

	public int getSubpost_no() {
		return subpost_no;
	}

	public void setSubpost_no(int subpost_no) {
		this.subpost_no = subpost_no;
	}

	public int getPost_no() {
		return post_no;
	}

	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}

	public int getSpace_type_no() {
		return space_type_no;
	}

	public void setSpace_type_no(int space_type_no) {
		this.space_type_no = space_type_no;
	}

	public String getSubpost_content() {
		return subpost_content;
	}

	public void setSubpost_content(String subpost_content) {
		this.subpost_content = subpost_content;
	}

	public String getSubpost_image_filename() {
		return subpost_image_filename;
	}

	public void setSubpost_image_filename(String subpost_image_filename) {
		this.subpost_image_filename = subpost_image_filename;
	}

	public String getSubpost_image_link() {
		return subpost_image_link;
	}

	public void setSubpost_image_link(String subpost_image_link) {
		this.subpost_image_link = subpost_image_link;
	}
	
	
}
