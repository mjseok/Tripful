package com.ssafy.enjoytrip.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping(value = "/board")
public class BoardController {
	
	@GetMapping("/listNotice/{pageno}")
	ModelAndView listNotice(@PathVariable("pageno") String pageNo) {
		System.out.println("pageNo : "+pageNo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("community/notice");
		return mav;
	}
	
	@GetMapping("/listBoard/{pageno}")
	ModelAndView listBoard(@PathVariable("pageno") String pageNo) {
		System.out.println("pageNo : "+pageNo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("community/sharing");
		return mav;
	}
}
