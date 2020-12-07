package org.kzv.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.kzv.domain.UserVO;
import org.kzv.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.log4j.Log4j;

@Controller	
@Log4j
public class UserController {
	
	@Autowired
	private UserService userSvc;
	
	
	@GetMapping("/signup")
	public String joinForm() {
		
		return "member/join";
	}
	
	@GetMapping("/idCheck")
	public @ResponseBody Map<String, Integer> idCheck(@RequestParam("userid") String userid){
		
		boolean b=this.userSvc.idCheck(userid);
		int n=(b)? 1: -1;
		Map<String, Integer> map=new HashMap<>();
		map.put("isUse", n);
		return map;
	}
	
	
	@PostMapping("/join")
	public String joinEnd(Model model, @ModelAttribute("user") UserVO user) {
		log.info("user=="+user);
		System.out.println("user=="+user.getName());
		
		int n=userSvc.createUser(user);
		String str=(n>0)?"회원가입 성공":"가입 실패";
		String loc="index";
		
		
		model.addAttribute("message",str);
		model.addAttribute("loc", loc);
		return "msg";
	}
	
	
	
}
