package com.ssafy.enjoytrip.user.mapper;

import java.sql.SQLException;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.enjoytrip.user.User;


@Mapper
public interface UserMapper {
	User login(String id, String pwd) throws SQLException;

	int idcheck(String id) throws SQLException;

	void signUp(User user) throws SQLException;

	void updateUser(User user) throws SQLException;

	void removeUser(int uid) throws SQLException;

	User findId(String name, String email) throws SQLException;

	void findPwd(String id, String email, String tempPwd) throws SQLException;
	public User userInfo(String userid) throws SQLException;
	public void saveRefreshToken(Map<String, String> map) throws SQLException;
	public Object getRefreshToken(String userid) throws SQLException;
	public void deleteRefreshToken(Map<String, String> map) throws SQLException;
}
