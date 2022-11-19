package com.ssafy.enjoytrip.spot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.enjoytrip.spot.Gugun;
import com.ssafy.enjoytrip.spot.Sido;
import com.ssafy.enjoytrip.spot.Spot;
import com.ssafy.enjoytrip.spot.service.SpotService;

@RestController
@RequestMapping(value = "/spot")
public class SpotController {
	
	@Autowired
	SpotService spotService;
	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";
	//Todo : 지워야됨
	@GetMapping("/spot/map")
	public ModelAndView mapSearch() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("search/mapSearch");
		return mav;
	} //->vue로 하는거같음...(?)
	
	//Todo : 지워야됨
	@GetMapping("/locationSearch")
	public ModelAndView locationSearch() throws Exception {
		ModelAndView mav = new ModelAndView();
		List<Sido> sidoList = spotService.getSidoList();
//		System.out.println(sidoList);
		mav.addObject("sidos", sidoList);
		mav.setViewName("search/locationSearch");
		return mav;
	}
	
	@GetMapping("/list")
	public ResponseEntity<List<Spot>> list(@RequestParam("sidoid") int sido, @RequestParam("gugunid") int gugun, @RequestParam("pageno") int pageno) throws Exception {
		//int spotNum = spotService.countSpot();
		//mav.addObject("spotNum", spotNum);
//		System.out.println("gugun : "+gugun + " sido : "+sido+" pageno : "+pageno);
		List<Spot> list = spotService.getSpotList(gugun, sido, pageno);
//		System.out.println("리스트는 : "+list);
		return new ResponseEntity<List<Spot>>(list,HttpStatus.OK);
	}
	@GetMapping("/sido")
	public ResponseEntity<List<Sido>> sidoList() throws Exception{
		List<Sido> sidoList = spotService.getSidoList();
//		System.out.println("sidoList : "+sidoList);
		return new ResponseEntity<List<Sido>>(sidoList,HttpStatus.OK);
	}
	@GetMapping("/gugun")
	public ResponseEntity<List<Gugun>> gugunList(@RequestParam("sidoid") int sidoId) throws Exception{
		List<Gugun> gugunList = spotService.getGugunList(sidoId);
//		System.out.println("gugunList : "+gugunList);
		return new ResponseEntity<List<Gugun>>(gugunList, HttpStatus.OK);
	}
	
	@GetMapping("/{spotid}")
	public ResponseEntity<Spot> detail(@PathVariable("spotid") int spotId) throws Exception {
		return new ResponseEntity<Spot>(spotService.getSpot(spotId),HttpStatus.OK);
	}
	
	@GetMapping("/top/{theme}/{sidoid}")
	public ResponseEntity<List<Spot>> topSpotlist(@PathVariable("theme") String theme, @PathVariable("sidoid") int sidoId) throws Exception {
		return new ResponseEntity<List<Spot>>(spotService.getHotSpotList(theme, sidoId),HttpStatus.OK);
	}
	
}
