package org.kzv.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.kzv.common.util.CommonUtil;
import org.kzv.domain.BoardVO;
import org.kzv.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;


@Controller
@Log4j
public class BoardController {
	
	@Inject
	private BoardService boardSvc;
	
	@Inject
	private CommonUtil util;
	 
	@GetMapping(value="/detail")
	public String boardView(Model model, @RequestParam(defaultValue="0") int movieid) {
		if(movieid==0) {
			return "redirect:index";
		}
		
		List<BoardVO> boardList = boardSvc.getList(movieid);
		
		model.addAttribute("board",boardList);
		log.info("boardList="+boardList);
		
		return "board/detail";
	}
	
	@PostMapping("/write")
	public String write(BoardVO board, RedirectAttributes ra, HttpServletRequest req) {
		log.info("writeBoard="+board);
		boardSvc.write(board); 
		
		ra.addFlashAttribute("result", board.getBoard_idx());
	    String referer = req.getHeader("Referer");
	    return "redirect:"+ referer;
		
	}
	
	
	@PostMapping("/update")
	public String update(String memo, RedirectAttributes ra, HttpServletRequest req) {
		
		if(boardSvc.update(memo)) {
			ra.addFlashAttribute("result", "success");
		}
		
		String referer = req.getHeader("Referer");
		return "redirect:"+referer;
	}
	
	@PostMapping("/delete")
	public String delete(@RequestParam("bidx") int board_idx, RedirectAttributes ra, HttpServletRequest req) {
		
		if(boardSvc.delete(board_idx)) {
			ra.addFlashAttribute("result","success");
		}
		
		String referer = req.getHeader("Referer");
		return "redirect:"+referer;
	}
}
