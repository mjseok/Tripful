package com.ssafy.enjoytrip.board.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.enjoytrip.board.Board;

@Mapper
public interface BoardMapper {
	List<Board> listBoard(Map<String, Integer> map) throws SQLException;

	int writeBoard(Board board) throws SQLException;
//
	Board getBoard(int boardid) throws SQLException;
//
//	void updateBoardHit(int boardid) throws SQLException;
//
	int modifyBoard(Board board) throws SQLException;

	void deleteBoard(int boardid) throws SQLException;

//	int countBoard() throws SQLException;
	
	List<Board> listNotice(Map<String, Integer> map) throws SQLException;

	int writeNotice(Board notice) throws SQLException;

//	Board getNotice(int noticeid) throws SQLException;
//
//	void updateNoticeHit(int noticeid) throws SQLException;
//
//	void modifyNotice(Board notice) throws SQLException;
//
//	void deleteNotice(int noticeid) throws SQLException;
//
//	int countNotice() throws SQLException;
	
}
