package com.ssafy.enjoytrip.spot.mapper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class SpotDaoImpl  {
//	private static SpotDao spotDao = new SpotDaoImpl();
//	private DBUtil dbUtil;
//
//	private SpotDaoImpl() {
//		dbUtil = DBUtil.getInstance();
//	}
//
//	public static SpotDao getSpotDao() {
//		return spotDao;
//	}
//
//	@Override
//	public List<Spot> getHotSpotList(String theme,int sido) throws SQLException {
//		List<Spot> spotList = new ArrayList<>();
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		try {
//			conn= dbUtil.getConnection();
//			StringBuilder sql = new StringBuilder();
//			sql.append("select spotid,title,address,hit,theme,image \n");
//			sql.append("from spot\n");
//			sql.append("where theme=? and sidoid=?\n");
//			sql.append("order by hit desc\n");
//			sql.append("limit 3\n");
//			pstmt = conn.prepareStatement(sql.toString());
//			pstmt.setString(1, theme);
//			pstmt.setInt(2, sido);
//			rs = pstmt.executeQuery();
//			while(rs.next()) {
//				Spot spot = new Spot();
//				spot.setSpotid(rs.getInt("spotid"));
//				spot.setTitle(rs.getString("title"));
//				spot.setAddress(rs.getString("address"));
//				spot.setHit(rs.getString("hit"));
//				spot.setTheme(rs.getString("theme"));
//				spot.setImage(rs.getString("image"));
//				spotList.add(spot);
//			}
//		} finally {
//			dbUtil.close(rs, pstmt, conn);
//		}
//		return spotList;
//	}
//
//	@Override
//	public List<Spot> getSpotList(int gugun, int sido,int pageno) throws SQLException {
//		List<Spot> spotList = new ArrayList<>();
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		try {
//			conn= dbUtil.getConnection();
//			StringBuilder sql = new StringBuilder();
//			sql.append("select spotid,title,address,hit,theme,image,lat,lang \n");
//			sql.append("from spot\n");
//			sql.append("where gugunid=? and sidoid=?\n");
//			sql.append("order by hit desc\n");
//			sql.append("limit ?,12 \n");
//			pstmt = conn.prepareStatement(sql.toString());
//			pstmt.setInt(1, gugun);
//			pstmt.setInt(2, sido);
//			pstmt.setInt(3, pageno);
//			rs = pstmt.executeQuery();
//			while(rs.next()) {
//				Spot spot = new Spot();
//				spot.setSpotid(rs.getInt("spotid"));
//				spot.setTitle(rs.getString("title"));
//				spot.setAddress(rs.getString("address"));
//				spot.setHit(rs.getString("hit"));
//				spot.setTheme(rs.getString("theme"));
//				spot.setImage(rs.getString("image"));
//				spotList.add(spot);
//			}
//		} finally {
//			dbUtil.close(rs, pstmt, conn);
//		}
//		return spotList;
//	}
//
//	@Override
//	public Spot getSpot(int spotid) throws SQLException {
//		Spot spot = new Spot();
//		List<Spot> spotList = new ArrayList<>();
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		try {
//			conn= dbUtil.getConnection();
//			StringBuilder sql = new StringBuilder();
//			sql.append("select s.spotid,s.title,s.tel,s.address,s.theme,s.image, s.lat, s.lang, d.`desc`\n");
//			sql.append("from spot s, description d\n");
//			sql.append("where s.spotid=? and s.contentId=d.contentId\n");
//			pstmt = conn.prepareStatement(sql.toString());
//			pstmt.setInt(1, spotid);
//			rs = pstmt.executeQuery();
//			if(rs.next()) {
//				spot.setSpotid(rs.getInt("spotid"));
//				spot.setTitle(rs.getString("title"));
//				spot.setTel(rs.getString("tel"));
//				spot.setAddress(rs.getString("address"));
//				spot.setTheme(rs.getString("theme"));
//				spot.setImage(rs.getString("image"));
//				spot.setLat(rs.getString("lat"));
//				spot.setLang(rs.getString("lang"));
//				spot.setDesc(rs.getString("desc"));
//				spotList.add(spot);
//			}
//		} finally {
//			dbUtil.close(rs, pstmt, conn);
//		}
//		return spot;
//		
//	}
//
//	@Override
//	public List<String[]> getSidoList() throws SQLException {
//		List<String[]> sidoList = new ArrayList<>();
//		String[] sidoMap;
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		try {
//			conn= dbUtil.getConnection();
//			StringBuilder sql = new StringBuilder();
//			sql.append("select sidoid,name\n");
//			sql.append("from sido\n");
//			pstmt = conn.prepareStatement(sql.toString());
//			rs = pstmt.executeQuery();
//			while(rs.next()) {
//				sidoMap = new String[2];
//				sidoMap[0]=rs.getInt("sidoid")+"";
//				sidoMap[1]=rs.getString("name");
//				sidoList.add(sidoMap);
//			}
//		} finally {
//			dbUtil.close(rs, pstmt, conn);
//		}
//		return sidoList;
//	}
//
//	@Override
//	public List<String[]> getGugunList(int sidoid) throws SQLException  {
//		List<String[]> gugunList = new ArrayList<>();
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		try {
//			conn= dbUtil.getConnection();
//			StringBuilder sql = new StringBuilder();
//			sql.append("select gugunid, replace(name, char(13), '') as name \n");
//			sql.append("from gugun \n");
//			sql.append("where sidoid=? \n");
//			pstmt = conn.prepareStatement(sql.toString());
//			pstmt.setInt(1, sidoid);
//			rs = pstmt.executeQuery();
//			while(rs.next()) {
//				gugunList.add(new String[] {rs.getString("gugunid"), rs.getString("name")});
//			}
//		} finally {
//			dbUtil.close(rs, pstmt, conn);
//		}
//		return gugunList;
//	}
//
//	@Override
//	public int countSpot() throws SQLException {
//		int cnt= 0;
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//
//		try {
//			conn = dbUtil.getConnection();
//			StringBuilder sql = new StringBuilder();
//			sql.append("select count(*) \n");
//			sql.append("from spot ");
//			pstmt = conn.prepareStatement(sql.toString());
//			rs = pstmt.executeQuery();
//			rs.next();
//			cnt = rs.getInt(1);
//		} finally {
//			dbUtil.close(rs, pstmt, conn);
//		}
//
//		return cnt;
//	}
//	


}

