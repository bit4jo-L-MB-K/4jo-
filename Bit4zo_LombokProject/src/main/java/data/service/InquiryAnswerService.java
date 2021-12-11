package data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.dto.InquiryAnswerDto;
import data.mapper.InquiryAnswerMapper;

@Service
public class InquiryAnswerService {
	
	@Autowired
	InquiryAnswerMapper mapper;
	
	public void insertAnswer(InquiryAnswerDto dto) {
		mapper.insertAnswer(dto);
	}
	public List<InquiryAnswerDto> getAllAnswer(String num){
		return mapper.getAllAnswer(num);
	}
	
	public InquiryAnswerDto getAnswer(String idx){
		return mapper.getAnswer(idx);
	}
	
	public void updateAnswer(InquiryAnswerDto dto) {
		mapper.updateAnswer(dto);
	}
	
	public void deleteAnswer(String idx) {
		mapper.deleteAnswer(idx);
	}

}
