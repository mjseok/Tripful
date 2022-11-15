package com.ssafy.enjoytrip.board;

public class Board {
	int boardid, uid;
	String title, content, author, date;
	int hit;

	public Board() {
	}

	public Board(int boardid, int uid, String title, String content, String author, String date, int hit) {
		this.boardid = boardid;
		this.uid = uid;
		this.title = title;
		this.content = content;
		this.date = date;
		this.hit = hit;
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

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
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
}
