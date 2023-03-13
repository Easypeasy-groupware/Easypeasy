package com.ep.spring.address.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ep.spring.address.model.service.AddressService;
import com.ep.spring.address.model.vo.AddDept;
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
	

	@RequestMapping("internalEnt.add") // 사내주소록 전체리스트
	public ModelAndView selectEntEmplList(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, ModelAndView mv) {
		int no = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		
		int listCount = aService.selectEntEmpListCount(no);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 20);
		
		ArrayList<Employee> list = aService.selectEntEmpList(pi, no);
		
		ArrayList<Employee> fList = aService.selectEmpFavList(no);
		
		mv.addObject("count", listCount)
		  .addObject("pi", pi)
		  .addObject("list", list)
		  .addObject("fList", fList)
		  .setViewName("address/sharedAddListAllEmp");
		return mv;
	}
	
	
	
	@RequestMapping("internalDept.add") // 사내 부서별 주소록리스트
	public ModelAndView selectDeptEmpList(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, String dept, ModelAndView mv) {
		
		int empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();

		String deptName = "";
		switch(dept) {
		case "hr" : deptName = "D1"; break;
		case "as" : deptName = "D2"; break;
		case "sales1" : deptName = "D3"; break;
		case "sales2" : deptName = "D4"; break;
		case "sales3" : deptName = "D5"; break;
		case "marketing" : deptName = "D6"; break;
		}
		
		AddDept ad = new AddDept(empNo, deptName);
		
		int listCount = aService.selectDeptEmpListCount(ad);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Employee> list = aService.selectDeptEmpList(pi, ad);
		
		ArrayList<Employee> fList = aService.selectEmpFavList(empNo);
		
		mv.addObject("count", listCount)
		  .addObject("pi", pi)
		  .addObject("list", list)
		  .addObject("fList", fList)
		  .addObject("dept", dept)
		  .setViewName("address/sharedAddListDept");
		return mv;
 	}
	
	@RequestMapping("empInfo.add") // 사내주소록 상세페이지
	public ModelAndView selectEmpAddDetail(int no, ModelAndView mv) {
		
		Employee emp = aService.selectEmpAddDetail(no);
		
		mv.addObject("e", emp)
		  .setViewName("address/employeeAddressDetailForm");
		return mv;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
