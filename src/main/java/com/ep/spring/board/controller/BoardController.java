package com.ep.spring.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ep.spring.board.model.service.BoardService;
import com.ep.spring.board.model.vo.Board;
import com.ep.spring.common.model.vo.Attachment;
import com.ep.spring.common.model.vo.PageInfo;
import com.ep.spring.common.template.FileUpload;
import com.ep.spring.common.template.Pagination;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
	@RequestMapping("list.bo")
	public ModelAndView selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = bService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Board> list = bService.selectList(pi);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("board/boardListView"); 
		
		return mv;
	}
	
	@RequestMapping("enrollForm.bo")
	public String enrollForm() {
		return "board/boardEnrollForm";
	}
	
	@RequestMapping("insert.bo")
	public String insertBoard(Board b, Attachment a, MultipartFile upfile, HttpSession session, Model model) {
		
		ArrayList<Attachment> list = bService.selectAtList(a);
		
		if(!upfile.getOriginalFilename().equals("")) {
			String  saveFilePath = FileUpload.saveFile(upfile, session, "resources/uploadFiles/");
			
			a.setOriginName(upfile.getOriginalFilename());
			a.setChangeName(saveFilePath);
		}
		
		int result = bService.insertBoard(b);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "게시글 등록 성공");
			return "redirect:list.bo";	
		}else {
			model.addAttribute("errorMsg", "게시글 등록 실패");
			return "common/errorPage";
		}
	}
	/*
	@RequestMapping("detailForm.bo")
	public ModelAndView selectBoard(int boardNo, ModelAndView mv) {
		
		int result = bService.increaseCount(boardNo);
		
		if(result > 0) {
			Board b = bService.selectBoard(boardNo);
			
			mv.addObject("b", b).setViewName("board/boardDetailForm");
		}else {
			mv.addObject("errorMsg", "조회수증가실패").setViewName("common/errorPage");
		}
		return mv;
	}
	*/
	
	
	
	
	
}
