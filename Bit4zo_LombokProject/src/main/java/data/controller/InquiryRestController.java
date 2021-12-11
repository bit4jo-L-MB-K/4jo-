package data.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import data.dto.InquiryAnswerDto;
import data.dto.InquiryDto;
import data.mapper.MemberMapper;
import data.service.CscenterService;
import data.service.InquiryAnswerService;

@RestController
public class InquiryRestController {
	
	@Autowired
	InquiryAnswerService service;
	
	@Autowired
	CscenterService csservice;
	
	@Autowired
	MemberMapper memMapper;

	@PostMapping("/cscenter/ainsert")
	public void insert(@ModelAttribute InquiryAnswerDto dto,HttpSession session
			,InquiryDto idto) {
		//세션에 로그인한 아이디얻기
		String myid = (String)session.getAttribute("myid");
		//아이디에 대한 작성자 얻기
		//String name = memMapper.getName(myid);
		//dto에 넣기
		dto.setMyid(myid);
		
		//insert
		service.insertAnswer(dto);
		csservice.updateAcount(idto);
		
	}
	
	@GetMapping("/cscenter/alist")
	public List<InquiryAnswerDto> alist(String num){
		return service.getAllAnswer(num);
	}
	
	@GetMapping("/cscenter/adata")
	public InquiryAnswerDto data(String idx) {
		return service.getAnswer(idx);
	}
	
	@PostMapping("/cscenter/aupdate")
	public void aupdate(@ModelAttribute InquiryAnswerDto dto) {
		service.updateAnswer(dto);
	}
	
	@GetMapping("/cscenter/adelete")
	public void adelete(String idx) {
		service.deleteAnswer(idx);
	}
}
