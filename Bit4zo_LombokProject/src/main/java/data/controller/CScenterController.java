package data.controller;


import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import data.dto.FaqDto;
import data.dto.InquiryDto;
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
	
	@GetMapping("/cscenter/noticeupdateform")
	 public ModelAndView nupdateForm(String num, String currentPage) {
		 ModelAndView mview =  new ModelAndView();
		 NoticeDto ndto = service.getNoticeData(num);
		 mview.addObject("ndto",ndto);
		 mview.addObject("currentPage",currentPage);
		 
		 mview.setViewName("/cscenter/nupdateform");
		 return mview;
	 }
	 
	@PostMapping("/cscenter/nupdate")
	public String nupdate(@ModelAttribute NoticeDto dto, String currentPage) {
		 //세션
		service.updateNotice(dto);
		return "redirect:noticelist";
	}
	
	@GetMapping("/cscenter/ndelete")
	public String ndelete(String num,String currentPage) {
		//세션
		service.deleteNotice(num);
		
		
		return "redirect:noticelist";
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
		
		//탭메뉴
		List<FaqDto> deliverlist = service.deliverList(start,perPage);
		List<FaqDto> orderlist = service.orderList(start,perPage); 
		List<FaqDto> cancellist = service.cancelList(start,perPage);
		List<FaqDto> receiptlist = service.receiptList(start,perPage); 
		List<FaqDto> meminfolist = service.meminfoList(start,perPage); 
		List<FaqDto> couponlist = service.couponList(start,perPage); 
		List<FaqDto> etclist = service.etcList(start,perPage);
		 
		//각페이지에 출력할 시작번호
		int no=totalCount-(currentPage-1)*perPage;

		//출력에 필요한 변수들을 request에 저장
		mview.addObject("list",list);
		
		//탭
		mview.addObject("deliverlist",deliverlist);
		mview.addObject("orderlist",orderlist);
		mview.addObject("cancellist",cancellist);
		mview.addObject("receiptlist",receiptlist);
		mview.addObject("meminfolist",meminfolist);
		mview.addObject("couponlist",couponlist);
		mview.addObject("etclist",etclist);
		
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
	@GetMapping("/cscenter/faqupdateform")
	public ModelAndView updateForm(String num, String currentPage) {
		ModelAndView mview =  new ModelAndView();
		FaqDto fdto = service.getfaqData(num);
		mview.addObject("fdto",fdto);
		mview.addObject("currentPage",currentPage);
		
		mview.setViewName("/cscenter/faqupdateform");
		return mview;
	}
	 
	@PostMapping("/cscenter/fupdate")
	public String fupdate(@ModelAttribute FaqDto dto, String currentPage) {
		 //세션
		service.updateFaq(dto);
			 
		return "redirect:faqlist";
	}
	 
	@GetMapping("/cscenter/fdelete")
	public String fdelete(String num,String currentPage) {
		//세션
		service.deleteFaq(num);
		
		return "redirect:faqlist?currentPage="+currentPage;
	}
	
	
	//1대1 문의
	@GetMapping("/cscenter/inquiry")
	public String inquiryForm() {
		return "/cscenter/inquiry";
	}
	
	@PostMapping("/cscenter/qinsert")
	public String qinsert(@ModelAttribute InquiryDto idto, HttpSession session,
			@RequestParam ArrayList<MultipartFile> upload) {
		//세션 추가 할것
		/*
		 * String loginok=(String)session.getAttribute("loginok"); if(loginok==null) {
		 * return "/member/login"; }
		 */
		 
		//업로드 실제경로 
		String path = session.getServletContext().getRealPath("/photo");
		System.out.println(path);
		//업로드 파일 날짜
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		String photo = "";
		//사진선택을 안했을 경우 no, 했을경우 , 로 나열(파일명은 날짜시간으로 지정)
		if(upload.get(0).getOriginalFilename().equals(""))
			photo="no";
		else {
			for(MultipartFile q : upload) {
				String qName = "i"+sdf.format(new Date())+q.getOriginalFilename();
				photo += qName+",";
				
				//업로드
				try {
					q.transferTo(new File(path+"\\"+qName));
				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			System.out.println(photo);
			photo=photo.substring(0,photo.length()-1);
		}
		
		//세션에서 아이디를 얻어서 idto에 저장
		//String myid = (String)session.getAttribute("myid");
		//idto.setMyid(myid);
		
		idto.setUploadfile(photo);
		//insert
		service.insertInquiry(idto);
		return "redirect:csmain";
	}
	
	/*
	 * @GetMapping("/inquiry/content") public ModelAndView content(@RequestParam
	 * String num,
	 * 
	 * @RequestParam(defaultValue = "1") int currentPage,
	 * 
	 * @RequestParam(required = false) String key) {
	 * 
	 * ModelAndView mview = new ModelAndView();
	 * 
	 * 
	 * 
	 * 
	 * }
	 */
	
}
