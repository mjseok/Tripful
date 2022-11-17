package com.ssafy.enjoytrip.spot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.enjoytrip.spot.Sido;
import com.ssafy.enjoytrip.spot.Spot;
import com.ssafy.enjoytrip.spot.mapper.SpotMapper;
import com.ssafy.util.SizeConstant;

import com.ssafy.util.SizeConstant;

@Service
public class SpotServiceImpl implements SpotService {
	
	@Autowired
	private SpotMapper spotMapper;
	
	@Override
	public List<Spot> getHotSpotList(String theme,int sido) throws Exception {
		System.out.println("getHotSpotList 서비스단");
		return spotMapper.getHotSpotList(theme, sido);
	}

	@Override
	public List<Spot> getSpotList(int gugun, int sido,int pageno) throws Exception {
		int limit = SizeConstant.SIZE_PER_LIST;
		pageno=(pageno-1)*limit;
		return spotMapper.getSpotList(gugun, sido,pageno);
	}

	@Override
	public Spot getSpot(int spotid) throws Exception {
		return spotMapper.getSpot(spotid);
	}
	
//	@Override
//	public List<Map<Integer, String>> getSidoList() throws SQLException {
//		return spotMapper.getSidoList();
//	}
	
	@Override
	public List<Sido> getSidoList() throws Exception {
		return spotMapper.getSidoList();
	}
	
	@Override
	public List<String[]> getGugunList(int sidoid) throws Exception {
		System.out.println("sidoId : "+sidoid);
		return spotMapper.getGugunList(sidoid);
	}
	
	@Override
	public int countSpot() throws Exception {
		return spotMapper.countSpot();
	}

}
