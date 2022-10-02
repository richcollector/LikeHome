package com.guest.likehome.vo;

public class NestedCommentLikeVo {
	private int nested_comment_like_no;
	private int nested_comment_no;
	private int customer_no;
	
	public NestedCommentLikeVo() {
		super();
	}

	public NestedCommentLikeVo(int nested_comment_like_no, int nested_comment_no, int customer_no) {
		super();
		this.nested_comment_like_no = nested_comment_like_no;
		this.nested_comment_no = nested_comment_no;
		this.customer_no = customer_no;
	}

	public int getNested_comment_like_no() {
		return nested_comment_like_no;
	}

	public void setNested_comment_like_no(int nested_comment_like_no) {
		this.nested_comment_like_no = nested_comment_like_no;
	}

	public int getNested_comment_no() {
		return nested_comment_no;
	}

	public void setNested_comment_no(int nested_comment_no) {
		this.nested_comment_no = nested_comment_no;
	}

	public int getCustomer_no() {
		return customer_no;
	}

	public void setCustomer_no(int customer_no) {
		this.customer_no = customer_no;
	}
	
	
}
