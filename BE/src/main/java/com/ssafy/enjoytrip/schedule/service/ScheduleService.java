package com.ssafy.enjoytrip.schedule.service;

import java.util.List;

import com.ssafy.enjoytrip.schedule.Schedule;
import com.ssafy.enjoytrip.spot.Spot;

public interface ScheduleService {
		//스케줄 자체를 등록
		void write(Schedule schedule) throws Exception;
		//스케줄 가져오기(모두)
		List<Schedule> getScheduleList() throws Exception;
//		//스케줄 하나 가져오기
//		Schedule getSchedule(int scheduleid) throws Exception;
		//내 스케줄 가져오기
		List<Schedule> getScheduleList(int uid) throws Exception;
//		//스케줄 수정
//		void modifySchedule(Schedule schedule) throws Exception;
//		//스케줄 삭제
		void deleteSchedule(int scheduleid) throws Exception;
        void deleteSpots(int scheduleid) throws Exception;
//		//schedule에 spot추가
		void addSpot(String spotids, int uid) throws Exception;
		//찜목록에 추가
		List<Spot> likeSpots(int uid) throws Exception;
		//스케줄에 있는 spot 다 가져오기
		List<Spot> getSpots(int scheduleid) throws Exception;
//		//스케줄 다 가져오기
//		List<Schedule> getAllSchedule() throws Exception;
//		int getScheduleid(int uid) throws Exception;
}
