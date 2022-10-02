package com.guest.likehome.vo;

import org.springframework.dao.support.DaoSupport;

public class FollowVo {
	private int follow_no;
	private int follower_no;
	private int followee_no;
	private DaoSupport following_date;
	
	public FollowVo() {
		super();
	}

	public FollowVo(int follow_no, int follower_no, int followee_no, DaoSupport following_date) {
		super();
		this.follow_no = follow_no;
		this.follower_no = follower_no;
		this.followee_no = followee_no;
		this.following_date = following_date;
	}

	public int getFollow_no() {
		return follow_no;
	}

	public void setFollow_no(int follow_no) {
		this.follow_no = follow_no;
	}

	public int getFollower_no() {
		return follower_no;
	}

	public void setFollower_no(int follower_no) {
		this.follower_no = follower_no;
	}

	public int getFollowee_no() {
		return followee_no;
	}

	public void setFollowee_no(int followee_no) {
		this.followee_no = followee_no;
	}

	public DaoSupport getFollowing_date() {
		return following_date;
	}

	public void setFollowing_date(DaoSupport following_date) {
		this.following_date = following_date;
	}
	
	
}
