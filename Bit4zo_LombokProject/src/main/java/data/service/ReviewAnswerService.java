package data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.dto.ReviewAnswerDto;
import data.mapper.ReviewAnswerMapper;

@Service
public class ReviewAnswerService {
	@Autowired
	ReviewAnswerMapper mapper;
	
	public int getTotalCount()
	{
		return mapper.getTotalCount();
	}
	
	public void insertAnswer(ReviewAnswerDto dto)
	{
		mapper.insertAnswer(dto);
	}
	
	public List<ReviewAnswerDto> getAllAnswer()
	{
		return mapper.getAllAnswer();
	}
	
	public ReviewAnswerDto getAnswer(String idx)
	{
		return mapper.getAnswer(idx);
	}
	
	public void updateAnswer(ReviewAnswerDto dto)
	{
		mapper.updateAnswer(dto);
	}
	
	public void deleteAnswer(String idx)
	{
		mapper.deleteAnswer(idx);
	}
}
