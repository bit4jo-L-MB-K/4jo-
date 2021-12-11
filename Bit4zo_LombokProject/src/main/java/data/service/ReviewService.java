package data.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.dto.ReviewDto;
import data.mapper.ReviewMapper;

@Service
public class ReviewService {
	@Autowired
	ReviewMapper mapper;
	
	public int getTotalCount()
	{
		return mapper.getTotalCount();
	}
	
	public ReviewDto getData(String num)
	{
		return mapper.getData(num);
	}
	
	public int getMaxNum()
	{
		return mapper.getMaxNum();
	}
	
	public List<ReviewDto> getList(int start,int perpage)
	{
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		map.put("start", start);
		map.put("perpage", perpage);
		return mapper.getList(map);
	}
	
	public void insertReview(ReviewDto dto)
	{
		mapper.insertReview(dto);
	}
	
	public void updateReview(ReviewDto dto)
	{
		mapper.updateReview(dto);
	}
	public void deleteReview(String num)
	{
		mapper.deleteReview(num);
	}
}
