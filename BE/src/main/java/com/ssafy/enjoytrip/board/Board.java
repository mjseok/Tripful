package com.ssafy.enjoytrip.board;

public class Board {
	int boardid, uid;
	String title, content, name, date;
	int hit;

	public Board() {
	}

	public Board(int boardid, int uid, String title, String content, String name, String date, int hit) {
		this.boardid = boardid;
		this.uid = uid;
		this.title = title;
		this.content = content;
		this.date = date;
		this.hit = hit;
		this.name = name;
	}

	public int getBoardid() {
		return boardid;
	}

	public void setBoardid(int boardid) {
		this.boardid = boardid;
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
		return "Board [boardid=" + boardid + ", uid=" + uid + ", title=" + title + ", content=" + content + ", name="
				+ name + ", date=" + date + ", hit=" + hit + "]";
	}
	
}
