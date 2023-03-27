package com.ep.spring.board.controller;

import java.io.File;
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
import com.ep.spring.common.model.vo.AlertMsg;
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
	/*
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
			AlertMsg msg = new AlertMsg("게시글 등록", "성공적으로 게시글이 등록되었습니다.");
			mv.addObject("successMsg", msg);
		}else {
			AlertMsg msg = new AlertMsg("게시글 등록", "게시글 등록 실패");
			mv.addObject("successMsg", msg);
		}
		mv.setViewName("redirect:list.bo");
		return mv;
		
	}
	*/
	@RequestMapping("insert.bo")
	public String insertBoard(Board b, MultipartFile upfile, HttpSession session, Model model) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			
			String  saveFilePath = FileUpload.saveFile(upfile, session, "resources/board_attachFiles/"); 
			
			b.setOriginName(upfile.getOriginalFilename()); 
			b.setChangeName(saveFilePath); 
		}
		
		int result = bService.insertBoard(b);
		
		if(result > 0) { 
			session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
			return "redirect:list.bo";
		}else { 
			return "redirect:list.bo";
		}
		
	}
	
	/*	
	@RequestMapping("detailForm.bo")
	public ModelAndView selectBoard(int no, HttpSession session, ModelAndView mv, Board b) {
		
		int result = bService.increaseCount(no);
		b.setBoardNo(no);
		//System.out.println(result);
		
		if(result > 0) {
			Board bb = bService.selectBoard(b);
			ArrayList<Attachment> attachmentList = bService.selectAttachmentList(b);
			
			//System.out.println(attachmentList);
			
			mv.addObject("b", bb).addObject("attachmentList", attachmentList).setViewName("board/boardDetailForm");
			
		}else {
			mv.setViewName("redirect:list.bo");
		}
		return mv;
	}
	*/
	
	@RequestMapping("detailForm.bo")
	public ModelAndView selectBoard(int no, ModelAndView mv) {
		int result = bService.increaseCount(no);
		
		if(result > 0) {
			Board b = bService.selectBoard(no);
			//System.out.println(b);
			mv.addObject("b", b).setViewName("board/boardDetailForm");
	
		}else {
			mv.addObject("errorMsg", "조회수 증가 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	/*
	@RequestMapping("delete.bo")
	public String deleteBoard(@RequestParam(value="no")int boardNo, HttpSession session, Model model, ArrayList<String> filePath) {
		
		int result = bService.deleteBoard(boardNo);
		
		if(result > 0) {
			
				for(int i= 0; i < filePath.size(); i++) {
					if(!filePath.get(i).equals("")) {
						new File(session.getServletContext().getRealPath(filePath.get(i))).delete();
					}
				}
			session.setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다."); 
			return "redirect:list.bo";
		}else {
			model.addAttribute("errorMsg", "게시글 삭제 실패");
			return "redirect:list.bo";
		}
		
	}
	*/
	
	@RequestMapping("delete.bo")
	public String deleteBoard(int no, String filePath, HttpSession session, Model model) {
		int result = bService.deleteBoard(no);
		
		if(result > 0) {	
			
			if(!filePath.equals("")) {
				new File(session.getServletContext().getRealPath(filePath)).delete(); 
			}
			session.setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다."); 
			return "redirect:list.bo";
			
		}else {	
			model.addAttribute("errorMsg", "게시글 삭제 실패");
			return "common/errorPage";
		}
	}
		
	@RequestMapping("updateForm.bo")
	 public String updateForm(int no, Model model) {
		model.addAttribute("b", bService.selectBoard(no));
		
		return "board/boardUpdateForm"; 
	 }
	/*
	@RequestMapping("update.bo")
	public String updateBoard(@RequestParam("no") int boardNo, Board b, HttpSession session, Model model, @RequestParam(value="originNames", required=false) List<MultipartFile> originNames) {

		// 게시물 번호 설정
		b.setBoardNo(boardNo);

		// 첨부파일
		ArrayList<Attachment> atList = new ArrayList<>();
		
		
		// 기존의 첨부파일이 있었을 경우 => 기존의 파일 지우기
		if(originNames != null) {
			ArrayList<Attachment> aList = bService.selectAttList(b);
			if(aList != null) {
				for(Attachment att : aList) {
					String filePath = att.getFilePath();
					File deleteFile = new File(session.getServletContext().getRealPath(filePath));
					deleteFile.delete();
				}
				
				bService.deleteAttachment(b);
			}

			if(originNames.size() > 0) {
				String path = "resources/board_attachFiles/";
				for (MultipartFile mf : originNames) {
					if(!mf.isEmpty()) {
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
			}

		}

		int result = bService.updateBoard(b, atList);
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 게시글이 수정되었습니다.");
			return "redirect:detailForm.bo?no=" + boardNo;
		} else {
			model.addAttribute("errorMsg", "게시글 수정 실패");
			return "common/errorPage";
		}
	}
	*/
	
	@RequestMapping("update.bo")
	public String updateBoard(Board b, MultipartFile reupfile, HttpSession session, Model model) {
		
		if(!reupfile.getOriginalFilename().equals("")) {  
			
			if(b.getOriginName() != null) {
				new File(session.getServletContext().getRealPath(b.getChangeName())).delete(); 
			}
			
			String saveFilePath = FileUpload.saveFile(reupfile, session, "resources/board_attachFiles/");
			
			b.setOriginName(reupfile.getOriginalFilename());
			b.setChangeName(saveFilePath);
		}
		int result = bService.updateBoard(b);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 게시글이 수정되었습니다."); 
			return "redirect:detailForm.bo?no=" + b.getBoardNo();	
		}else {
			model.addAttribute("errorMsg", "게시글 수정 실패");
			return "common/errorPage";
		}
	}


	// 익명
	
	@RequestMapping("free.bo")
	public ModelAndView selectFreeList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = bService.selectFreeListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Board> list = bService.selectFreeList(pi);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("board/boardAnonymousList"); 
		
		return mv;
	}
	
	@RequestMapping("enrollAForm.bo")
	public String enrollAForm() {
		return "board/boardAnonymEnroll";
	}
	/*
	@RequestMapping("insertA.bo")
	public ModelAndView insertABoard(@RequestParam List<MultipartFile> originNames, Board b, Attachment a, HttpSession session, ModelAndView mv) {
		
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
		
		int result = bService.insertABoard(b, atList);
		
		if(result > 0) {
			mv.addObject("successMsg", "게시글 등록 성공");
		}else {
			mv.addObject("successMsg", "게시글 등록 실패");
		}
		mv.setViewName("redirect:free.bo");
		return mv;
		
	}
	*/
	
	/*
	@RequestMapping("detailAForm.bo")
	public ModelAndView selectABoard(int no, HttpSession session, ModelAndView mv, Board b) {
		
		int result = bService.increaseACount(no);
		b.setBoardNo(no);
		//System.out.println(result);
		
		if(result > 0) {
			Board bb = bService.selectABoard(b);
			ArrayList<Attachment> attachmentList = bService.selectAnAttachmentList(b);
			
			//System.out.println(attachmentList);
			
			mv.addObject("b", bb).addObject("attachmentList", attachmentList).setViewName("board/boardAnonymDetail");
			
		}else {
			mv.setViewName("redirect:free.bo");
		}
		return mv;
	}
	*/
	
	@RequestMapping("deleteA.bo")
	public String deleteABoard(@RequestParam(value="no")int boardNo, HttpSession session, Model model, ArrayList<String> filePath) {
		
		int result = bService.deleteABoard(boardNo);
		
		if(result > 0) {
			
				for(int i= 0; i < filePath.size(); i++) {
					if(!filePath.get(i).equals("")) {
						new File(session.getServletContext().getRealPath(filePath.get(i))).delete();
					}
				}
			session.setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다."); 
			return "redirect:free.bo";
		}else {
			model.addAttribute("errorMsg", "게시글 삭제 실패");
			return "redirect:free.bo";
		}
		
	}
	
	
	@RequestMapping("updateAForm.bo")
	 public String updateAForm() {
	   return "board/boardAnonymUpdate"; 
	 }
	/*
	@RequestMapping("updateA.bo")
	public String updateABoard(@RequestParam("no") int no, Board b, HttpSession session, Model model, @RequestParam(value="originNames", required=false) List<MultipartFile> originNames) {

		// 게시물 번호 설정
		b.setBoardNo(no);

		// 첨부파일
		ArrayList<Attachment> atList = new ArrayList<>();
		if(originNames != null) {

			// 기존의 첨부파일이 있었을 경우 => 기존의 파일 지우기
			ArrayList<Attachment> aList = bService.selectAnonAttList(b);
			if(aList != null) {
				for(Attachment att : aList) {
					String filePath = att.getFilePath();
					File deleteFile = new File(session.getServletContext().getRealPath(filePath));
					deleteFile.delete();
				}
				bService.deleteAnonAttachment(b);
			}

			if(originNames.size() > 0) {
				String path = "resources/board_attachFiles/";
				for (MultipartFile mf : originNames) {
					if(!mf.isEmpty()) {
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
			}

		}

		int result = bService.updateABoard(b, atList);
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 게시글이 수정되었습니다.");
			return "redirect:detailAForm.bo?no=" + no;
		} else {
			model.addAttribute("errorMsg", "게시글 수정 실패");
			return "redirect:free.bo";
		}
	}
	*/
	
	
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
	
	@ResponseBody
	@RequestMapping("rdelete.bo")
	public String deleteReply(int replyNo) {
		int result = bService.deleteReply(replyNo);
		
		return result > 0 ? "success" : "fail";
	}
	
	@ResponseBody
	@RequestMapping("rupdate.bo")
	public String updateReply(BoardReply r) {
	
		int result = bService.updateReply(r);
			
		return result > 0 ? "success" : "fail";
			
	}
	
	/*
	 * @RequestMapping("rupdateform.bo") public String updateReplyForm(BoardReply r,
	 * Model model) { int result = bService.updateReplyForm(r);
	 * model.addAttribute("reply", reply); return "updateReplyForm"; }
	 */
		
	
	
	
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
			session.setAttribute("alertMsg", "성공적으로 게시판이 등록되었습니다.");
			return "redirect:boardUpdateSettings";
		}else {
			model.addAttribute("errorMsg", "게시판등록실패");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("updateSettingForm.bo")
	public String updateSettings() {
		return "board/boardUpdateSettings";
	}
	
	@RequestMapping("updateSettings.bo")
	public String updateCate(BoardCate bc, HttpSession session, Model model) {
		int result = bService.updateCate(bc);
		
		if(result > 0) {
			return "board/boardUpdateSettings";
		}else {
			return "common/errorPage";
		}
		
	}
	
	// 메인페이지 게시글 top5
	@ResponseBody
	@RequestMapping(value="topList.bo", produces="application/json; charset=UTF-8")
	public String ajaxSelectTopList() {
		ArrayList<Board> list = bService.selectTopList();
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="topFree.bo", produces="application/json; charset=UTF-8")
	public String ajaxSelectFreeList() {
		ArrayList<Board> list = bService.selectFreeList();
		return new Gson().toJson(list);
	}
	
}
