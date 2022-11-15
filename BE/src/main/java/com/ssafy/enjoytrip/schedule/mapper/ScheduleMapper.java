package com.ssafy.enjoytrip.schedule.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.enjoytrip.schedule.Schedule;
import com.ssafy.enjoytrip.spot.Spot;

@Mapper
public interface ScheduleMapper {
		//스케줄 자체를 등록
		void write(Schedule schedule) throws SQLException;
		//스케줄 가져오기(모두)
		List<Schedule> allSchedule() throws SQLException;
//		//스케줄 하나 가져오기
//		Schedule getSchedule(int scheduleid) throws SQLException;
		//내 스케줄 가져오기
		List<Schedule> scheduleList(int uid) throws SQLException;
//		List<Schedule> getAllSchedule() throws SQLException;
//		//스케줄 수정
//		void modifySchedule(Schedule schedule) throws SQLException;
		//스케줄 삭제
		void deleteSchedule(int scheduleid) throws SQLException;
	    void deleteSpots(int scheduleid) throws SQLException;
		//schedule에 spot추가
		void addSpot(int spotid,int scheduleid) throws SQLException;
		//찜한 목록 가져오기
		List<Spot> likeSpots(int uid) throws SQLException;
		//스케줄 갯수 가져오기
//		int getScheduleCnt() throws SQLException;
//		//theme별로 schedule가져오기
//		//List<Schedule> getScheduleListByTheme(String theme) throws SQLException;
//		
	    List<Spot> getSpots(int scheduleid) throws SQLException;
//	    
	    int getScheduleid(int uid) throws SQLException;
}
