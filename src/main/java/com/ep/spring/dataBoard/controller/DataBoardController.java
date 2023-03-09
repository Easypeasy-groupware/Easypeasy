package com.ep.spring.dataBoard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ep.spring.dataBoard.model.service.DataBoardService;

@Controller
public class DataBoardController {

	@Autowired
	private DataBoardService daService;
	
	@RequestMapping("main.db")
	public String selectMailList() {
		return "dataBoard/dataBoardMain";
	}
}
