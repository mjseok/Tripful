package com.ssafy.enjoytrip.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.enjoytrip.board.Board;
import com.ssafy.enjoytrip.board.service.BoardService;

import io.swagger.annotations.Api;

@RestController
@RequestMapping(value = "/board")
@Api("Board 컨트롤러 API")
public class BoardController {
	@Autowired
	BoardService boardService;
	private Map<String, Integer> map;		
//	@GetMapping("/notice/list/{pageno}")
//	public ResponseEntity<List<Board>> listNotice(@PathVariable("pageno") String pageNo) throws Exception{
//		map = new HashMap<>();
//		map.put("pgno",Integer.parseInt(pageNo));
//		List<Board> list = boardService.listNotice(map);
//		return new ResponseEntity<List<Board>>(list,HttpStatus.OK);
//	}
	@GetMapping("/community/list/{pageno}")
	public ResponseEntity<List<Board>> listBoard(@PathVariable("pageno") String pageNo) throws Exception{
		System.out.println("여기다");
		map = new HashMap<>();
		map.put("pgno",Integer.parseInt(pageNo)); 
		List<Board> list = boardService.listBoard(map);
		return new ResponseEntity<List<Board>>(list,HttpStatus.OK);
	}
	@GetMapping("/community/{boardid}")
	public ResponseEntity<Board> getBoard(@PathVariable("boardid") int boardid) throws Exception{
		Board board = boardService.getBoard(boardid);
		return new ResponseEntity<Board>(board,HttpStatus.OK);
	}
//	ModelAndView listNotice(@PathVariable("pageno") String pageNo) {
//		System.out.println("pageNo : "+pageNo);
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("community/notice");
//		return mav;
//	}
//	
//	@GetMapping("/community/list/{pageno}")
//	ModelAndView listBoard(@PathVariable("pageno") String pageNo) {
//		System.out.println("pageNo : "+pageNo);
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("community/sharing");
//		return mav;
//	}
}
