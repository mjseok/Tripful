package com.ssafy.enjoytrip.spot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.enjoytrip.spot.Spot;
import com.ssafy.enjoytrip.spot.service.SpotService;

@RestController
@RequestMapping(value = "/spot")
public class SpotController {
	
	@Autowired
	SpotService spotService;
	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";
	
//	@GetMapping("/spot/map")
//	public ResponseEntity<> mapSearch() {
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("search/mapSearch");
//		return mav;
//	} ->vue로 하는거같음...(?)
//	
//	@GetMapping("/locationSearch")
//	public ModelAndView locationSearch() throws Exception {
//		ModelAndView mav = new ModelAndView();
//		List<String[]> sidoList = spotService.getSidoList();
////		System.out.println(sidoList);
//		mav.addObject("sidos", sidoList);
//		mav.setViewName("search/locationSearch");
//		return mav;
//	}
	
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
	@GetMapping("/sido")
	public ResponseEntity<List<String[]>> sidoList() throws Exception{
		return new ResponseEntity<List<String[]>>(spotService.getSidoList(),HttpStatus.OK);
	}
	@GetMapping("/gugun")
	public ResponseEntity<List<String[]>> gugunList(@PathVariable("sidoid") int sidoId) throws Exception{
		return new ResponseEntity<List<String[]>>(spotService.getGugunList(sidoId),HttpStatus.OK);
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
