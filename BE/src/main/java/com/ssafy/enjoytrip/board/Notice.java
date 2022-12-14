package com.ssafy.enjoytrip.board;

public class Notice {
	int noticeid, uid;
	String title, content, name, date;
	int hit;

	public Notice() {
	}

	public Notice(int noticeid, int uid, String title, String content, String name, String date, int hit) {
		this.noticeid = noticeid;
		this.uid = uid;
		this.title = title;
		this.content = content;
		this.date = date;
		this.hit = hit;
		this.name = name;
	}

	public int getNoticeid() {
		return noticeid;
	}

	public void setNoticeid(int noticeid) {
		this.noticeid = noticeid;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Board [noticeid=" + noticeid + ", uid=" + uid + ", title=" + title + ", content=" + content + ", name="
				+ name + ", date=" + date + ", hit=" + hit + "]";
	}
	
}
