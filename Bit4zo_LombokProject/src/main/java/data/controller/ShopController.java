package data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import data.dto.ProductDto;
import data.dto.ProductOpDto;
import data.mapper.ShopMapper;
import data.service.ShopService;

@Controller
public class ShopController {

  @Autowired
  ShopMapper mapper;
  @Autowired
  ShopService service;

  @GetMapping("/shop/list")
  public ModelAndView shopMain(@RequestParam(defaultValue = "1") int currentPage,
      @RequestParam(value = "pro_id", required = false) String pro_id) {
    ModelAndView mview = new ModelAndView();
    int totalCount = service.getTotalCount();

    // 페이징 처리에 필요한 변수선언
    int perPage = 12;// 한페이지에 보여질 글의 갯수
    int totalPage;// 총 페이지수
    int start;// 각페이지에서 불러올 db의 시작번호
    int perBlock = 5;// 몇개의 페이지번호씩 표현할것인가
    int startPage;// 각 블럭에 표시할 시작페이지
    int endPage;// 각 블럭에 표시할 마지막페이지

    // 총 페이지 갯수 구하기
    totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);
    // 각 블럭의 시작페이지
    startPage = (currentPage - 1) / perBlock * perBlock + 1;
    endPage = startPage + perBlock - 1;
    if (endPage > totalPage)
      endPage = totalPage;
    // 각 페이지에서 불러올 시작번호
    start = (currentPage - 1) * perPage;
    // 각페이지에서 필요한 게시글 가져오기
    List<ProductDto> list = service.getAllLists(start, perPage);
    List<ProductDto> list2 = service.getAllListsLowPri(start, perPage);
    List<ProductDto> list3 = service.getAllListsHigPri(start, perPage);
    List<ProductOpDto> list4 = service.getAllOptions(pro_id);
    List<ProductOpDto> list5 = service.getAllOp();

    // 각 페이지에 출력할 시작번호
    int no = totalCount - (currentPage - 1) * perPage;

    // 출력에 필요한 변수들을 request에 저장
    mview.addObject("list", list);
    mview.addObject("list2", list2);
    mview.addObject("list3", list3);
    mview.addObject("list4", list4);
    mview.addObject("list5", list5);
    mview.addObject("startPage", startPage);
    mview.addObject("endPage", endPage);
    mview.addObject("totalPage", totalPage);
    mview.addObject("no", no);
    mview.addObject("currentPage", currentPage);
    mview.addObject("totalCount", totalCount);

