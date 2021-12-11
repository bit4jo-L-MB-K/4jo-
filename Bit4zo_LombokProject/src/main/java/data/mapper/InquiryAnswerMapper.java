package data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.dto.InquiryAnswerDto;

@Mapper
public interface InquiryAnswerMapper {
	public void insertAnswer(InquiryAnswerDto dto);
	public List<InquiryAnswerDto> getAllAnswer(String num);
	public InquiryAnswerDto getAnswer(String idx);
	public void updateAnswer(InquiryAnswerDto dto);
	public void deleteAnswer(String idx);
}
