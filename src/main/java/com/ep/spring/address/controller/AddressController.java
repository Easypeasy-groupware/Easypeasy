package com.ep.spring.address.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ep.spring.address.model.service.AddressService;
import com.ep.spring.common.model.vo.PageInfo;
import com.ep.spring.common.template.Pagination;
import com.ep.spring.login.model.vo.Employee;

@Controller
public class AddressController {
	
	@Autowired
	private AddressService aService;
	
	@RequestMapping("favorite.add") // 즐겨찾기 
	public String addFavList() {
		return "address/addFavorite";
	}
	
	@RequestMapping("newPs.add") // 개인주소록 등록화면
	public String newPsAddForm() {
		return "address/newPersonalAddress";
	}
	
	
	@RequestMapping("internalEnt.add")
	public ModelAndView selectEntEmplList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = aService.selectEntEmpListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 20);
		
		ArrayList<Employee> list = aService.selectEntEmpListCount(pi);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("address/sharedAddListAllEmp.jsp");
		return mv;
	}
	
	
	
	@RequestMapping("internalDept.add") // 사내 부서별 주소록리스트
	public ModelAndView selectDeptEmpList(@RequestParam(value="cpage", defaultValue="1") int currentPage, String dept, ModelAndView mv) {
		
		int listCount = aService.selectDeptEmpListCount(dept);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 20);
		
		ArrayList<Employee> list = aService.selectDeptEmpList(pi, dept);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("address.sharedAddListDept.jsp");
		return mv;
 	}
	

}