    mview.setViewName("/shop/shopmain");
    return mview;
  }



  @GetMapping("/shop/category")
  public ModelAndView shopSort(@RequestParam(value = "pro_sub", required = false) String pro_sub,
      @RequestParam(defaultValue = "1") int currentPage,
      @RequestParam(value = "price_n", required = false) String price_n,
      @RequestParam(value = "pro_id", required = false) String pro_id,
      @RequestParam(value = "color", required = false) String color) {
    ModelAndView mview = new ModelAndView();
    int totalCount = service.getTotalCountCategory(pro_sub, price_n);

    // 페이징 처리에 필요한 변수선언
    int perPage = 12;// 한페이지에 보여질 글의 갯수
    int totalPage;// 총 페이지수
    int start;// 각페이지에서 불러올 db의 시작번호
    int perBlock = 5;// 몇개의 페이지번호씩 표현할것인가
    int startPage;// 각 블럭에 표시할 시작페이지
    int endPage;// 각 블럭에 표시할 마지막페이지

    // 총 페이지 갯수 구하기
    totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);
    // 각 블럭의 시작페이지
    startPage = (currentPage - 1) / perBlock * perBlock + 1;
    endPage = startPage + perBlock - 1;
    if (endPage > totalPage)
      endPage = totalPage;
    // 각 페이지에서 불러올 시작번호
    start = (currentPage - 1) * perPage;

    // 각 페이지에 출력할 시작번호
    int no = totalCount - (currentPage - 1) * perPage;
    List<ProductDto> list = service.getCategory(pro_sub, start, perPage, price_n, color);
    List<ProductDto> list2 = service.getAllCateLowPri(pro_sub, start, perPage);
    List<ProductDto> list3 = service.getAllCateHigPri(pro_sub, start, perPage);
    mview.addObject("list", list);
    mview.addObject("list2", list2);
    mview.addObject("list3", list3);
    mview.addObject("totalCount", totalCount);
    mview.addObject("startPage", startPage);
    mview.addObject("endPage", endPage);
    mview.addObject("totalPage", totalPage);
    mview.addObject("no", no);
    mview.addObject("currentPage", currentPage);

    mview.setViewName("/shop/shopcategory");
    return mview;
  }

  @GetMapping("/shop/pricesort")
  public ModelAndView shopPrice(@RequestParam(defaultValue = "1") int currentPage) {
    ModelAndView mview = new ModelAndView();
    int totalCount = service.getPriceAllCount();

    // 페이징 처리에 필요한 변수선언
    int perPage = 3;// 한페이지에 보여질 글의 갯수
    int totalPage;// 총 페이지수
    int start;// 각페이지에서 불러올 db의 시작번호
    int perBlock = 5;// 몇개의 페이지번호씩 표현할것인가
    int startPage;// 각 블럭에 표시할 시작페이지
    int endPage;// 각 블럭에 표시할 마지막페이지

    // 총 페이지 갯수 구하기
    totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);
    // 각 블럭의 시작페이지
    startPage = (currentPage - 1) / perBlock * perBlock + 1;
    endPage = startPage + perBlock - 1;
    if (endPage > totalPage)
      endPage = totalPage;
    // 각 페이지에서 불러올 시작번호
    start = (currentPage - 1) * perPage;

    // 각 페이지에 출력할 시작번호
    int no = totalCount - (currentPage - 1) * perPage;
    List<ProductDto> list = service.getPriceList(start, perPage);
    mview.addObject("list", list);
    mview.addObject("totalCount", totalCount);
    mview.addObject("startPage", startPage);
    mview.addObject("endPage", endPage);
    mview.addObject("totalPage", totalPage);
    mview.addObject("no", no);
    mview.addObject("currentPage", currentPage);

    mview.setViewName("/shop/shopprice");
    return mview;
  }

  @GetMapping("/shop/details")
  public ModelAndView shopDetails(@RequestParam(defaultValue = "1") int currentPage,
      @RequestParam String idx, @RequestParam(value = "pro_id", required = false) String pro_id,
      @RequestParam(required = false) String key) {
    ModelAndView mview = new ModelAndView();
    System.out.println("1:" + pro_id);
    // 조회수 출력
    ProductDto dto = service.getData(idx);
    if (key != null)
      service.updateReadCount(idx);

    // 최신글 하단에 출력
    int totalCount = service.getTotalCount();
    int start;
    int end = 3;
    start = (currentPage - 1) * end;
    List<ProductDto> list = service.getAllLists(start, end);
    // System.out.println("1:" + pro_id);
    List<ProductOpDto> list2 = service.getAllOptions(pro_id);
    // System.out.println(list2.size());


    // 출력에 필요한 변수들을 request에 저장
    mview.addObject("dto", dto);
    mview.addObject("list", list);
    mview.addObject("list2", list2);
    mview.addObject("currentPage", currentPage);
    mview.addObject("totalCount", totalCount);
    mview.setViewName("/shop/shopdetails");
    return mview;

  }



  ///////////////////////////////////////////////////////////////////////////////////////////
  @GetMapping("/shop/adminmain")
  public ModelAndView adminmain(
      @RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {
    ModelAndView mview = new ModelAndView();

    int totalCount = service.getTotalCountOption();

    // 페이징 처리에 필요한 변수선언
    int perpage = 7;// 한페이지에 보여질 글의 갯수
    int totalPage;// 총 페이지수
    int start;// 각페이지에서 불러올 db 의 시작번호
    int perBlock = 5;// 몇개의 페이지번호씩 표현할것인가
    int startPage; // 각 블럭에 표시할 시작페이지
    int endPage; // 각 블럭에 표시할 마지막페이지

    // 총 페이지 갯수 구하기
    totalPage = totalCount / perpage + (totalCount % perpage == 0 ? 0 : 1);
    // 각 블럭의 시작페이지
    startPage = (currentPage - 1) / perBlock * perBlock + 1;
    endPage = startPage + perBlock - 1;
    if (endPage > totalPage)
      endPage = totalPage;
    // 각 페이지에서 불러올 시작번호
    start = (currentPage - 1) * perpage;
    List<ProductOpDto> list = service.getJoinList(start, perpage);
    // 작성자추가(나중에)

    // 각페이지에 출력할 시작번호
    int no = totalCount - (currentPage - 1) * perpage;

    // 출력에 필요한 변수들을 request에 저장
    mview.addObject("list", list);
    mview.addObject("startPage", startPage);
    mview.addObject("endPage", endPage);
    mview.addObject("totalPage", totalPage);
    mview.addObject("no", no);
    mview.addObject("currentPage", currentPage);

    mview.addObject("totalCount", totalCount);
    mview.setViewName("/shop/adminmain");
    return mview;
  }

  @GetMapping("/shop/addform")
  public ModelAndView addform(
      @RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {
    ModelAndView mview = new ModelAndView();

    int totalCount = service.getTotalCountOption();

    // 페이징 처리에 필요한 변수선언
    int perpage = 99;// 한페이지에 보여질 글의 갯수
    int totalPage;// 총 페이지수
    int start;// 각페이지에서 불러올 db 의 시작번호
    int perBlock = 5;// 몇개의 페이지번호씩 표현할것인가
    int startPage; // 각 블럭에 표시할 시작페이지
    int endPage; // 각 블럭에 표시할 마지막페이지


    // 각페이지에 출력할 시작번호
    int no = +1;
    // 총 페이지 갯수 구하기
    totalPage = totalCount / perpage + (totalCount % perpage == 0 ? 0 : 1);
    // 각 블럭의 시작페이지
    startPage = (currentPage - 1) / perBlock * perBlock + 1;
    endPage = startPage + perBlock - 1;
    if (endPage > totalPage)
      endPage = totalPage;
    // 각 페이지에서 불러올 시작번호
    start = (currentPage - 1) * perpage;

    List<ProductDto> list = service.getAllLists(start, perpage);
    List<ProductOpDto> list2 = service.getJoinListLeft(start, perpage);

    // 출력에 필요한 변수들을 request에 저장
    mview.addObject("list2", list2);
    mview.addObject("list", list);
    mview.addObject("start", start);
    mview.addObject("endPage", endPage);
    mview.addObject("totalPage", totalPage);
    mview.addObject("no", no);
    mview.addObject("currentPage", currentPage);

    mview.addObject("totalCount", totalCount);
    mview.setViewName("/shop/form");
    return mview;
  }

  @PostMapping("/shop/insert")
  public String insert(@ModelAttribute ProductDto dto, HttpSession session,
      ArrayList<MultipartFile> upload) {
    // 업로드 경로 구하기
    String path = session.getServletContext().getRealPath("/photo");
    System.out.println(path);
    // 사진명 구해서 넣기
    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
    String photoname = "";
    for (MultipartFile mf : upload) {
      String pname = "f" + sdf.format(new Date()) + "_" + mf.getOriginalFilename();
      photoname += pname + ",";


      // 실제 업로드
      try {
        mf.transferTo(new File(path + "\\" + pname));
      } catch (IllegalStateException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
      } catch (IOException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
      }
    }


    photoname = photoname.substring(0, photoname.length() - 1);
    dto.setPro_photo(photoname);


    // insert
    service.insertShop(dto);

    // 목록으로 이동
    return "redirect:addform";
  }

  @PostMapping("/shop/insert2")
  public String insert2(@ModelAttribute ProductOpDto podto) {
    service.insertShopOP(podto);

    // 목록으로 이동
    return "redirect:addform";
  }

  @GetMapping("/shop/updateform")
  public ModelAndView updateForm(String idx,
      @RequestParam(value = "currentPage", defaultValue = "1") int currentPage, String color) {
    ModelAndView mview = new ModelAndView();

    List<ProductOpDto> list = service.getJoinNum(idx, color);

    mview.addObject("color", color);

    mview.addObject("list", list);
    mview.addObject("currentPage", currentPage);
    mview.setViewName("/shop/updateform");
    return mview;
  }

  @PostMapping("/shop/update")
  public String update(@ModelAttribute ProductDto dto,
      @RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
      HttpSession session) {
    // 저장할 폴더 지정
    String path = session.getServletContext().getRealPath("/photo");
    // 사진명 구해서 넣기
    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
    String photoname = "f" + sdf.format(new Date()) + "_" + dto.getUpload().getOriginalFilename();
    dto.setPro_photo(photoname);

    // 실제 업로드
    try {
      dto.getUpload().transferTo(new File(path + "\\" + photoname));
    } catch (IllegalStateException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    } catch (IOException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }

    // 수정
    service.updateProduct(dto);
    return "redirect:list";
  }


  @GetMapping("/shop/delete")
  public String delete(String idx, String currentPage, String color, HttpSession session) {

    service.deleteOne(idx, color);
    return "redirect:adminmain?currentPage=" + currentPage;
  }
  
  @GetMapping("/shop/deleteA")
  public String deleteA(String idx, String currentPage, HttpSession session) {
	 //실제 업로드 폴더의 경로
	     String path=session.getServletContext().getRealPath("/photo");
	     System.out.println(path);
	     //업로드된 파일명
	     String uploadfile=service.getData(idx).getPro_photo();
	     //file객체 생성
	     File file=new File(path+"\\"+uploadfile);
	     //파일삭제
	     file.delete();
	     
	     service.deleteAll(idx);
	     return "redirect:adminmain?currentPage=" + currentPage;
  }


  @PostMapping("/shop/update2")
  public String update2(@ModelAttribute ProductOpDto dto,
      @RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
      HttpSession session) {

    // 수정
    service.updateOption(dto);
    return "redirect:adminmain";
  }
  
  @RequestMapping("/shop/idcheck")
	public @ResponseBody Map<String, Integer> ProidCheckProcess(@RequestParam String pro_id) {
		//id 체크
		int count=0;
		
		Map<String, Integer> map=new HashMap<String, Integer>();
		count=service.getProIdCheck(pro_id);
		map.put("cnt", count);//0 or 1
		return map;
	}


}
