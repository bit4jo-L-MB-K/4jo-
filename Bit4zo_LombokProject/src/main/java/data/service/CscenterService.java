package data.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.dto.FaqDto;
import data.dto.NoticeDto;
import data.mapper.CscenterMapper;

@Service
public class CscenterService {
	
	@Autowired
	CscenterMapper mapper;
	
	//공지사항
	public void insertNotice(NoticeDto dto) {
		mapper.insertNotice(dto);
	}
	public int getTotalCount() {
		return mapper.getTotalCount();
	}
	public int getMaxNum() {
		return mapper.getMaxNum();
	}
	public List<NoticeDto> noticeList(int start,int perpage){
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("perpage", perpage);
		return mapper.noticeList(map);
	}
	
	//faq
	public void insertFaq(FaqDto fdto) {
		mapper.insertFaq(fdto);
	}
	public int getfaqTotalCount() {
		return mapper.getfaqTotalCount();
	}
	public int getfaqMaxNum() {
		return mapper.getfaqMaxNum();
	}
	public List<FaqDto> FaqList(int start, int perpage){
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("perpage", perpage);
		return mapper.faqList(map);
	}
	
}
