package com.ep.spring.dataBoard.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ep.spring.common.model.vo.PageInfo;
import com.ep.spring.common.template.Pagination;
import com.ep.spring.dataBoard.model.service.DataBoardService;
import com.ep.spring.dataBoard.model.vo.DataBoard;

@Controller
public class DataBoardController {

	@Autowired
	private DataBoardService daService;
	
	@RequestMapping("list.db")
	public String selectMailList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
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
}
