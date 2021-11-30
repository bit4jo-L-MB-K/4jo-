package data.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import data.mapper.MemberMapper;

@Controller 
public class LoginController {
	@Autowired
	MemberMapper mapper;
	
	@GetMapping("/login/signin")
	public String login(HttpSession session, Model model)
	{
		String myid=(String)session.getAttribute("myid");
		String loginok=(String)session.getAttribute("loginok");

		if(loginok==null)
			return "/login/loginform";
		else {
			//로그인 중일 경우에는 request에 로그인한 이름 저장하기
			String name = mapper.getName(myid);
			model.addAttribute("name", name);
			return "/login/logoutform";			
		}
	}

	@PostMapping("/login/login")
	public String loginsuccess(
			@RequestParam(required=false) String cbsave,
			@RequestParam String id,
			@RequestParam String pass,
			HttpSession session
			)
	{
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pass", pass);
		
		int check=mapper.login(map);
		if(check==1) {
			session.setAttribute("myid", id);
			session.setAttribute("loginok", "yes");
			session.setAttribute("saveok", cbsave); //체크 안했을 경우 null, 체크했을 경우 on
			return "redirect:/";
		}else {
			return "/login/passfail";
		}
	}
	
	@GetMapping("/login/logoutprocess")
	public String logout(HttpSession session)
	{
		session.removeAttribute("loginok");
		return "redirect:/";
	}	
}
