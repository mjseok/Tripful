package com.ssafy.enjoytrip.user;

public class User {
	int uid;
	String id, pwd, name, email;
	int isadmin;

	public User() {
	}

	public User(int uid, String id, String pwd, String name, String email, int isadmin) {
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.isadmin = isadmin;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getIsadmin() {
		return isadmin;
	}

	public void setIsadmin(int isadmin) {
		this.isadmin = isadmin;
	}

	@Override
	public String toString() {
		return "User [uid=" + uid + ", id=" + id + ", pwd=" + pwd + ", name=" + name + ", email=" + email + ", isadmin="
				+ isadmin + "]";
	}
}
