package com.ssafy.enjoytrip.social.service;

import java.util.List;

import com.ssafy.enjoytrip.social.Like;
import com.ssafy.enjoytrip.social.Review;
import com.ssafy.enjoytrip.spot.Spot;

public interface SocialService {
	int addLikeSpot(Like like) throws Exception;
	
	List<Spot> getLikedSpots(int uid) throws Exception;

	int checkLikeSpot(Like like) throws Exception;
	
//	int addLikeSchedule(Like like) throws Exception;
//
//    List<Schedule> getLikedSchedule(int uid) throws Exception;
    
	int deleteLikeSpot(Like like) throws Exception;

//	int deleteLikeSchedule(Like like) throws Exception;
	
	int addReview(Review review) throws Exception;
	
	int deleteReview(int reviewid) throws Exception;
	
	int updateReview(Review review) throws Exception;
	
//	Review getReview(int reviewid) throws Exception;

	List<Review> getUserReviews(int uid) throws Exception;
	
	List<Review> getRecentReviews() throws Exception;

	int checkLikeSchedule(int uid,int scheduleid) throws Exception;
}
