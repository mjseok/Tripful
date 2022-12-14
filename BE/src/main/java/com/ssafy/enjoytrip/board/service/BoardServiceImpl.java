package com.ssafy.enjoytrip.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.enjoytrip.board.Board;
import com.ssafy.enjoytrip.board.Notice;
import com.ssafy.enjoytrip.board.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper boardMapper;
	
	@Override
	public List<Board> listBoard(Map<String, Integer> map) throws Exception {
		int pgno = map.get("pgno");
		int spl = 15;
		int start = (pgno - 1) * spl;
		map.put("start", start);
		map.put("spl", spl);
		return boardMapper.listBoard(map);
	}

	@Override
	public boolean writeBoard(Board board) throws Exception {
		if(boardMapper.writeBoard(board)==1) return true;
		return false;
	}
//
	@Override
	public Board getBoard(int boardid) throws Exception {
		return boardMapper.getBoard(boardid);
	}
//
//	@Override
//	public void updateBoardHit(int boardid) throws Exception {
//		boardMapper.updateBoardHit(boardid);
//	}
//
	@Override
	public boolean modifyBoard(Board board) throws Exception {
		if(boardMapper.modifyBoard(board)==1) return true;
		return false;
	}

	@Override
	public void deleteBoard(int boardid) throws Exception {
		boardMapper.deleteBoard(boardid);
	}

//	@Override
//	public int countBoard() throws Exception {
//		return boardMapper.countBoard();
//	}
//
	@Override
	public List<Notice> listNotice(Map<String, Integer> map) throws Exception {
		int pgno = map.get("pgno");
		int spl = 15;
		int start = (pgno - 1) * spl;
		map.put("start", start);
		map.put("spl", spl);
		return boardMapper.listNotice(map);
	}

	@Override
	public boolean writeNotice(Notice notice) throws Exception {
		
		if(boardMapper.writeNotice(notice)==1) return true;
		return false;
	}

	@Override
	public Notice getNotice(int noticeid) throws Exception {
		System.out.println("공지사항 얻어오기 impl");
		return boardMapper.getNotice(noticeid);
	}

//	@Override
//	public void updateNoticeHit(int noticeid) throws Exception {
//		boardMapper.updateNoticeHit(noticeid);
//	}
//
	@Override
	public boolean modifyNotice(Notice notice) throws Exception {
		System.out.println("변경하는 notice : "+notice);
		if(boardMapper.modifyNotice(notice)==1) return true;
		return false;
	}

	@Override
	public void deleteNotice(int noticeid) throws Exception {
		boardMapper.deleteNotice(noticeid);
	}

//	@Override
//	public int countNotice() throws Exception {
//		return boardMapper.countNotice();
//	}

}
