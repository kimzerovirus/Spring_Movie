package org.kzv.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {
	
	@RequestMapping("/top")
	public void showTop() {
		
	}
	
	@RequestMapping("/foot")
	public void showFoot() {
		
	}
	
	@RequestMapping(value="/index")
	public String home() {
		return "index";
	}
}
