package com.ep.spring.address.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ep.spring.address.model.service.AddressService;
import com.ep.spring.address.model.vo.AddDept;
import com.ep.spring.address.model.vo.AddFavorite;
import com.ep.spring.address.model.vo.AddGroup;
import com.ep.spring.address.model.vo.Address;
import com.ep.spring.common.model.vo.AlertMsg;
import com.ep.spring.common.model.vo.PageInfo;
import com.ep.spring.common.template.Pagination;
import com.ep.spring.login.model.vo.Employee;
import com.google.gson.Gson;

@Controller
public class AddressController {
	
	@Autowired
	private AddressService aService;
	
	@RequestMapping("favorite.add") // 즐겨찾기 
	public String addFavList() {
		return "address/addFavoriteList";
	}
	
	@RequestMapping("newPsForm.add") // 개인주소록 등록화면
	public String newPsAddForm() {
		return "address/newPersonalAddressForm";
	}
	
	@RequestMapping("insertNewPs.add")
	public String insertPersonalAdd(Address a, HttpSession session) {
		System.out.println(a);
		int result = aService.insertPersonalAdd(a);
		
		if(result > 0) {
			AlertMsg msg = new AlertMsg("주소록 추가", "성공적으로 추가되었습니다");
			session.setAttribute("successMsg", msg);
			return "redirect:psAll.add";
		}else {
			AlertMsg msg = new AlertMsg("주소록 추가", "주소록추가 실패");
			session.setAttribute("failMsg", msg);
			return "redirect:newPsForm.add";
		}
	}
	
	@RequestMapping("newShForm.add") 
	public String newShAddForm() {
		return "address/newSharedAddressForm";
	}

	@RequestMapping("internalEnt.add") // 사내주소록 전체리스트
	public ModelAndView selectEntEmplList(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, ModelAndView mv) {
		int no = ((Employee)session.getAttribute("loginUser")).getEmpNo();

		int listCount = aService.selectEntEmpListCount(no);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 20);
		
		ArrayList<Employee> list = aService.selectEntEmpList(pi, no);
		
		ArrayList<AddFavorite> fList = aService.selectEmpFavList(no);

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
		
		AddDept ad = new AddDept();
		ad.setEmpNo(empNo);
		ad.setDeptCode(deptName);
		
		int listCount = aService.selectDeptEmpListCount(ad);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Employee> list = aService.selectDeptEmpList(pi, ad);
		
		ArrayList<AddFavorite> fList = aService.selectEmpFavList(empNo);
		
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
	
	@RequestMapping("psAll.add") // 개인주소록 전체리스트
	public ModelAndView selectPsAllAddList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, HttpSession session) {
		int empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		
		int listCount = aService.selectPsAllAddListCount(empNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 20);
		
		ArrayList<Address> list = aService.selectPsAllAddList(pi, empNo);
		
		ArrayList<AddFavorite> fList = aService.selectPsFavList(empNo);
		
		mv.addObject("count", listCount)
		  .addObject("list", list)
		  .addObject("fList", fList)
		  .addObject("pi", pi)
		  .setViewName("address/personalAllAddList");
		return mv;
	}
	
	@RequestMapping("psGroup.add") // 개인주소록 그룹별 리스트
	public ModelAndView selectPsGroupAddList(@RequestParam(value="cpage", defaultValue="1") int currentPage, String group, ModelAndView mv, HttpSession session) {
		int empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();

		AddDept ad = new AddDept();
		ad.setEmpNo(empNo);
		ad.setGroupNo(group);
		
		AddGroup ag = aService.selectAddGroup(group);
		
		int listCount = aService.selectPsGroupAddListCount(ad);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Address> list = aService.selectPsGroupAddList(pi, ad);
		
		ArrayList<AddFavorite> fList = aService.selectPsFavList(empNo);
		
		mv.addObject("ag", ag)
		  .addObject("count", listCount)
		  .addObject("list", list)
		  .addObject("fList", fList)
		  .addObject("pi", pi)
		  .setViewName("address/personalGroupAddList");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="insertPsGroup.add")
	public String ajaxInsertPersonalGroup(AddGroup ag) { // ajax 개인주소록 그룹 추가
		
		int result1 = aService.selectExtPersonalGroup(ag);
		
		if(result1 > 0) { // 중복된 그룹 있음
			return "fail";
			
		}else { // 중복된 그룹 없음
			int result2 = aService.insertNewPersonalGroup(ag);
			return result2 > 0 ? "success" : "fail";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="listPsGroup.add", produces="application/json; charset=utf-8")
	public String ajaxSelectPersonalGroupList(int empNo, HttpSession session) { // ajax 개인주소록 그룹 조회
		
		ArrayList<AddGroup> list = aService.selectPersonalGroupList(empNo);
		
		session.setAttribute("pList", list); 
		
		return new Gson().toJson(list);
		
	}
	
	@RequestMapping("psAddInfo.ad")
	public ModelAndView selectPsAddDetail(int no, ModelAndView mv) { // 개인주소록 상세조회
		
		Address add = aService.selectPsAddDetail(no);
		
		mv.addObject("a", add)
		  .setViewName("address/personalAddDetailForm");
		return mv;
	}
	
	@RequestMapping("updatePsAdd.ad")
	public String updatePsAdd(Address a, HttpSession session) { // 개인주소록 수정하기
		int result = aService.updatePsAdd(a);
		
		if(result > 0) {
			AlertMsg msg = new AlertMsg("주소록 수정", "성공적으로 수정되었습니다");
			session.setAttribute("successMsg", msg);
		}else {
			AlertMsg msg = new AlertMsg("주소록 수정", "주소록이 수정되지 않았습니다");
			session.setAttribute("failMsg", msg);
		}
		return "redirect:psAddInfo.ad?no=" + a.getAddNo();
		
	}
	
	
	@ResponseBody
	@RequestMapping(value="insertShGroup.add")
	public String ajaxInsertSharedGroup(AddGroup ag) { // ajax 개인주소록 그룹 추가
		
		int result1 = aService.selectExtSharedGroup(ag);
		
		if(result1 > 0) { // 중복된 그룹 있음
			return "fail";
			
		}else { // 중복된 그룹 없음
			int result2 = aService.insertNewSharedGroup(ag);
			return result2 > 0 ? "success" : "fail";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="listShGroup.add", produces="application/json; charset=utf-8")
	public String ajaxSelectSharedGroupList(HttpSession session) { // ajax 개인주소록 그룹 조회
		
		ArrayList<AddGroup> list = aService.selectSharedAddGroup();

		session.setAttribute("sList", list); 
		return new Gson().toJson(list);
		
	}
	
	@ResponseBody
	@RequestMapping(value="selectEmpList.ad", produces="application/json; charset=utf-8")
	public String ajaxSelectEmployeeList(Employee e) {
		
		ArrayList<Employee> list = aService.selectEmployeeList(e);
		
		return new Gson().toJson(list);
	}
	
	
	
	
	
	
	
	

}
