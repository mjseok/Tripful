package com.ssafy.enjoytrip.social;

public class Review {
	int reviewid, spotid, uid;
	String title, content;
	int score;
	String image;
	String name;
	
	public Review() {
	}

	public Review(int reviewid, int spotid, int uid, String title, String content, int score, String image,String name) {
		this.reviewid = reviewid;
		this.spotid = spotid;
		this.uid = uid;
		this.title = title;
		this.content = content;
		this.score = score;
		this.image = image;
		this.name = name;
	}

	public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getReviewid() {
		return reviewid;
	}

	public void setReviewid(int reviewid) {
		this.reviewid = reviewid;
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

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
}
