package data.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.dto.FaqDto;
import data.dto.InquiryDto;
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
	
	public NoticeDto getNoticeData(String num) {
		return mapper.getNoticeData(num);
	}
	
	public void updateNotice(NoticeDto dto) {
		mapper.updateNotice(dto);
	}
	public void deleteNotice(String num) {
		mapper.deleteNotice(num);
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
	
	public List<FaqDto> deliverList(int start, int perpage){
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("perpage", perpage);
		return mapper.deliverList(map);
		
	}
	public List<FaqDto> orderList(int start, int perpage){
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("perpage", perpage);
		return mapper.orderList(map);
		}
	public List<FaqDto> cancelList(int start, int perpage){
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("perpage", perpage);
		return mapper.cancelList(map);
	}
	public List<FaqDto> receiptList(int start, int perpage){
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("perpage", perpage);
		return mapper.receiptList(map);
	}
	public List<FaqDto> meminfoList(int start, int perpage){
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("perpage", perpage);
		return mapper.meminfoList(map);
	}
	public List<FaqDto> couponList(int start, int perpage){
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("perpage", perpage);
		return mapper.couponList(map);
	}
	public List<FaqDto> etcList(int start, int perpage){
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("perpage", perpage);
		return mapper.etcList(map);
	}
	public FaqDto getfaqData(String num) {
		return mapper.getfaqData(num);
	}
	public void updateFaq(FaqDto dto) {
		mapper.updateFaq(dto);
	}
	public void deleteFaq(String num) {
		mapper.deleteFaq(num);
	}
	
	//1:1
	public void insertInquiry(InquiryDto idto) {
		mapper.insertInquiry(idto);
	}
	
	public int getInqTotalCount() {
		return mapper.getInqTotalCount();
	}
	
	public List<InquiryDto> getInqList(int start, int perpage){
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("perpage", perpage);
		return mapper.getInqList(map);
	}
	
	public InquiryDto getInqData(String num) {
		return mapper.getInqData(num);
	}
	
	public void updateAcount(InquiryDto idto) {
		mapper.updateAcount(idto);
	}
}
