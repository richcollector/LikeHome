package com.guest.likehome.vo;

public class PostCommentLikeVo {
	private int post_comment_like_no;
	private int customer_no;
	private int post_comment_no;
	
	public PostCommentLikeVo() {
		super();
	}

	public PostCommentLikeVo(int post_comment_like_no, int customer_no, int post_comment_no) {
		super();
		this.post_comment_like_no = post_comment_like_no;
		this.customer_no = customer_no;
		this.post_comment_no = post_comment_no;
	}

	public int getPost_comment_like_no() {
		return post_comment_like_no;
	}

	public void setPost_comment_like_no(int post_comment_like_no) {
		this.post_comment_like_no = post_comment_like_no;
	}

	public int getCustomer_no() {
		return customer_no;
	}

	public void setCustomer_no(int customer_no) {
		this.customer_no = customer_no;
	}

	public int getPost_comment_no() {
		return post_comment_no;
	}

	public void setPost_comment_no(int post_comment_no) {
		this.post_comment_no = post_comment_no;
	}
	
	
	
}
