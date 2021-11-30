package data.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.dto.MemberDto;

@Mapper
public interface MemberMapper {
	public List<MemberDto> getAllMembers();
	public void insertMember(MemberDto dto);
	public int getIdCheck(String id);
	public int getCheckPass(HashMap<String, String> map);
	public MemberDto getMember(String num);
	
	public String getName(String id);
	public int login(HashMap<String, String> map);
}
