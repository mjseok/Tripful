package com.ssafy.enjoytrip.social.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.enjoytrip.schedule.Schedule;
import com.ssafy.enjoytrip.social.Like;
import com.ssafy.enjoytrip.social.Review;
import com.ssafy.enjoytrip.spot.Spot;

@Mapper
public interface SocialMapper {
	int addLikeSpot(Like like) throws SQLException;

	List<Spot> getLikedSpots(int uid) throws SQLException;
	
	int checkLikeSpot(Like like) throws SQLException;

	int addLikeSchedule(Like like) throws SQLException;

    List<Schedule> getLikedSchedule(int uid) throws SQLException;
    
	int deleteLikeSpot(Like like) throws SQLException;

	int deleteLikeSchedule(Like like) throws SQLException;
	
	int addReview(Review review) throws SQLException;
	
	int deleteReview(int reviewid) throws SQLException;
	
	int updateReview(Review review) throws SQLException;
	
	Review getReview(int reviewid) throws SQLException;

	List<Review> getRecentReviews() throws SQLException;

	List<Review> getUserReviews(int uid) throws SQLException;

	int checkLikeSchedule(int uid,int scheduleid) throws SQLException;

}
