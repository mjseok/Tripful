package com.ssafy.enjoytrip.user.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.enjoytrip.service.JwtServiceImpl;
import com.ssafy.enjoytrip.user.User;
import com.ssafy.enjoytrip.user.service.UserService;

import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;


@RestController
@RequestMapping("/user")
public class UserController {
	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";
	
	@Autowired
	private JwtServiceImpl jwtService;
	
	@Autowired
	UserService userService;

	
	@GetMapping("/mypage")
	public ModelAndView myPage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/mypage");
		return mav;
	}
	@PostMapping("/login")
	public ResponseEntity<Map<String, Object>> login(
			@RequestBody @ApiParam(value = "로그인 시 필요한 회원정보(아이디, 비밀번호).", required = true) User user) {
		System.out.println("들어온다잉 "+user);
		Map<String, Object> resultMap = new HashMap<>();
		HttpStatus status = null;
		try {
			User loginUser = userService.login(user.getId(),user.getPwd());
			if (loginUser != null) {
				String accessToken = jwtService.createAccessToken("id", loginUser.getId());// key, data
				String refreshToken = jwtService.createRefreshToken("id", loginUser.getId());// key, data
				userService.saveRefreshToken(user.getId(), refreshToken);
//				logger.debug("로그인 accessToken 정보 : {}", accessToken);
//				logger.debug("로그인 refreshToken 정보 : {}", refreshToken);
				resultMap.put("access-token", accessToken);
				resultMap.put("refresh-token", refreshToken);
				resultMap.put("message", SUCCESS);
				status = HttpStatus.ACCEPTED;
			} else {
				resultMap.put("message", FAIL);
				status = HttpStatus.ACCEPTED;
			}
		} catch (Exception e) {
//			logger.error("로그인 실패 : {}", e);
			resultMap.put("message", e.getMessage());
			status = HttpStatus.INTERNAL_SERVER_ERROR;
		}
		return new ResponseEntity<Map<String, Object>>(resultMap, status);
	}
	@ApiOperation(value = "회원인증", notes = "회원 정보를 담은 Token을 반환한다.", response = Map.class)
	@GetMapping("/info/{id}")
	public ResponseEntity<Map<String, Object>> getInfo(
			@PathVariable("id") @ApiParam(value = "인증할 회원의 아이디.", required = true) String id,
			HttpServletRequest request) {
//		logger.debug("userid : {} ", userid);
		Map<String, Object> resultMap = new HashMap<>();
		HttpStatus status = HttpStatus.UNAUTHORIZED;
		if (jwtService.checkToken(request.getHeader("access-token"))) {
//			logger.info("사용 가능한 토큰!!!");
			try {
//				로그인 사용자 정보.
				User user = userService.userInfo(id);
				resultMap.put("userInfo", user);
				resultMap.put("message", SUCCESS);
				status = HttpStatus.ACCEPTED;
			} catch (Exception e) {
//				logger.error("정보조회 실패 : {}", e);
				resultMap.put("message", e.getMessage());
				status = HttpStatus.INTERNAL_SERVER_ERROR;
			}
		} else {
//			logger.error("사용 불가능 토큰!!!");
			resultMap.put("message", FAIL);
			status = HttpStatus.UNAUTHORIZED;
		}
		return new ResponseEntity<Map<String, Object>>(resultMap, status);
	}
	@ApiOperation(value = "Access Token 재발급", notes = "만료된 access token을 재발급받는다.", response = Map.class)
	@PostMapping("/refresh")
	public ResponseEntity<?> refreshToken(@RequestBody User user, HttpServletRequest request)
			throws Exception {
		Map<String, Object> resultMap = new HashMap<>();
		HttpStatus status = HttpStatus.ACCEPTED;
		String token = request.getHeader("refresh-token");
//		logger.debug("token : {}, memberDto : {}", token, memberDto);
		if (jwtService.checkToken(token)) {
			if (token.equals(userService.getRefreshToken(user.getId()))) {
				String accessToken = jwtService.createAccessToken("userid", user.getId());
//				logger.debug("token : {}", accessToken);
//				logger.debug("정상적으로 액세스토큰 재발급!!!");
				resultMap.put("access-token", accessToken);
				resultMap.put("message", SUCCESS);
				status = HttpStatus.ACCEPTED;
			}
		} else {
//			logger.debug("리프레쉬토큰도 사용불!!!!!!!");
			status = HttpStatus.UNAUTHORIZED;
		}
		return new ResponseEntity<Map<String, Object>>(resultMap, status);
	}
//
//	@PostMapping("/login")
//	public ModelAndView login(@RequestParam Map<String, String> map, Model model, HttpSession session,
//			HttpServletResponse response,HttpServletRequest request) throws Exception {
//
//		String id = map.get("id");
//		String pwd = map.get("pwd");
//		
////		System.out.println("size : "+map.size());
////		System.out.println("id : "+map.get("id"));
////		System.out.println("pwd : "+map.get("pwd"));
//
//		User user = userService.login(id, pwd);
//		System.out.println(user);
//
//		ModelAndView mav = new ModelAndView();
//		if (user != null) {
//			session = request.getSession();
//			session.setAttribute("user", user);
//			mav.setViewName("index");
//		} else {
//			request.setAttribute("msg", "아이디 / 비밀번호가 존재하지 않습니다!!!");
//			mav.setViewName("user/login");
//		}
//
//		return mav;
//	}
	@ApiOperation(value = "로그아웃", notes = "회원 정보를 담은 Token을 제거한다.", response = Map.class)
	@GetMapping("/logout/{id}")
	public ResponseEntity<?> removeToken(@PathVariable("id") String id) {
		Map<String, Object> resultMap = new HashMap<>();
		HttpStatus status = HttpStatus.ACCEPTED;
		try {
			userService.deleRefreshToken(id);
			resultMap.put("message", SUCCESS);
			status = HttpStatus.ACCEPTED;
		} catch (Exception e) {
//			logger.error("로그아웃 실패 : {}", e);
			resultMap.put("message", e.getMessage());
			status = HttpStatus.INTERNAL_SERVER_ERROR;
		}
		return new ResponseEntity<Map<String, Object>>(resultMap, status);

	}
	
	@GetMapping("/signUp")
	public ModelAndView signUp() throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/signup");
		return mav;
	}
	
	// 회원 가입
	@PostMapping
	public ResponseEntity<?> userSignUp(@RequestBody User user){
		try {
			userService.signUp(user);
			return new ResponseEntity<User>(user,HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

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
	@PostMapping("/update")
	public ResponseEntity<?> updateUser(@RequestBody User user) throws Exception {
		try {
			System.out.println("업데이트 하자~ : "+user);
			userService.updateUser(user);
			return new ResponseEntity<User>(user,HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@PostMapping("/resign")
	public ResponseEntity<?> removeUser(@RequestBody User user) {
		try {
			int uid = user.getUid();
			System.out.println("uid : "+uid);
			userService.removeUser(uid);
			return new ResponseEntity<User>(user,HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
