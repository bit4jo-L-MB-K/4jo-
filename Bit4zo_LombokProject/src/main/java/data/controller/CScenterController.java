package data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CScenterController {
	
	@GetMapping("/cscenter")
	public String cscenterMain() {
		return "/cscenter/cscentermain";
	}
	
	@GetMapping("/inquiry")
	public String inquiryForm() {
		return "/cscenter/inquiry";
	}
	
//	@GetMapping("noticeadd")
//	public String noticeAddForm() {
//		return "/cscenter/noticeadd";
//	}
//	
//	@GetMapping("noticeadd")
//	public String faqAddForm() {
//		return "/cscenter/faqadd";
//	}

}
