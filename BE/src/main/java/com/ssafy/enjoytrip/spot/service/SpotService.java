package com.ssafy.enjoytrip.spot.service;

import java.util.List;

import com.ssafy.enjoytrip.spot.Gugun;
import com.ssafy.enjoytrip.spot.Sido;
import com.ssafy.enjoytrip.spot.Spot;

public interface SpotService {
//	//메인 페이지에서 추천 여행지 - 테마별(전체는 테마 합쳐서)
	List<Spot> getHotSpotList(String theme, int sido) throws Exception;
	
//	//지역별 조회,페이지네이션
	List<Spot> getSpotList(int gugun,int sido,int pageno,int theme) throws Exception;
//	//장소detail
	Spot getSpot(int spotid) throws Exception;
	
	//시도 리스트
	//List<Map<Integer,String>> getSidoList() throws SQLException;
	List<Sido> getSidoList() throws Exception;
	
//	//구군 리스트
	List<Gugun> getGugunList(int sidoid) throws Exception;
	int countSpot() throws Exception;
}
