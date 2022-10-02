package com.guest.likehome.vo;

public class HashtagVo {
	private int hashtag_no;
	private String hashtag_keyword;
	
	public HashtagVo() {
		super();
	}

	public HashtagVo(int hashtag_no, String hashtag_keyword) {
		super();
		this.hashtag_no = hashtag_no;
		this.hashtag_keyword = hashtag_keyword;
	}

	public int getHashtag_no() {
		return hashtag_no;
	}

	public void setHashtag_no(int hashtag_no) {
		this.hashtag_no = hashtag_no;
	}

	public String getHashtag_keyword() {
		return hashtag_keyword;
	}

	public void setHashtag_keyword(String hashtag_keyword) {
		this.hashtag_keyword = hashtag_keyword;
	}
	
	
}
