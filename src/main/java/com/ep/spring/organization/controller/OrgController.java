package com.ep.spring.organization.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ep.spring.common.model.vo.PageInfo;
import com.ep.spring.common.template.Pagination;
import com.ep.spring.login.model.vo.Employee;
import com.ep.spring.organization.model.service.OrgService;

@Controller
public class OrgController {

	@Autowired
	private OrgService oService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	@RequestMapping("list.org")
	public String orgList() {
		return "organization/orgMain";
	}
	
	
	@RequestMapping("adminList.org")
	public ModelAndView selectList(@RequestParam(value="cpage", defaultValue="1")int currentPage, ModelAndView mv) {
		
		int listCount = oService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Employee> list = oService.selectList(pi);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("organization/orgMainAdmin");
		
		return mv;
		
	}
	
	@RequestMapping("memberEnroll.org")
	public String memberEnroll() {
		return "organization/memberInsertForm";
	}
	
	/*@RequestMapping("insert.org")
	public String insertMember(Employee e, Model model, HttpSession session) {
		
		String encPwd = bcryptPasswordEncoder.encode(e.getEmpPwd());
		System.out.println("암호문 : " + encPwd);
		
		e.setEmpPwd(encPwd);
		
		int result = oService.insertMember(e);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 등록되었습니다.");
			return "redirect:/";
		}else {
			model.addAttribute("errorMsg", "실패");
			return "common/errorPage";
		}
		
	}*/
	
	
	
	
}
