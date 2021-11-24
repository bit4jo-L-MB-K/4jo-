package data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
  public ModelAndView shopMain(@RequestParam(defaultValue = "1") int currentPage) {
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

    // 각 페이지에 출력할 시작번호
    int no = totalCount - (currentPage - 1) * perPage;

    // 출력에 필요한 변수들을 request에 저장
    mview.addObject("list", list);
    mview.addObject("startPage", startPage);
    mview.addObject("endPage", endPage);
    mview.addObject("totalPage", totalPage);
    mview.addObject("no", no);
    mview.addObject("currentPage", currentPage);

    mview.addObject("totalCount", totalCount);
    mview.setViewName("/shop/shopmain");
    // mview.setViewName("/shop/shopdetails");
    return mview;
  }

  @GetMapping("/shop/details")
  // public String shopDetails() {

  public ModelAndView shopDetails(@RequestParam(defaultValue = "1") int currentPage,
      @RequestParam String num, @RequestParam(value = "pro_id", required = false) String pro_id,
      @RequestParam(required = false) String key) {
    ModelAndView mview = new ModelAndView();

    // 조회수 출력
    ProductDto dto = service.getData(num);
    if (key != null)
      service.updateReadCount(num);

    ProductOpDto dto2 = service.getData2(pro_id);
    ProductOpDto dto3 = service.getData3(pro_id);
    // 최신글 하단에 출력
    int totalCount = service.getTotalCount();
    int start;
    int end = 3;
    start = (currentPage - 1) * end;
    List<ProductDto> list = service.getAllLists(start, end);
    // List<ProductOpDto> list2 = service.getAllLists2(pro_id);



    // 출력에 필요한 변수들을 request에 저장
    mview.addObject("dto", dto);
    mview.addObject("list", list);
    // mview.addObject("list2", list2);

    mview.addObject("dto2", dto2);
    mview.addObject("dto3", dto3);

    mview.addObject("currentPage", currentPage);
    mview.addObject("totalCount", totalCount);
    mview.setViewName("/shop/shopdetails");
    return mview;

  }

  // @GetMapping("/board/details")
  // public List<ProductOpDto> shopDetails2(String pro_id) {
  //
  //
  //
  // return service.getAllLists2(pro_id);
  // }



  @GetMapping("/shop/form")
  public ModelAndView shopForm(
      @RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {
    ModelAndView mview = new ModelAndView();

    // 최신글 하단에 출력
    int totalCount = service.getTotalCount();
    int option_list = 99;
    int start;
    start = (currentPage - 1) * option_list;
    List<ProductDto> list = service.getAllLists(start, option_list);


    // 출력에 필요한 변수들을 request에 저장

    mview.addObject("list", list);

    mview.addObject("currentPage", currentPage);
    mview.addObject("totalCount", totalCount);
    mview.setViewName("/shop/form");
    return mview;

  }


  @PostMapping("/shop/insert")
  public String insert(@ModelAttribute ProductDto dto, HttpSession session) {
    // 업로드 경로 구하기
    String path = session.getServletContext().getRealPath("/photo");
    System.out.println(path);

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

    // insert
    service.insertShop(dto);

    // 목록으로 이동
    return "redirect:list";
  }

  @PostMapping("/shop/insert2")
  public String insert2(@ModelAttribute ProductOpDto dto) {
    service.insertShopOp(dto);

    // 목록으로 이동
    return "redirect:list";
  }


}
