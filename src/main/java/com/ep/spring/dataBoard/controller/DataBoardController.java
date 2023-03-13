package com.ep.spring.dataBoard.controller;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ep.spring.common.model.vo.PageInfo;
import com.ep.spring.common.template.FileUpload;
import com.ep.spring.common.template.Pagination;
import com.ep.spring.dataBoard.model.service.DataBoardService;
import com.ep.spring.dataBoard.model.vo.DataBoard;

@Controller
public class DataBoardController {

	@Autowired
	private DataBoardService daService;
	
	@RequestMapping("list.db")
	public String selectDbList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = daService.selectDbListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<DataBoard> list = daService.selectDbList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "dataBoard/dataBoardMain";
	}
	
	@RequestMapping("enrollForm.db")
	public String enrollForm() {
		
		return "dataBoard/dataBoardEnrollForm";
		
	}
	
	@RequestMapping("insert.db")
	public String insertDataBoard(DataBoard db, MultipartFile upfile, HttpSession session, Model model) {
		
		// 전달된 파일 파일명 수정 작업 후 서버에 업로드
		if(!upfile.getOriginalFilename().equals("")) {
			
			String saveFilePath = FileUpload.saveFile(upfile, session, "resources/db_files/");
			
			db.setOriginName(upfile.getOriginalFilename());
			db.setChangeName(saveFilePath);
		}
		
		int result = daService.insertDataBoard(db);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
			return "redirect:list.db";
		}else {
			return "recirect:enrollForm.db";
		}
	}
	
	@RequestMapping("detail.db")
	public String selectBoard(int no, HttpSession session, Model model) {
		
		int result = daService.increaseCount(no);
	
		if(result > 0) {
			
			DataBoard currentdb = daService.selectDataBoard(no);
			
			DataBoard db = daService.selectDataBoard(no);
			
			model.addAttribute("db", db);
			return "dataBoard/dataBoardDetailView";
			
		}else {
			return "redirect:list.db";
		}
	}
	
	@RequestMapping("delete.db")
	public String deleteDataBoard(int no, String filePath, HttpSession session) {
		
		int result = daService.deleteDataBoard(no);
		
		if(result > 0) { 
			
			// 첨부파일이 있었을 경우 파일 삭제
			if(!filePath.equals("")) {
				new File(session.getServletContext().getRealPath(filePath)).delete();
			}
			
			session.setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다");
			return "redirect:list.db";
			
		}else { // 삭제 실패
			session.setAttribute("alertMsg", "게시글 삭제 실패");
			return "redirect:list.db";
		}
	}
	
	@RequestMapping("updateForm.db")
	public String updateForm(int no, Model model) {
		
		model.addAttribute("db", daService.selectDataBoard(no));
		
		return "dataBoard/dataBoardUpdateForm";
	}
	
	@RequestMapping("update.db")
	public String updateDataBoard(DataBoard db, MultipartFile reupfile, HttpSession session) {
										
		if(!reupfile.getOriginalFilename().equals("")) {
			
			// 기존의 첨부파일이 있었을 경우 기존의 첨부파일 지우기
			if(db.getOriginName() != null) {
				new File(session.getServletContext().getRealPath(db.getChangeName())).delete();
			}
			
			// 새로 넘어온 첨부파일 서버 업로드
			String saveFilePath = FileUpload.saveFile(reupfile, session, "resources/db_files/");
			
			// b에 새로운 첨부파일에 대한 원본명, 저장경로 이어서 담기
			db.setOriginName(reupfile.getOriginalFilename());
			db.setChangeName(saveFilePath);
			
		}
		
		int result = daService.updateDataBoard(db);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 게시글이 수정되었습니다.");
			return "redirect:detail.db?no=" + db.getDbNo(); // no 넘겨주기
		}else {
			session.setAttribute("alertMsg", "게시글 수정 실패");
			return "redirect:detail.db?no=" + db.getDbNo();
		}
	}
	
	@RequestMapping("search.db")
	public String searchDbList(String keyword, @RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		int searchCount = daService.selectSearchCount(keyword);
		
		PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, 10, 5);
		
		ArrayList<DataBoard> list = daService.selectSearchList(pi, keyword);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		model.addAttribute("keyword", keyword);
		
		//System.out.println(keyword);
		
		return "dataBoard/dataBoardMain";
	}
	
	
}
