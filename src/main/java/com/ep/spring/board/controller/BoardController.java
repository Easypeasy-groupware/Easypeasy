package com.ep.spring.board.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ep.spring.board.model.service.BoardService;
import com.ep.spring.board.model.vo.Board;
import com.ep.spring.board.model.vo.BoardCate;
import com.ep.spring.board.model.vo.BoardReply;
import com.ep.spring.common.model.vo.Attachment;
import com.ep.spring.common.model.vo.PageInfo;
import com.ep.spring.common.template.FileUpload;
import com.ep.spring.common.template.Pagination;
import com.google.gson.Gson;

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
	public ModelAndView insertBoard(@RequestParam List<MultipartFile> originNames, Board b, Attachment a, HttpSession session, ModelAndView mv) {
		
		// 첨부파일 처리
		ArrayList<Attachment> atList = new ArrayList<>();
		//System.out.println(atList);
		if(originNames.size() > 1) {
			String path = "resources/board_attachFiles/";
			
			for (MultipartFile mf : originNames) {
					Attachment attach = new Attachment();
					String originFileName = mf.getOriginalFilename();
					String saveFilePath = FileUpload.saveFile(mf, session, path);
					String[] changeNameArr = saveFilePath.split("/");
					String changeName = changeNameArr[2];
					attach.setOriginName(originFileName);
					attach.setChangeName(changeName);
					attach.setFilePath(saveFilePath);
					atList.add(attach);
				}
		}
		
		int result = bService.insertBoard(b, atList);
		
		
		if(result > 0) {
			mv.addObject("successMsg", "게시글 등록 성공");
		}else {
			mv.addObject("successMsg", "게시글 등록 실패");
		}
		mv.setViewName("redirect:list.bo");
		return mv;
		
	}
	
		
	@RequestMapping("detailForm.bo")
	public ModelAndView selectBoard(int no, HttpSession session, ModelAndView mv, Board b) {
		
		int result = bService.increaseCount(no);
		b.setBoardNo(no);
		System.out.println(result);
		
		if(result > 0) {
			Board bb = bService.selectBoard(b);
			ArrayList<Attachment> attachmentList = bService.selectAttachmentList(b);
			
			System.out.println(attachmentList);
			
			mv.addObject("b", bb).addObject("attachmentList", attachmentList).setViewName("board/boardDetailForm");
			
		}else {
			mv.setViewName("redirect:list.bo");
		}
		return mv;
	}
	
	
	@RequestMapping("delete.bo")
	public String deleteBoard(int no, HttpSession session, Model model) {
		
		int result = bService.deleteBoard(no);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다."); 
			return "redirect:list.bo";
		}else {
			model.addAttribute("errorMsg", "게시글 삭제 실패");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("updateForm.bo")
	 public String updateForm(int no, Model model) {
	   return "board/boardUpdateForm"; 
	 }
	 
	
	@RequestMapping("update.bo")
	public String updateBoard(Board b, HttpSession session, Model model) {
		
		int result = bService.updateBoard(b);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 게시글이 수정되었습니다."); 
			return "redirect:boardUpdateForm";
		}else {
			model.addAttribute("errorMsg", "게시글 수정 실패");
			return "common/errorPage";
		}
		
	}
	
	// 댓글 ajax
	@ResponseBody
	@RequestMapping(value="rlist.bo", produces="application/json; charset=UTF-8")
	public String ajaxSelectReplyList(int no) {
			
		ArrayList<BoardReply> list = bService.selectReplyList(no);
		
		return new Gson().toJson(list);
	}
		
	@ResponseBody
	@RequestMapping("rinsert.bo")
	public String ajaxInsertReply(BoardReply r) {
			
		int result = bService.insertReply(r);
			
		return result > 0 ? "success" : "fail";
			
	}
	
	
	// Settings
	@RequestMapping("adminSettings.bo")
	public String selectSettings(BoardCate bc, HttpSession session, Model model) {
		
		int result = bService.selectSettings(bc);
		
		if(result > 0) {
			return "board/boardSettings";
		}else {
			return "common/errorPage";
		}
	}
	
	@RequestMapping("enrollSetting.bo")
	public String enrollBoardCate() {
		return "board/boardEnrollSettings";
	}
	
	
	@RequestMapping("insertSettings.bo")
	public String insertCate(BoardCate bc,HttpSession session, Model model) {
		
		int result = bService.insertCate(bc);
		
		System.out.println(result);
		
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 등록되었습니다.");
			return "redirect:boardUpdateSettings";
		}else {
			model.addAttribute("errorMsg", "게시판등록실패");
			return "common/errorPage";
		}
		
	}
	
	
}
