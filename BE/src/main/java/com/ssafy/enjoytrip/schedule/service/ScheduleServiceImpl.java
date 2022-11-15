package com.ssafy.enjoytrip.schedule.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.enjoytrip.schedule.Schedule;
import com.ssafy.enjoytrip.schedule.mapper.ScheduleMapper;
import com.ssafy.enjoytrip.spot.Spot;

@Service
public class ScheduleServiceImpl implements ScheduleService{
//	private static ScheduleService scheduleService = new ScheduleServiceImpl();

	@Autowired
	private ScheduleMapper scheduleMapper;
//	private ScheduleServiceImpl() {
//		scheduleDao = ScheduleDaoImpl.getScheduleDao();
//	}
//	public static ScheduleService getScheduleService() {
//		return scheduleService;
//	}

	@Override
	public List<Schedule> getScheduleList() throws Exception {
		
		return scheduleMapper.allSchedule();
	}
//
//	@Override
//
//	public Schedule getSchedule(int scheduleid) throws Exception {
//		return scheduleDao.getSchedule(scheduleid);
//	}
//
	@Override
	public List<Schedule> getScheduleList(int uid) throws Exception {
		return scheduleMapper.scheduleList(uid);
	}
//
//	@Override
//	public void modifySchedule(Schedule schedule) throws Exception {
//		scheduleDao.modifySchedule(schedule);
//	}
//
	@Override
	public void deleteSchedule(int scheduleid) throws Exception {
		scheduleMapper.deleteSchedule(scheduleid);
	}
	
    @Override
    public void deleteSpots(int scheduleid) throws Exception {
    	scheduleMapper.deleteSpots(scheduleid);
    }

	@Override
	public void addSpot(String spotids, int uid) throws Exception {
		int scheduleid = scheduleMapper.getScheduleid(uid);
		String[] spotidlist = spotids.split(",");
		for(int i=0;i<spotidlist.length;i++) {
			int spotid = Integer.parseInt(spotidlist[i]);
			scheduleMapper.addSpot(spotid, scheduleid);
		}
	}
	@Override
	public void write(Schedule schedule) throws Exception {
		scheduleMapper.write(schedule);
		
	}
	
	@Override
	public List<Spot> likeSpots(int uid) throws Exception {
		return scheduleMapper.likeSpots(uid);
	}
    @Override
    public List<Spot> getSpots(int scheduleid) throws Exception {
        return scheduleMapper.getSpots(scheduleid);
    }
//    @Override
//    public List<Schedule> getAllSchedule() throws Exception {
//        
//        return scheduleDao.getAllSchedule();
//    }
//    @Override
//    public int getScheduleid(int uid) throws Exception {
//        return scheduleDao.getScheduleid(uid);
//    }

}
