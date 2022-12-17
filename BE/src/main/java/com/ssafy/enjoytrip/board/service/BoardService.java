package com.ssafy.enjoytrip.board.service;

import java.util.List;
import java.util.Map;

import com.ssafy.enjoytrip.board.Board;
import com.ssafy.enjoytrip.board.Notice;


public interface BoardService {

	List<Board> listBoard(Map<String, Integer> map) throws Exception;
//
	boolean writeBoard(Board board) throws Exception;
//
	Board getBoard(int boardid) throws Exception;
//
//	void updateBoardHit(int boardid) throws Exception;
//
	boolean modifyBoard(Board board) throws Exception;
//
	void deleteBoard(int boardid) throws Exception;
//
//	int countBoard() throws Exception;
	
	List<Notice> listNotice(Map<String, Integer> map) throws Exception;

	boolean writeNotice(Notice notice) throws Exception;

	Notice getNotice(int noticeid) throws Exception;

//	void updateNoticeHit(int noticeid) throws Exception;
//
	boolean modifyNotice(Notice notice) throws Exception;

	void deleteNotice(int noticeid) throws Exception;

//	int countNotice() throws Exception;

}
