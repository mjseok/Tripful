package com.ssafy.enjoytrip.board.service;

import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {

//	private static BoardService boardService = new BoardServiceImpl();
//	private BoardDao boardDao;
//
//	private BoardServiceImpl() {
//		boardDao = BoardDaoImpl.getBoardDao();
//	}
//
//	public static BoardService getBoardService() {
//		return boardService;
//	}
//
//	@Override
//	public List<Board> listBoard(Map<String, String> map) throws Exception {
//		int pgno = Integer.parseInt(map.get("pgno"));
//		int spl = 15;
//		int start = (pgno - 1) * spl;
//		map.put("start", start + "");
//		map.put("spl", spl + "");
//		return boardDao.listBoard(map);
//	}
//
//	@Override
//	public void writeBoard(Board board) throws Exception {
//		boardDao.writeBoard(board);
//	}
//
//	@Override
//	public Board getBoard(int boardid) throws Exception {
//		return boardDao.getBoard(boardid);
//	}
//
//	@Override
//	public void updateBoardHit(int boardid) throws Exception {
//		boardDao.updateBoardHit(boardid);
//	}
//
//	@Override
//	public void modifyBoard(Board board) throws Exception {
//		boardDao.modifyBoard(board);
//	}
//
//	@Override
//	public void deleteBoard(int boardid) throws Exception {
//		boardDao.deleteBoard(boardid);
//	}
//
//	@Override
//	public int countBoard() throws Exception {
//		return boardDao.countBoard();
//	}
//
//	@Override
//	public List<Board> listNotice(Map<String, String> map) throws Exception {
//		int pgno = Integer.parseInt(map.get("pgno"));
//		int spl = 15;
//		int start = (pgno - 1) * spl;
//		map.put("start", start + "");
//		map.put("spl", spl + "");
//		return boardDao.listNotice(map);
//	}
//
//	@Override
//	public void writeNotice(Board notice) throws Exception {
//		boardDao.writeNotice(notice);
//	}
//
//	@Override
//	public Board getNotice(int noticeid) throws Exception {
//		return boardDao.getNotice(noticeid);
//	}
//
//	@Override
//	public void updateNoticeHit(int noticeid) throws Exception {
//		boardDao.updateNoticeHit(noticeid);
//	}
//
//	@Override
//	public void modifyNotice(Board notice) throws Exception {
//		boardDao.modifyNotice(notice);
//	}
//
//	@Override
//	public void deleteNotice(int noticeid) throws Exception {
//		boardDao.deleteNotice(noticeid);
//	}
//
//	@Override
//	public int countNotice() throws Exception {
//		return boardDao.countNotice();
//	}

}
