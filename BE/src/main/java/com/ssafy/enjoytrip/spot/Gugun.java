package com.ssafy.enjoytrip.spot;

public class Gugun {
	String gugunid;
	String name;
	public String getGugunid() {
		return gugunid;
	}
	public void setGugunid(String gugunid) {
		this.gugunid = gugunid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "Gugun [gugunid=" + gugunid + ", name=" + name + "]";
	}
	
	
}
