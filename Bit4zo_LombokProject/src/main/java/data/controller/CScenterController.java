package data.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import data.dto.FaqDto;
import data.dto.NoticeDto;
import data.service.CscenterService;


@Controller
public class CScenterController {
	
	@Autowired
	CscenterService service;
	
	@GetMapping("/cscenter/csmain")
	public ModelAndView csmain(@RequestParam(defaultValue = "1") int currentPage) {
		ModelAndView mview = new ModelAndView();
		
		int totalCount = service.getTotalCount();
		
		//페이징처리에 필요한 변수선언
		int perPage=10; //한페이지에 보여질 글의 갯수
		int totalPage; //총페이지수
		int start; // 각페이지에서 불러올 db의 시작번호
		int perBlock=5; //몇개의 페이지 번호씩 표현할 것인가
		int startPage; //각 블럭에 표시할 시작페이지
		int endPage; //각 블럭에 표시할 마지막 페이지

		//총 페이지 갯수 구하기
		totalPage=totalCount/perPage+(totalCount%perPage==0?0:1); 
		//각 블럭의 시작페이지
		startPage=(currentPage-1)/perBlock*perBlock+1;
		endPage=startPage+perBlock-1;
		if(endPage>totalPage)
			endPage=totalPage;
		//각 페이지에서 불러올 시작번호
		start=(currentPage-1)*perPage;
		//각페이지에서 필요한 게시글 가져오기
		List<NoticeDto> list=service.noticeList(start, perPage);
		
		//각페이지에 출력할 시작번호
		int no=totalCount-(currentPage-1)*perPage;

		//출력에 필요한 변수들을 request에 저장
		mview.addObject("list",list);
		mview.addObject("startPage",startPage);
		mview.addObject("endPage",endPage);
		mview.addObject("totalPage", totalPage);
		mview.addObject("no",no);
		mview.addObject("currentPage",currentPage);
		
		mview.addObject("totalCount",totalCount);
		mview.setViewName("/cscenter/cscentermain");
		return mview;
	}
	
	@GetMapping("/cscenter/inquiry")
	public String inquiryForm() {
		return "/cscenter/inquiry";
	}
	
	//공지사항
	@GetMapping("/cscenter/noticeadd")
	public String noticeAddForm() {
		return "/cscenter/noticeadd";
	}
	
	@PostMapping("/cscenter/ninsert")
	public String ninsert(@ModelAttribute NoticeDto dto) {
		//세션 추가 할것

		service.insertNotice(dto);
		return "redirect:csmain";
	}
	
	@GetMapping("/cscenter/noticelist")
	public ModelAndView nlist(@RequestParam(defaultValue = "1") int currentPage) {
		ModelAndView mview = new ModelAndView();
		
		int totalCount = service.getTotalCount();
		
		//페이징처리에 필요한 변수선언
		int perPage=10; //한페이지에 보여질 글의 갯수
		int totalPage; //총페이지수
		int start; // 각페이지에서 불러올 db의 시작번호
		int perBlock=5; //몇개의 페이지 번호씩 표현할 것인가
		int startPage; //각 블럭에 표시할 시작페이지
		int endPage; //각 블럭에 표시할 마지막 페이지

		//총 페이지 갯수 구하기
		totalPage=totalCount/perPage+(totalCount%perPage==0?0:1); 
		//각 블럭의 시작페이지
		startPage=(currentPage-1)/perBlock*perBlock+1;
		endPage=startPage+perBlock-1;
		if(endPage>totalPage)
			endPage=totalPage;
		//각 페이지에서 불러올 시작번호
		start=(currentPage-1)*perPage;
		//각페이지에서 필요한 게시글 가져오기
		List<NoticeDto> list=service.noticeList(start, perPage);
		
		//각페이지에 출력할 시작번호
		int no=totalCount-(currentPage-1)*perPage;

		//출력에 필요한 변수들을 request에 저장
		mview.addObject("list",list);
		mview.addObject("startPage",startPage);
		mview.addObject("endPage",endPage);
		mview.addObject("totalPage", totalPage);
		mview.addObject("no",no);
		mview.addObject("currentPage",currentPage);
		
		mview.addObject("totalCount",totalCount);
		mview.addObject("length",list.size());
		
		mview.setViewName("/cscenter/noticelist");
		return mview;
	}
	
	//faq
	@GetMapping("/cscenter/faqadd")
	public String faqAddForm() {
		return "/cscenter/faqadd";
	}

	
	@PostMapping("/cscenter/finsert")
	public String finsert(@ModelAttribute FaqDto fdto) {
		//세션 추가 할것
		service.insertFaq(fdto);
		return "redirect:csmain";
	}
	
	@GetMapping("/cscenter/faqlist")
	public ModelAndView flist(@RequestParam(defaultValue = "1") int currentPage) {
		ModelAndView mview = new ModelAndView();
		
		int totalCount = service.getfaqTotalCount();
		
		//페이징처리에 필요한 변수선언
		int perPage=10; //한페이지에 보여질 글의 갯수
		int totalPage; //총페이지수
		int start; // 각페이지에서 불러올 db의 시작번호
		int perBlock=5; //몇개의 페이지 번호씩 표현할 것인가
		int startPage; //각 블럭에 표시할 시작페이지
		int endPage; //각 블럭에 표시할 마지막 페이지

		//총 페이지 갯수 구하기
		totalPage=totalCount/perPage+(totalCount%perPage==0?0:1); 
		//각 블럭의 시작페이지
		startPage=(currentPage-1)/perBlock*perBlock+1;
		endPage=startPage+perBlock-1;
		if(endPage>totalPage)
			endPage=totalPage;
		//각 페이지에서 불러올 시작번호
		start=(currentPage-1)*perPage;
		//각페이지에서 필요한 게시글 가져오기
		List<FaqDto> list=service.FaqList(start, perPage);
		
		//각페이지에 출력할 시작번호
		int no=totalCount-(currentPage-1)*perPage;

		//출력에 필요한 변수들을 request에 저장
		mview.addObject("list",list);
		mview.addObject("startPage",startPage);
		mview.addObject("endPage",endPage);
		mview.addObject("totalPage", totalPage);
		mview.addObject("no",no);
		mview.addObject("currentPage",currentPage);
		
		mview.addObject("totalCount",totalCount);
		mview.addObject("length",list.size());
		mview.setViewName("/cscenter/faqlist");
		return mview;
	}
	
	
}
