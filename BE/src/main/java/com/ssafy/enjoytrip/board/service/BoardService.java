package com.ssafy.enjoytrip.board.service;

import java.util.List;
import java.util.Map;

import com.ssafy.enjoytrip.board.Board;


public interface BoardService {

	List<Board> listBoard(Map<String, Integer> map) throws Exception;
//
//	void writeBoard(Board board) throws Exception;
//
	Board getBoard(int boardid) throws Exception;
//
//	void updateBoardHit(int boardid) throws Exception;
//
//	void modifyBoard(Board board) throws Exception;
//
//	void deleteBoard(int boardid) throws Exception;
//
//	int countBoard() throws Exception;
//	
//	List<Board> listNotice(Map<String, Integer> map) throws Exception;
//
//	void writeNotice(Board notice) throws Exception;
//
//	Board getNotice(int noticeid) throws Exception;
//
//	void updateNoticeHit(int noticeid) throws Exception;
//
//	void modifyNotice(Board notice) throws Exception;
//
//	void deleteNotice(int noticeid) throws Exception;
//
//	int countNotice() throws Exception;

}
