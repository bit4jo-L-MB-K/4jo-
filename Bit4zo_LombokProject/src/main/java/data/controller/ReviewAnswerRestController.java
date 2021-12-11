package data.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import data.dto.ReviewAnswerDto;
import data.mapper.MemberMapper;
import data.service.ReviewAnswerService;

@RestController	
public class ReviewAnswerRestController {
	@Autowired
	MemberMapper memMapper;
	
	@Autowired
	ReviewAnswerService service;

	
	@PostMapping("/review/dupdate")
	public void dupdate(@ModelAttribute ReviewAnswerDto dto)
	{
		service.updateAnswer(dto);
	}
	
	@GetMapping("/review/ddelete")
	public void delete(String idx)
	{
		service.deleteAnswer(idx);
	}
}
