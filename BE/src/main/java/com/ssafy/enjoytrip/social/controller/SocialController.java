package com.ssafy.enjoytrip.social.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.enjoytrip.social.Like;
import com.ssafy.enjoytrip.social.Review;
import com.ssafy.enjoytrip.social.service.SocialService;
import com.ssafy.enjoytrip.spot.Spot;
import com.ssafy.enjoytrip.user.User;

@RestController
@RequestMapping(value = "/social")
public class SocialController {

	@Autowired
	SocialService socialService;

	@PostMapping("/checkLikeSpot")
	public ResponseEntity<Integer> checkLikeSpot(@RequestBody Like like) throws Exception { 
		try {
			System.out.println("하트 check해보자~ : "+like);
			int count = socialService.checkLikeSpot(like);
			return new ResponseEntity<Integer>(count, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@PostMapping("/addLikeSpot")
	public ResponseEntity<?> addLikeSpot(@RequestBody Like like) throws Exception {
		try {
			System.out.println("하트 추가 하자~ : "+like);
			socialService.addLikeSpot(like);
			return new ResponseEntity<Void>(HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@PostMapping("/deleteLikeSpot")
	public ResponseEntity<?> deleteLikeSpot(@RequestBody Like like) throws Exception {

		try {
			System.out.println("하트 추가 하자~ : "+like);
			socialService.deleteLikeSpot(like);
			return new ResponseEntity<Void>(HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@GetMapping("/getLikedSpots/{uid}")
	public ResponseEntity<?> getLikedSpots(@PathVariable int uid) throws Exception {
//		List<Spot>
		
		try {
			System.out.println("getLikedSpots : "+uid);
			List<Spot> likedSpots = socialService.getLikedSpots(uid);
			return new ResponseEntity<List<Spot>>(likedSpots, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// 리뷰~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	@PostMapping("/addReview")
	public int addReview(Review review, HttpSession session) throws Exception {
		User user = (User) session.getAttribute("user");
		review.setUid(user.getUid());
		return socialService.addReview(review);
	}

	@GetMapping("/getUserReviews")
	public List<Review> getUserReviews(Review review, HttpSession session) throws Exception {
		User user = (User) session.getAttribute("user");
		int uid = user.getUid();
		List<Review> reviews = socialService.getUserReviews(uid);
		return reviews;
	}

	@PostMapping("/updateReview")
	public int updateReview(Review review) throws Exception {
		return socialService.updateReview(review);
	}

	@PostMapping("/deleteReview")
	public int deleteReview(int reviewid) throws Exception {
//		System.out.println("reviewid : "+reviewid);
		return socialService.deleteReview(reviewid);
	}

	@GetMapping("/checkLikeSchedule/{scheduleid}")
	public int checkLikeSchedule(HttpSession session,@PathVariable("scheduleid") int scheduleid) throws Exception {
		User user = (User) session.getAttribute("user");
		int uid = user.getUid();
		int cnt = socialService.checkLikeSchedule(scheduleid, uid);
		return cnt;
	}

}