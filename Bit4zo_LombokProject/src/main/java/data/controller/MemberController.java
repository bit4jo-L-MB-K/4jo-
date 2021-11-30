package data.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import data.dto.MemberDto;
import data.mapper.MemberMapper;

@Controller
public class MemberController {
	@Autowired
	private JavaMailSender javaMailSender;
	
	@Autowired
	MemberMapper mapper;
	
	@GetMapping("/member/signup")
	public String form() {
		return "/member/addform";
	}
	
	@GetMapping("/member/idcheck")
	public @ResponseBody  Map<String, Integer> idCheckProcess(@RequestParam String id) {
		//id 체크
		int check=mapper.getIdCheck(id);
		
		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("check", check);//0 or 1
		return map;
	}
	
	@PostMapping("/member/welcome")
	public String memberInsert(@ModelAttribute MemberDto dto) {
		//이메일 형식으로 넣어주기
		dto.setEmail(dto.getEmail1()+"@"+dto.getEmail2());
		//핸드폰 번호 넣기
		dto.setHp(dto.getHp1()+"-"+dto.getHp2()+"-"+dto.getHp3());
		
		mapper.insertMember(dto);
		return "/member/gaipsuccess";
	}
	
	@RequestMapping("/member/CheckMail")
    @ResponseBody
	public String SendMail(String mail) {

		Random random = new Random();
		String key = "";

		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(mail); // 스크립트에서 보낸 메일을 받을 사용자 이메일 주소
		// 입력 키를 위한 코드
		for (int i = 0; i < 3; i++) {
			int index = random.nextInt(25) + 65; // A~Z까지 랜덤 알파벳 생성
			key += (char) index;
		}
		int numIndex = random.nextInt(8999) + 1000; // 4자리 정수를 생성
		key += numIndex;
		message.setSubject("인증번호 입력을 위한 메일 전송");
		message.setText("인증 번호 : " + key);
		javaMailSender.send(message);
		Gson gson = new Gson();
		
		return gson.toJson(key);
	}
}