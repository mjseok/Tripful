package com.ssafy.enjoytrip.spot.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.enjoytrip.social.Review;
import com.ssafy.enjoytrip.spot.Spot;
import com.ssafy.enjoytrip.spot.service.SpotService;

@RestController
@RequestMapping(value = "/spot")
public class SpotController {
	
	@Autowired
	SpotService spotService;
	
	@GetMapping("/mapSearch")
	public ModelAndView mapSearch() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("search/mapSearch");
		return mav;
	}
	
	@GetMapping("/locationSearch")
	public ModelAndView locationSearch() throws Exception {
		ModelAndView mav = new ModelAndView();
		List<String[]> sidoList = spotService.getSidoList();
//		System.out.println(sidoList);
		mav.addObject("sidos", sidoList);
		mav.setViewName("search/locationSearch");
		return mav;
	}
	
	@GetMapping("/list/{sidoid}/{gugunid}/{pageno}")
	public ModelAndView list(@PathVariable("sidoid") int sido, @PathVariable("gugunid") int gugun, @PathVariable("pageno") int pageno) throws Exception {
				
		ModelAndView mav = new ModelAndView();
		List<Spot> spotList = spotService.getSpotList(gugun, sido, pageno);
		
		System.out.println("list : "+spotList);
		
		int spotNum = spotService.countSpot();
		
		mav.setViewName("search/spot");
		mav.addObject("spots", spotList);
		mav.addObject("spotNum", spotNum);
		return mav;
	}
	
	@GetMapping("/gugunList/{sidoid}")
	public ModelAndView gugunList(@PathVariable("sidoid") int sidoId) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<String[]> gugunList = spotService.getGugunList(sidoId);
		System.out.println(gugunList);
		mav.addObject("guguns", gugunList);
		mav.setViewName("search/gugun");
		System.out.println("gugunList로 이동!!");
		return mav;
	}
	
	@GetMapping("/detail/{spotid}")
	public ModelAndView detail(@PathVariable("spotid") int spotId) throws Exception {
		ModelAndView mav = new ModelAndView();
		Spot spot = spotService.getSpot(spotId);
		System.out.println(spot);
		mav.addObject("spotDetail", spot);
		mav.setViewName("search/spotDetail");
		return mav;
	}
	
	@GetMapping("/topSpotlist/{theme}/{sidoid}")
	public ModelAndView topSpotlist(@PathVariable("theme") String theme, @PathVariable("sidoid") int sidoId) throws Exception {
		System.out.println("topsPotList왜 안되지");
		ModelAndView mav = new ModelAndView();
		List<Spot> topSpotList = spotService.getHotSpotList(theme,sidoId);
		System.out.println(topSpotList);
		mav.setViewName("search/topSpots");
		mav.addObject("topSpots", topSpotList);
		return mav;
	}
	
}
