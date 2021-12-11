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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import data.dto.ProductDto;
import data.dto.ProductOpDto;
import data.dto.ReviewAnswerDto;
import data.dto.ReviewDto;
import data.mapper.MemberMapper;
import data.mapper.ReviewMapper;
import data.service.ReviewAnswerService;
import data.service.ReviewService;

@Controller
public class ReviewController {
	@Autowired
	ReviewService service;

	@Autowired
	ReviewMapper revMapper;

	@Autowired
	MemberMapper memMapper;

	@Autowired
	ReviewAnswerService service1;

	@GetMapping("/review/list")
	public ModelAndView list(
			@RequestParam(defaultValue = "1") int currentPage)
	{
		ModelAndView mview=new ModelAndView();

		int totalCount=service.getTotalCount();

		//페이징 처리에 필요한 변수선언
		int perPage=10;//한페이지에 보여질 글의 갯수
		int totalPage;//총 페이지수
		int start;//각페이지에서 불러올 db 의 시작번호
		int perBlock=5;//몇개의 페이지번호씩 표현할것인가
		int startPage; //각 블럭에 표시할 시작페이지
		int endPage; //각 블럭에 표시할 마지막페이지

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
		List<ReviewDto> list=service.getList(start, perPage);  
		List<ReviewAnswerDto> list2=service1.getAllAnswer();
		//각페이지에 출력할 시작번호
		int no=totalCount-(currentPage-1)*perPage;

		//출력에 필요한 변수들을 request에 저장
		mview.addObject("list",list );
		mview.addObject("list2",list2 );
		
		mview.addObject("startPage",startPage );
		mview.addObject("endPage", endPage);
		mview.addObject("totalPage", totalPage);
		mview.addObject("totalCount", totalCount);
		mview.addObject("no", no);
		mview.addObject("currentPage", currentPage);	//제목에서 넘겨줄때 필요하다
		mview.addObject("totalCount", totalCount);
		mview.setViewName("/review/reviewlist");
		return mview;
	}


	@GetMapping("/review/form")
	public String form()	//form만 나타내면 된다
	{
		return "/review/reviewform";
	}

	//추가
	@PostMapping("/review/insert")
	public String insert(@ModelAttribute ReviewDto dto,HttpSession session)
	{
		//로그인ok가 null이면 메세지jsp로 이동 
		String loginok=(String)session.getAttribute("loginok");
		if(loginok==null)
		{
			return "/review/loginmsg";
		}

		//로그인 중일때만 
		//업로드할 폴더지정
		String path=session.getServletContext().getRealPath("/image");
		System.out.println(path);
		//업로드할 파일명
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");

		//업로드 안한 경우
		if(dto.getUpload().getOriginalFilename().equals(""))
			dto.setUploadfile("no");
		else{
			String uploadfile="f"+sdf.format(new Date())+dto.getUpload().getOriginalFilename();
			dto.setUploadfile(uploadfile);

			//실제 업로드
			try {
				dto.getUpload().transferTo(new File(path+"\\"+uploadfile));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		//세션에서 아이디를 얻어서 dto에 저장
		String myid=(String)session.getAttribute("myid");
		dto.setMyid(myid);

		//insert
		service.insertReview(dto);
		//		return "redirect:content?num="+service.getMaxNum();
		return "redirect:list";
	}

	@GetMapping("/review/reviewlist")
	public ModelAndView reviewlist(@RequestParam String num,
			@RequestParam(defaultValue = "1") int currentPage,
			@RequestParam(required = false) String key)
	{
		ModelAndView mview=new ModelAndView();

		ReviewDto dto=service.getData(num);

		//dto의 name에 작성자이름 넣기
		//		String name=revMapper.getName(dto.getMyid());
		//		dto.setName(name);

		//업로드파일의 마지막 3글자 얻기
		int dotLoc=dto.getUploadfile().lastIndexOf('.');	//마지막 .의 위치
		String ext=dto.getUploadfile().substring(dotLoc+1);	// .다음글자부터 끝까지 추출
		//System.out.println(dotLoc+","+ext);
		if(ext.equalsIgnoreCase("jpg")||ext.equalsIgnoreCase("gif")||
				ext.equalsIgnoreCase("png")||ext.equalsIgnoreCase("jpeg"))
			mview.addObject("rupload", true);
		else
			mview.addObject("rupload", false);

		mview.addObject("dto", dto);
		mview.addObject("currentPage", currentPage);
		mview.setViewName("/review/reviewlist");
		return mview;
	}

	//삭제
	@GetMapping("/review/delete")
	public String delete(String num,String currentPage,HttpSession session)
	{
		//실제 업로드 폴더의 경로
		String path=session.getServletContext().getRealPath("/image");
		//업로드된 파일명
		String uploadfile=service.getData(num).getUploadfile();
		//File 객체생성
		File file=new File(path+"\\"+uploadfile);
		//파일삭제
		file.delete();

		service.deleteReview(num);
		return "redirect:list?currentPage="+currentPage;
	}

	//수정
	@GetMapping("/review/updateform")
	public ModelAndView updateform(String num,String currentPage)
	{
		ModelAndView mview=new ModelAndView();
		ReviewDto dto=service.getData(num);
		mview.addObject("dto", dto);
		mview.addObject("currentPage", currentPage);
		mview.setViewName("/review/updateform");
		return mview;
	}

	@PostMapping("/review/update")
	public String update(@ModelAttribute ReviewDto dto,
			String currentPage, HttpSession session)
	{
		//업로드할 폴더 지정
		String path=session.getServletContext().getRealPath("/image");
		//업로드할 파일명
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");

		//업로드 안한 경우
		if(dto.getUpload().getOriginalFilename().equals(""))
			dto.setUploadfile(null);
		else {	//업로드 한 경우
			String uploadfile="f"+sdf.format(new Date())+dto.getUpload().getOriginalFilename();
			dto.setUploadfile(uploadfile);

			//실제업로드
			try {
				dto.getUpload().transferTo(new File(path+"\\"+uploadfile));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		//수정
		service.updateReview(dto);
		return "redirect:list?num="+dto.getNum()+"&currentPage="+currentPage;
	}


	//////	 ReviewAnswer	//////
	//@GetMapping("/review/dlist")
	//public String dlist(Model model) {
	//	List<ReviewAnswerDto> dlist=service1.getAllAnswer();
	//	model.addAttribute("dlist", dlist);
	//	return "list";
	//}
	
	
	//추가
	@PostMapping("/review/dinsert")
	public String dinsert(@ModelAttribute ReviewAnswerDto dto, HttpSession session)
	{
		//로그인ok가 null이면 메세지jsp로 이동 
		String loginok=(String)session.getAttribute("loginok");
		if(loginok==null)
		{
			return "/review/loginmsg";
		}

		//세션에 로그인한 아이디 얻기
		String myid=(String)session.getAttribute("myid");
		//아이디에 대한 작성자 얻기
		String name=memMapper.getName(myid);
		//dto에 넣기
		dto.setMyid(myid);
		dto.setName(name);

		//insert
		service1.insertAnswer(dto);

		return "redirect:list";
	}

}

