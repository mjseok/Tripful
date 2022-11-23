package com.ssafy.enjoytrip.social;

public class Like {
	int likeid, scheduleid, spotid, uid;

	public Like() {
	}

	public Like(int likeid, int scheduleid, int spotid, int uid) {
		this.likeid = likeid;
		this.scheduleid = scheduleid;
		this.spotid = spotid;
		this.uid = uid;
	}

	public int getLikeid() {
		return likeid;
	}

	public void setLikeid(int likeid) {
		this.likeid = likeid;
	}

	public int getScheduleid() {
		return scheduleid;
	}
	
	public void setScheduleid(int scheduleid) {
		this.scheduleid = scheduleid;
	}

	public int getSpotid() {
		return spotid;
	}

	public void setSpotid(int spotid) {
		this.spotid = spotid;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}
	@Override
	public String toString() {
		return "Like [likeid=" + likeid + ", scheduleid=" + scheduleid + ", spotid=" + spotid + ", uid=" + uid + "]";
	}

}
