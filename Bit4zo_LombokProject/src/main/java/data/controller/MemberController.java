package data.controller;

import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import data.dto.MemberDto;
import data.mapper.MemberMapper;

@Controller
public class MemberController {
  @Autowired
  MemberMapper mapper;

  @GetMapping("/member/form")
  public String form() {
    return "/member/addform";
  }

  @GetMapping("/member/idcheck")
  public @ResponseBody Map<String, Integer> idCheckProcess(@RequestParam String id) {
    // id 체크
    int check = mapper.getIdCheck(id);

    Map<String, Integer> map = new HashMap<String, Integer>();
    map.put("check", check);// 0 or 1
    return map;
  }

  @PostMapping("/member/insert")
  public String memberInsert(@ModelAttribute MemberDto dto) {
    // 이메일 형식으로 넣어주기
    dto.setEmail(dto.getEmail1() + "@" + dto.getEmail2());
    // 핸드폰 번호 넣기
    dto.setHp(dto.getHp1() + "-" + dto.getHp2() + "-" + dto.getHp3());

    mapper.insertMember(dto);
    return "/member/gaipsuccess";
  }

  @GetMapping("/member/gaipsuccess")
  public String gaipsuccessForm() {
    return "/member/gaipsuccess";
  }

  @GetMapping("/member/updatepassform")
  public String updatepassform(@RequestParam String num, Model model) {
    model.addAttribute("num", num);
    return "/member/updatepassform";
  }

  @PostMapping("/member/updatepass")
  public String updatepass(@RequestParam String num, @RequestParam String pass) {
    // db로부터 비번이 맞는지 체크
    HashMap<String, String> map = new HashMap<String, String>();
    map.put("num", num);
    map.put("pass", pass);

    int check = mapper.getCheckPass(map);
    if (check == 1) { // 비번이 맞는 경우
      return "redirect:updateform?num=" + num;
    } else { // 틀린 경우
      return "/member/passfail";
    }
  }

  @GetMapping("/member/updateform")
  public ModelAndView updateform(@RequestParam String num) {
    ModelAndView mview = new ModelAndView();
    // db로부터 dto 얻기
    MemberDto dto = mapper.getMember(num);
    // 이메일 분리해서 다시 dto에 넣기
    String[] em = dto.getEmail().split("@");
    dto.setEmail1(em[0]);
    dto.setEmail2(em[1]);

    mview.addObject("dto", dto);

    mview.setViewName("/member/updateform");
    return mview;
  }

  @PostMapping("/member/update")
  public String update(@ModelAttribute MemberDto dto) {
    // 이메일 형식으로 넣어주기
    dto.setEmail(dto.getEmail1() + "@" + dto.getEmail2());

    mapper.updateMember(dto);

    return "redirect:list";
  }

  @GetMapping("/member/memberdelete")
  public @ResponseBody HashMap<String, Integer> delete(@RequestParam String num,
      @RequestParam String pass) {
    // db로부터 비번이 맞는지 체크
    HashMap<String, String> map = new HashMap<String, String>();
    map.put("num", num);
    map.put("pass", pass);

    int check = mapper.getCheckPass(map);
    if (check == 1) {
      // 비밀번호가 맞을 경우 삭제
      mapper.deleteMember(num);
    }

    HashMap<String, Integer> rmap = new HashMap<String, Integer>();
    rmap.put("check", check);
    return rmap;
  }

}
