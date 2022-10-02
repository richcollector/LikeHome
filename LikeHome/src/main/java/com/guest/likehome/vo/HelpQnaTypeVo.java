package com.guest.likehome.vo;

public class HelpQnaTypeVo {
	private int help_qna_type_no;
	private String help_qna_type_name;
	
	public HelpQnaTypeVo() {
		super();
	}

	public HelpQnaTypeVo(int help_qna_type_no, String help_qna_type_name) {
		super();
		this.help_qna_type_no = help_qna_type_no;
		this.help_qna_type_name = help_qna_type_name;
	}

	public int getHelp_qna_type_no() {
		return help_qna_type_no;
	}

	public void setHelp_qna_type_no(int help_qna_type_no) {
		this.help_qna_type_no = help_qna_type_no;
	}

	public String getHelp_qna_type_name() {
		return help_qna_type_name;
	}

	public void setHelp_qna_type_name(String help_qna_type_name) {
		this.help_qna_type_name = help_qna_type_name;
	}
	
	
}
