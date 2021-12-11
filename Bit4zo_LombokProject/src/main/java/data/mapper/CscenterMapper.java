package data.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.dto.FaqDto;
import data.dto.InquiryDto;
import data.dto.NoticeDto;

@Mapper
public interface CscenterMapper {
	public void insertNotice(NoticeDto dto);
	public int getTotalCount();
	public int getMaxNum();
	public List<NoticeDto> noticeList(HashMap<String, Integer> map);
	public NoticeDto getNoticeData(String num);
	public void updateNotice(NoticeDto dto);
	public void deleteNotice(String num);
	
	
	public void insertFaq(FaqDto fdto);
	public int getfaqTotalCount();
	public int getfaqMaxNum();
	public List<FaqDto> faqList(HashMap<String, Integer> map);
	public FaqDto getfaqData(String num);
	public void updateFaq(FaqDto dto);
	public void deleteFaq(String num);
	
	public List<FaqDto> deliverList(HashMap<String, Integer> map);
	public List<FaqDto> orderList(HashMap<String, Integer> map);
	public List<FaqDto> cancelList(HashMap<String, Integer> map);
	public List<FaqDto> receiptList(HashMap<String, Integer> map);
	public List<FaqDto> meminfoList(HashMap<String, Integer> map);
	public List<FaqDto> couponList(HashMap<String, Integer> map);
	public List<FaqDto> etcList(HashMap<String, Integer> map);

	public void insertInquiry(InquiryDto idto);
	public List<InquiryDto> getInqList(HashMap<String, Integer> map);
	public int getInqTotalCount();
	public InquiryDto getInqData(String num);
	public void updateAcount(InquiryDto idto);
	
}
