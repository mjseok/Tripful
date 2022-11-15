package com.ssafy.enjoytrip.user.service;

import com.ssafy.enjoytrip.user.User;

public interface UserService {
	User login(String id, String pwd) throws Exception;

	int idcheck(String id) throws Exception;

	void signUp(User user) throws Exception;

	void updateUser(User user) throws Exception;

	void removeUser(int uid) throws Exception;

	User findId(String name, String email) throws Exception;

	String findPwd(String id, String email) throws Exception;

}
