package data.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.dto.FaqDto;
import data.dto.NoticeDto;

@Mapper
public interface CscenterMapper {
	public void insertNotice(NoticeDto dto);
	
	public int getTotalCount();
	public int getMaxNum();
	public List<NoticeDto> noticeList(HashMap<String, Integer> map);
	
	public void insertFaq(FaqDto fdto);
	public int getfaqTotalCount();
	public int getfaqMaxNum();
	public List<FaqDto> faqList(HashMap<String, Integer> map);

}
