package com.ssafy.enjoytrip.user.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.enjoytrip.user.User;
import com.ssafy.enjoytrip.user.service.UserService;

@RestController
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService userService;

	
	@GetMapping("/mypage") //test
	public ModelAndView myPage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/mypage");
		return mav;
	}

	@GetMapping("/login")
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/login");
		return mav;
	}

	@PostMapping("/login")
	public ModelAndView login(@RequestParam Map<String, String> map, Model model, HttpSession session,
			HttpServletResponse response,HttpServletRequest request) throws Exception {

		String id = map.get("id");
		String pwd = map.get("pwd");
//		System.out.println("size : "+map.size());
//		System.out.println("id : "+map.get("id"));
//		System.out.println("pwd : "+map.get("pwd"));

		User user = userService.login(id, pwd);
		System.out.println(user);

		ModelAndView mav = new ModelAndView();
		if (user != null) {
			session = request.getSession();
			session.setAttribute("user", user);
			mav.setViewName("index");
		} else {
			request.setAttribute("msg", "아이디 / 비밀번호가 존재하지 않습니다!!!");
			mav.setViewName("user/login");
		}

		return mav;
	}

	@GetMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		session.invalidate();
		mav.setViewName("index");
		return mav;
	}
	
	@GetMapping("/signUp")
	public ModelAndView signUp() throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/signup");
		return mav;
	}
	
	@PostMapping("/signUp")
	public ModelAndView signUp(User user) throws Exception {
		userService.signUp(user);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/login");
		return mav;
	}
	@GetMapping("/Find/{kind}")
	public ModelAndView find(@PathVariable("kind") String kind) throws Exception {
		ModelAndView mav = new ModelAndView();
		if(kind.equals("id")) {
			mav.addObject("kind","id");
		}else {
			mav.addObject("kind","pwd");
		}
		mav.setViewName("user/find");
		return mav;
	}
	@GetMapping("/findId/{name}/{email}")
	public User findId(@PathVariable("name")String name,@PathVariable("email")String email) throws Exception {
		User user = userService.findId(name, email);
		return user;
	}
//	update query문이라서 putmapping해야될 것 같은데 그러면 임시비밀번호를 못가져옴... 어떻게 해야하징?
	@GetMapping("/findPwd/{id}/{email}")
	public String findPwd(@PathVariable("id")String id,@PathVariable("email")String email) throws Exception {
		String tempPwd  = userService.findPwd(id, email);
		System.out.println("tempPwd는  "+tempPwd);
		return tempPwd;
	}
	@PostMapping("/updateUser")
	public ModelAndView updateUser(User user) throws Exception {
		ModelAndView mav = new ModelAndView();
		userService.updateUser(user);
		mav.setViewName("index");
		return mav;
	}
}
