package com.guest.likehome.vo;

import java.util.Date;

public class HelpQnaVo {
	private int help_qna_no;
	private int customer_no;
	private int help_qna_type_no;
	private String help_qna_title;
	private String help_qna_content;
	private Date help_qna_writedate;
	private String help_qna_answer_content;
	private Date help_qna_answerdate;
	
	public HelpQnaVo() {
		super();
	}

	public HelpQnaVo(int help_qna_no, int customer_no, int help_qna_type_no, String help_qna_title,
			String help_qna_content, Date help_qna_writedate, String help_qna_answer_content,
			Date help_qna_answerdate) {
		super();
		this.help_qna_no = help_qna_no;
		this.customer_no = customer_no;
		this.help_qna_type_no = help_qna_type_no;
		this.help_qna_title = help_qna_title;
		this.help_qna_content = help_qna_content;
		this.help_qna_writedate = help_qna_writedate;
		this.help_qna_answer_content = help_qna_answer_content;
		this.help_qna_answerdate = help_qna_answerdate;
	}

	public int getHelp_qna_no() {
		return help_qna_no;
	}

	public void setHelp_qna_no(int help_qna_no) {
		this.help_qna_no = help_qna_no;
	}

	public int getCustomer_no() {
		return customer_no;
	}

	public void setCustomer_no(int customer_no) {
		this.customer_no = customer_no;
	}

	public int getHelp_qna_type_no() {
		return help_qna_type_no;
	}

	public void setHelp_qna_type_no(int help_qna_type_no) {
		this.help_qna_type_no = help_qna_type_no;
	}

	public String getHelp_qna_title() {
		return help_qna_title;
	}

	public void setHelp_qna_title(String help_qna_title) {
		this.help_qna_title = help_qna_title;
	}

	public String getHelp_qna_content() {
		return help_qna_content;
	}

	public void setHelp_qna_content(String help_qna_content) {
		this.help_qna_content = help_qna_content;
	}

	public Date getHelp_qna_writedate() {
		return help_qna_writedate;
	}

	public void setHelp_qna_writedate(Date help_qna_writedate) {
		this.help_qna_writedate = help_qna_writedate;
	}

	public String getHelp_qna_answer_content() {
		return help_qna_answer_content;
	}

	public void setHelp_qna_answer_content(String help_qna_answer_content) {
		this.help_qna_answer_content = help_qna_answer_content;
	}

	public Date getHelp_qna_answerdate() {
		return help_qna_answerdate;
	}

	public void setHelp_qna_answerdate(Date help_qna_answerdate) {
		this.help_qna_answerdate = help_qna_answerdate;
	}
	
	
}
