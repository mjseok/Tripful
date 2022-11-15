package com.ssafy.enjoytrip.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.enjoytrip.user.User;
import com.ssafy.enjoytrip.user.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {
	
	
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public User login(String id, String pwd) throws Exception {
		return userMapper.login(id, pwd);
	}

	@Override
	public void signUp(User user) throws Exception {
		userMapper.signUp(user);
	}

	@Override
	public void updateUser(User user) throws Exception {
		userMapper.updateUser(user);
	}

	@Override
	public void removeUser(int uid) throws Exception {
		userMapper.removeUser(uid);
	}

	@Override
	public int idcheck(String id) throws Exception {
		return userMapper.idcheck(id);
	}

	@Override
	public User findId(String name, String email) throws Exception {
		return userMapper.findId(name, email);
	}

	@Override
	public String findPwd(String id, String email) throws Exception {
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7',
				'8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 
				'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 
				'U', 'V', 'W', 'X', 'Y', 'Z' };

		  int idx = 0;
		  StringBuffer sb = new StringBuffer();
		  
		  for (int i = 0; i < 10; i++) {
			
			  idx = (int) (charSet.length * Math.random()); 
			  sb.append(charSet[idx]);
		  }
		String tempPwd = sb.toString();
		userMapper.findPwd(id, email, tempPwd);
		System.out.println("service에서 비번찾기 후 변경 문제없음");
		return tempPwd;
	}

}
