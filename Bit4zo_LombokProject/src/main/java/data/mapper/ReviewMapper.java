package data.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.dto.ReviewDto;

@Mapper
public interface ReviewMapper {
	public int getTotalCount();
	public ReviewDto getData(String num);	//num에 대한 dto반환
	public int getMaxNum();
	public List<ReviewDto> getList(HashMap<String, Integer> map);
	public void insertReview(ReviewDto dto);
	public void updateReview(ReviewDto dto);
	public void deleteReview(String num);
}
