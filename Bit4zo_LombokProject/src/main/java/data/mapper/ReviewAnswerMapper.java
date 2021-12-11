package data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.dto.ReviewAnswerDto;

@Mapper
public interface ReviewAnswerMapper {
	public int getTotalCount();
	public List<ReviewAnswerDto> getAllAnswer();
	public ReviewAnswerDto getAnswer(String idx);
	public void insertAnswer(ReviewAnswerDto dto);
	public void updateAnswer(ReviewAnswerDto dto);
	public void deleteAnswer(String idx);
}
