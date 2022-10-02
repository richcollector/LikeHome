package com.guest.likehome.vo;

public class SubpostHashtagVo {
	private int subpost_hashtag_no;
	private int subpost_no;
	private int hashtag_no;
	
	public SubpostHashtagVo() {
		super();
	}

	public SubpostHashtagVo(int subpost_hashtag_no, int subpost_no, int hashtag_no) {
		super();
		this.subpost_hashtag_no = subpost_hashtag_no;
		this.subpost_no = subpost_no;
		this.hashtag_no = hashtag_no;
	}

	public int getSubpost_hashtag_no() {
		return subpost_hashtag_no;
	}

	public void setSubpost_hashtag_no(int subpost_hashtag_no) {
		this.subpost_hashtag_no = subpost_hashtag_no;
	}

	public int getSubpost_no() {
		return subpost_no;
	}

	public void setSubpost_no(int subpost_no) {
		this.subpost_no = subpost_no;
	}

	public int getHashtag_no() {
		return hashtag_no;
	}

	public void setHashtag_no(int hashtag_no) {
		this.hashtag_no = hashtag_no;
	}
	
	
}
