package com.ssafy.enjoytrip.schedule.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ssafy.enjoytrip.schedule.Schedule;
import com.ssafy.enjoytrip.schedule.service.ScheduleService;
import com.ssafy.enjoytrip.spot.Spot;
import com.ssafy.enjoytrip.user.User;

@RestController
@RequestMapping(value = "/schedule")
public class ScheduleController {

	@Autowired
	ScheduleService scheduleService;

	@GetMapping
	public ModelAndView schedule(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		ModelAndView mav = new ModelAndView();
		List<Spot> likedSpot = scheduleService.likeSpots(user.getUid());
		ObjectMapper mapper = new ObjectMapper();
		String jsonSpots = mapper.writeValueAsString(likedSpot);
		mav.addObject("likedSpots", jsonSpots);
		System.out.println("likedSpots " + jsonSpots);
		mav.setViewName("schedule/schedule");
		return mav;
	}

	@PostMapping("/register")
	public ModelAndView register(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		ModelAndView mav = new ModelAndView();
		Schedule schedule = new Schedule();
		schedule.setUid(user.getUid());

		schedule.setTitle(request.getParameter("title"));
		schedule.setTheme(request.getParameter("theme"));

		String scheduleSpots = request.getParameter("schedulespots");
		scheduleService.write(schedule);
		scheduleService.addSpot(scheduleSpots, user.getUid());
		mav.setViewName("user/mypage");
		return mav;
	}

	@GetMapping("/scheduleList")
	public List<Schedule> scheduleList(HttpSession session) throws Exception {
		User user = (User) session.getAttribute("user");
		int uid = user.getUid();
		List<Schedule> schedules = null;
		schedules = scheduleService.getScheduleList(uid);
		return schedules;
	}

	@GetMapping("/allSchedule")
	public List<Schedule> allSchedule() throws Exception {
		List<Schedule> schedules = null;
		schedules = scheduleService.getScheduleList();
		return schedules;
	}

	// getSpotsInSchedule
	@GetMapping("/spotsInSchedule/{scheduleid}")
	public List<Spot> spotsInSchedule(@PathVariable("scheduleid") int scheduleid) throws Exception {
		List<Spot> spots = null;
		spots = scheduleService.getSpots(scheduleid);
		return spots;
	}

	@DeleteMapping("deleteSpots/{scheduleid}")
	public int deleteSpots(@PathVariable("scheduleid") int scheduleid) throws Exception {
		scheduleService.deleteSchedule(scheduleid);
		return 1;
	}

	@DeleteMapping("deleteSchedule/{scheduleid}")
	public int deleteSchedule(@PathVariable("scheduleid") int scheduleid) throws Exception {
		scheduleService.deleteSpots(scheduleid);
		return 1;
	}
}
