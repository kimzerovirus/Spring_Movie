package org.kzv.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import org.kzv.domain.NotUserException;
import org.kzv.domain.UserVO;
import org.kzv.service.UserService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class LoginController {
	
	@Resource(name="userServiceImpl")
	private UserService userSvc;
	
	@PostMapping("/login")
	public String loginEnd(HttpSession ses,@ModelAttribute("user") UserVO user) throws NotUserException{
		log.info("user=="+user);
		UserVO loginUser = this.userSvc.loginCheck(user);
		
		if(loginUser != null) {
			ses.setAttribute("loginUser", loginUser);
		}
		
		return "redirect:index";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession ses) {
		ses.invalidate(); 
		return "redirect:index";
	}
}
