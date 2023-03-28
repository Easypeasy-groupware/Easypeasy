package com.ep.spring.address.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ep.spring.address.model.service.AddressService;
import com.ep.spring.address.model.vo.AddDept;
import com.ep.spring.address.model.vo.AddEdit;
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
	public ModelAndView addFavList(HttpSession session, ModelAndView mv) {
		int no = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		
		ArrayList<Address> pList = aService.selectPersonalFavAddList(no);
		ArrayList<Employee> eList = aService.selectEmpFavAddList(no);
		ArrayList<Address> sList = aService.selectExternalFavAddList(no);
		
		mv.addObject("p", pList)
		  .addObject("e", eList)
		  .addObject("s", sList)
		  .setViewName("address/addFavoriteList");
		return mv;
	}
	
	@RequestMapping("newPsForm.add") // 개인주소록 등록화면
	public String newPsAddForm() {
		return "address/newPersonalAddressForm";
	}
	
	@RequestMapping("insertNewPs.add")
	public String insertPersonalAdd(Address a, HttpSession session) {

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
	
	@RequestMapping("insertNewSh.add")
	public String insertSharedAdd(Address a, HttpSession session) { // 외부 공유주소록 등록
		
		int result = aService.insertSharedAdd(a);
		
		if(result> 0) {
			AlertMsg msg = new AlertMsg("주소록 추가", "성공적으로 추가되었습니다");
			session.setAttribute("successMsg", msg);
			return "redirect:externalAll.add";
			
		}else {
			AlertMsg msg = new AlertMsg("주소록 추가", "주소록추가에 실패했습니다");
			session.setAttribute("failMsg", msg);
			return "redirect:newShForm.add";
		}
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
	public String ajaxSelectSharedGroupList(HttpSession session) { // ajax 공유주소록 그룹 조회
		
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
	
	
	@ResponseBody
	@RequestMapping(value="deleteFavAdd.add")
	public String ajaxDeleteFavAdd(AddFavorite af) { // ajax 개인주소록 & 외부주소록 즐겨찾기 리스트 삭제
		
		int result = aService.deleteFavAdd(af);
		
		return result > 0 ? "success" : "fail";
	}
	
	@ResponseBody
	@RequestMapping(value="deleteFavEmp.add")
	public String ajaxDeleteFavEmp(AddFavorite af) { // ajax 사내주소록 즐겨찾기 리스트 삭제
		
		int result = aService.deleteFavEmp(af);
		
		return result > 0 ? "success" : "fail";
	}
	
	@ResponseBody
	@RequestMapping(value="insertFavAdd.add")
	public String ajaxInsertFavAdd(AddFavorite af) { // ajax 개인주소록 & 외부주소록 즐겨찾기 추가
		int result = aService.insertFavAdd(af);
		
		return result > 0 ? "success" : "fail";
	}
	
	@ResponseBody
	@RequestMapping(value="insertFavEmp.add")
	public String ajaxInsertFavEmp(AddFavorite af) {// ajax  사내주소록 즐겨찾기 추가
		int result = aService.insertFavEmp(af);
		
		return result > 0 ? "success" : "fail";
	}
	
	@RequestMapping("externalAll.add") // 공유 외부주소록 전체 리스트 조회
	public ModelAndView selectExternalAllList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, HttpSession session){
		int empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		
		int listCount = aService.selectExternalAllListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 20);
		
		ArrayList<Address> list = aService.selectExternalAllList(pi);
		ArrayList<AddFavorite> fList = aService.selectPsFavList(empNo);
		
		mv.addObject("count", listCount)
		  .addObject("pi", pi)
		  .addObject("list", list)
		  .addObject("fList", fList)
		  .setViewName("address/sharedExtAllAddList");
		return mv;
	}
	
	@RequestMapping("externalGroup.add") // 공유 외부주소록 그룹별 리스트 조회
	public ModelAndView selectExternalGroupList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, String group, HttpSession session) {
		int empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		
		int listCount = aService.selectExternalGroupListCount(group);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Address> list = aService.selectExternalGroupList(group, pi);
		ArrayList<AddFavorite> fList = aService.selectPsFavList(empNo);
		
		AddGroup ag = aService.selectAddGroup(group);
		
		mv.addObject("count", listCount)
		  .addObject("pi", pi)
		  .addObject("list", list)
		  .addObject("fList", fList)
		  .addObject("ag", ag)
		  .setViewName("address/sharedExtGroupAddList");
		return mv;
	}
	
	@RequestMapping("extAddInfo.add") // 공유 외부주소록 상세조회
	public ModelAndView selectExternalAddDetail(int no, ModelAndView mv) {
		Address a = aService.selectExternalAddDetail(no);
		
		ArrayList<AddEdit> list = aService.selectExternalAddEditList(no);
		
		mv.addObject("a", a)
		  .addObject("list", list)
		  .setViewName("address/sharedExtAddDetailForm");
		return mv;
	}
	
	@RequestMapping("extReg.add") // 공유 외부주소록 내가 등록한 주소록 리스트
	public ModelAndView selectExternalAddRegList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, String group, HttpSession session) {
		int empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		
		AddGroup ag = new AddGroup();
		ag.setEmpNo(empNo);
		if(group != null) {
			ag.setGroupNo(group);
		}
		System.out.println(ag);
		
		int listCount = aService.selectExternalAddRegListCount(ag);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Address> list = aService.selectExternalRegList(ag, pi);
		ArrayList<AddFavorite> fList = aService.selectPsFavList(empNo);
		
		if(group != null) {
			AddGroup agroup = aService.selectAddGroup(group);
			mv.addObject("ag", agroup);
		}else {
			mv.addObject("ag", "전체");
		}
		
		mv.addObject("count", listCount)
		  .addObject("pi", pi)
		  .addObject("list", list)
		  .addObject("fList", fList)
		  .setViewName("address/sharedExtRegAddList");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="deleteAddList.add") // ajax 개인주소록 선택한 여러주소록 삭제
	public int ajaxDeleteAddList(@RequestParam(value="addList[]") List<String> addList) {
		
		ArrayList<Address> list = new ArrayList<>();
		
		for(String addNo : addList) {
			Address a = new Address();
			a.setAddNo(Integer.parseInt(addNo));
			list.add(a);
		}
		int result = aService.deleteAddList(list);
		
		return result;
		
	}
	
	@ResponseBody
	@RequestMapping(value="changeAddList.add") // ajax 개인주소록 선택한 여러주소록 그룹 변경
	public int ajaxChangeGroupAddList (
			@RequestParam(value="addList[]") List<String> addList,
			@RequestParam(value="groupNo") String groupNo
			) {
		System.out.println(groupNo);
		ArrayList<Address> list = new ArrayList<>();
		
		for(String addNo : addList) {
			Address a = new Address();
			a.setAddNo(Integer.parseInt(addNo));
			if(groupNo.equals("선택안함")) {
				a.setGroup(null);
			}else {
				a.setGroupNo(groupNo);
			}
			list.add(a);
		}
		System.out.println(list);
		int result = aService.changeGroupAddList(list);
		
		return result;
	}
	
	@RequestMapping("sendSimple.add")
	public ModelAndView sendSimpleAdd(ModelAndView mv, String addName, String email, String phone, String groupNo) {
		
		Address a = new Address();
		a.setAddName(addName);
		a.setEmail(email);
		a.setPhone(phone);
		a.setGroupNo(groupNo);
		
		mv.addObject("simple", a)
		  .setViewName("address/newPersonalAddressForm");
		return mv;
	}
	
	
	@ResponseBody
	@RequestMapping(value="updatePsGroupName.add")
	public String ajaxUpdatePsGroupName(AddGroup ag) {
		System.out.println(ag);
		int result = aService.updatePsGroupName(ag);
		System.out.println(result);
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	
	@RequestMapping(value="addressBin.add")
	public ModelAndView selectAddressBinList(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, ModelAndView mv) {
		int empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		
		int listCount = aService.selectAddressBinListCount(empNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 20);
		
		ArrayList<Address> list = aService.selectAddressBinList(pi, empNo);
		
		mv.addObject("count", listCount)
		  .addObject("list", list)
		  .addObject("pi", pi)
		  .setViewName("address/addressBin");
		return mv;
	
	
	}
	
	@ResponseBody
	@RequestMapping(value="deleteFromBin.add") // ajax 개인주소록 선택한 여러주소록 삭제
	public int ajaxCompleteDeleteAddList(@RequestParam(value="addList[]") List<String> addList) {
		
		ArrayList<Address> list = new ArrayList<>();
		
		for(String addNo : addList) {
			Address a = new Address();
			a.setAddNo(Integer.parseInt(addNo));
			list.add(a);
		}
		int result1 = aService.deleteFavList(list);
		int result2 = aService.completeDeleteAddList(list);
		
		return result1*result2;
		
	}
	
	@ResponseBody
	@RequestMapping(value="restoreAddList.add") // ajax 개인주소록 선택한 여러주소록 삭제
	public int ajaxRestoreAddList(@RequestParam(value="addList[]") List<String> addList) {
		
		ArrayList<Address> list = new ArrayList<>();
		
		for(String addNo : addList) {
			Address a = new Address();
			a.setAddNo(Integer.parseInt(addNo));
			list.add(a);
		}
		int result = aService.restoreAddList(list);
		
		return result;
		
	}
	
	@RequestMapping(value="sharedGroup.add")
	public ModelAndView sharedGroupEditView(ModelAndView mv) {
		
		ArrayList<AddGroup> gList = aService.selectSharedAddGroup();
		int total = aService.selectExternalAllListCount();
		ArrayList<Address> aList = aService.selectAllSharedAddress();
		
		mv.addObject("gList", gList) // 외부그룹리스트
		  .addObject("total", total) // 전체 공유주소록 개수
		  .addObject("aList", aList) // 전체 공유 주소록
		  .setViewName("address/adminGroupManageList");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="updateSharedGroup.add")
	public int ajaxUpdateSharedGroupName(AddGroup ag) {
		
		return aService.updateSharedGroupName(ag);
	}
	
	@RequestMapping("adminDel.add")
	public String deleteSharedGroup(int no) {
		System.out.println(no);
		
		int result = aService.deleteSharedGroup(no);
		
		return "address/adminGroupManageList";
	}
	
	

}
