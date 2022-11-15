package com.ssafy.enjoytrip.social.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.enjoytrip.social.Like;
import com.ssafy.enjoytrip.social.Review;
import com.ssafy.enjoytrip.social.mapper.SocialMapper;
import com.ssafy.enjoytrip.spot.Spot;

@Service
public class SocialServiceImpl implements SocialService {

	@Autowired
	SocialMapper socialMapper;

	@Override
	public int addLikeSpot(Like like) throws Exception {
		return socialMapper.addLikeSpot(like);
	}

	@Override
	public List<Spot> getLikedSpots(int uid) throws Exception {
		return socialMapper.getLikedSpots(uid);
	}

	@Override
	public int checkLikeSpot(Like like) throws Exception {
		return socialMapper.checkLikeSpot(like);
	}

//	@Override
//	public int addLikeSchedule(Like like) throws Exception {
//		return socialDao.addLikeSchedule(like);
//	}
//
//    @Override
//    public List<Schedule> getLikedSchedule(int uid) throws Exception {
//        return socialDao.getLikedSchedule(uid);
//    }

	@Override
	public int deleteLikeSpot(Like like) throws Exception {
		return socialMapper.deleteLikeSpot(like);
	}

//	@Override
//	public int deleteLikeSchedule(Like like) throws Exception {
//		return socialDao.deleteLikeSchedule(like);
//	}

	@Override
	public int addReview(Review review) throws Exception {
		return socialMapper.addReview(review);
	}

	@Override
	public int deleteReview(int reviewid) throws Exception {
		return socialMapper.deleteReview(reviewid);
	}

	@Override
	public int updateReview(Review review) throws Exception {
		return socialMapper.updateReview(review);
	}

//	@Override
//	public Review getReview(int reviewid) throws Exception {
//		return socialDao.getReview(reviewid);
//	}

	@Override
	public List<Review> getRecentReviews() throws Exception {
		return socialMapper.getRecentReviews();
	}

	@Override
	public List<Review> getUserReviews(int uid) throws Exception {
		return socialMapper.getUserReviews(uid);
	}

	@Override
	public int checkLikeSchedule(int uid, int scheduleid) throws Exception {
		return socialMapper.checkLikeSchedule(uid,scheduleid);
	}


}
