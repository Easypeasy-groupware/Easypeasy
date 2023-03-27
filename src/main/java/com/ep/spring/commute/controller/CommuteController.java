package com.ep.spring.commute.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ep.spring.approval.model.vo.VacationForm;
import com.ep.spring.common.model.vo.AlertMsg;
import com.ep.spring.common.model.vo.PageInfo;
import com.ep.spring.common.template.Pagination;
import com.ep.spring.commute.model.service.CommuteService;
import com.ep.spring.commute.model.vo.Commute;
import com.ep.spring.commute.model.vo.VacationRecode;
import com.ep.spring.login.controller.EmployeeController;
import com.ep.spring.login.model.service.EmployeeService;
import com.ep.spring.login.model.service.EmployeeServiceImpl;
import com.ep.spring.login.model.vo.Employee;


@Controller
public class CommuteController {
	
	@Autowired
	private CommuteService cService;
	
	@Autowired
	private EmployeeService eService;
	
		//근태관리 메인페이지(일반사용자)
		@RequestMapping("commute.ep")
		public ModelAndView commuteMainForm(HttpSession session, ModelAndView mv) {
			int empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
			//System.out.println(empNo);
			
			Commute c = cService.commuteMainPage(empNo);
			//System.out.println(c);
			
			// 지각, 조기퇴근, 결근, 퇴근 미체크 횟수 카운트
			int tr = 0;
			int countLe = 0;
			int ab = 0;
			int end = 0;
			if(c != null) {
				//근태현황 카운트
				tr = cService.countTr(empNo);
				countLe = cService.countLe(empNo);
				ab = cService.countAb(empNo);
				end = cService.countEnd(empNo);
				
				//휴가기록 및 잔여휴가 조회
				ArrayList<VacationRecode> list1 = cService.selectVacMain(empNo);
				ArrayList<VacationForm> list2 = cService.selectVacForm(empNo);
				
				mv.addObject("c", c)
				  .addObject("tr", tr)
				  .addObject("countLe", countLe)
				  .addObject("ab", ab)
				  .addObject("end", end)
				  .addObject("list1", list1)
				  .addObject("list2", list2)
				  .setViewName("commute/commuteMain");
				return mv;
			}else {
				AlertMsg msg = new AlertMsg("근태관리","나의 근무정보 조회에 실패했습니다. 다시시도 해주세요.");
				mv.addObject("failMsg", msg)
				  .setViewName("common/main");
				return mv;
			}
			
			  
			 
			
			
		
		}
		
		//출근시간 등록
		@ResponseBody
		@RequestMapping("inTime.co")
		public String inTime(Commute c) throws ParseException {			
			
			int result1 = cService.inTime(c);
			
			// startTime을 Date타입으로 변경 => 시분초만 뽑아낸후 대소비교
			String startTime = c.getStartTime();
	        // 문자열
	        String dateStr = startTime;
	 
	        // 포맷터
	        SimpleDateFormat formatter = new SimpleDateFormat("HH:mm:ss");
	 
	        // 문자열 -> Date
	        Date date = formatter.parse(dateStr);
	        //System.out.println(date);
	        int H = date.getHours();
	        int M = date.getMinutes();
	        //System.out.println(H);
	        
	        //09시01분 전에는 정상근무(comStatus = "WO")
	        //이후에는 지각(comStatus = "TR")
	        if(H<9 && M<1) {
	        	c.setComStatus("WO");
	        }else {
	        	c.setComStatus("TR");
	        }
	        int result2 = cService.updateComStatus(c);

			return (result1*result2) > 0 ? "success" : "fail";
			
		}
		
		//퇴근시간 등록
		@ResponseBody
		@RequestMapping("outTime.co")
		
		public String outTime(Commute c) throws ParseException {			
					
			int result1 = cService.outTime(c);
			
			// startTime을 Date타입으로 변경 => 시분초만 뽑아낸후 대소비교
			String endTime = c.getEndTime();
			// 문자열
			String dateStr = endTime;
				 
			// 포맷터
			SimpleDateFormat formatter = new SimpleDateFormat("HH:mm:ss");
				 
	        // 문자열 -> Date
	        Date date = formatter.parse(dateStr);
	        //System.out.println(date);
	        int H = date.getHours();
	        int M = date.getMinutes();
	        //System.out.println(H);
	        
	        //18시00분 전에는 조퇴(comStatus = "LE")
	        if(H<18) {
	        	c.setLeStatus("Y");
	        }else {
	        	c.setLeStatus("N");
	        }
	        int result2 = cService.updateLeStatus(c);
					
			return (result1*result2) > 0 ? "success" : "fail";
					
		}
		
		//휴가내역 메인페이지
		@RequestMapping("vac.ep")
		public String selectVacMain(HttpSession session) {
			int empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
			
			ArrayList<VacationRecode> list1 = cService.selectVacMain(empNo);
			ArrayList<VacationForm> list2 = cService.selectVacForm(empNo);
			
			session.setAttribute("list1", list1);
			session.setAttribute("list2", list2);
			
			//System.out.println(list1);
			//System.out.println(list2);
			
			return "vacation/vacationMain";
		}
		
		//근무상태 변경
		@ResponseBody
		@RequestMapping("updateStatus")
		public String updateStatus(Employee e, HttpSession session) {
			int result = cService.updateStatus(e);
			e.setEmpId(((Employee)session.getAttribute("loginUser")).getEmpId());
			Employee loginUser = eService.loginEmployee(e);
			
			session.setAttribute("loginUser", loginUser);
			return result > 0 ? "success" : "fail";
		}
		
		
		// 근무현황 및 계획(일반)
		@RequestMapping("working.ep")
		public String monthlyWorkingStatus(HttpSession session) {
			int empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
			
			ArrayList<Commute> list = cService.monthlyWorkingStatus(empNo);
			session.setAttribute("list", list);
			
			//System.out.println(list);
			return "commute/monthlyWorkingStatus";
		}
		
		//근태관리 인사계정
		@RequestMapping("working.HR")
		public ModelAndView hRWorkingStatus(ModelAndView mv, HttpSession session, @RequestParam(value="cpage", defaultValue="1")int currentPage) {
			String deptCode = ((Employee)session.getAttribute("loginUser")).getDeptCode();
			
			if(deptCode.equals("D1")) {//로그인한 회원이 인사팀 일때 => 사원 정보 리스트 조회 => 페이지출력
				int listCount = cService.selectListCount();
				
				PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
				ArrayList<Employee> list = cService.selectEmpList(pi);
				
				mv.addObject("pi", pi).addObject("list", list).setViewName("commute/HRworkingStatus");
				
				return mv;
				
			}else {//로그인한 회원이 인사팀이 아닐때 => 알림창으로 인사팀만 접근가능하다고 알려주기
				AlertMsg msg = new AlertMsg("인사 계정", "인사관리팀 외에는 인사계정 접근이 불가능합니다.");
				mv.addObject("failMsg", msg)
				  .setViewName("commute/commuteMain");
				return mv;
				
			}
			
			
		}
		//근무시간 확인 및 수정=>클릭된 사원의 정보
		@RequestMapping("workingEmp.HR")
		public String selectEmpWorkingStatus(int no, HttpSession session) {
			int empNo = no;
			
			ArrayList<Commute> list = cService.monthlyWorkingStatus(empNo);
			Employee e = cService.selectEmployeeInformation(empNo);
			
			session.setAttribute("clickEmp", e);
			session.setAttribute("list", list);
			
			return "commute/selectEmpWorkingStatus";
			
		}
		
		//근무시간 수정(인사계정)
		@RequestMapping("updateTime.HR")
		public String updateTimeHR(Commute c, HttpSession session) {
			//System.out.println(c);
			int result = cService.updateTimeHR(c);
			int empNo = c.getEmpNo();
			
			if(result>0) {
				AlertMsg msg = new AlertMsg("근무시간 수정", "근무시간 수정이 성공적으로 완료되었습니다.");
				session.setAttribute("successMsg", msg);
				
				return "redirect:workingEmp.HR?no="+empNo;
			}else {
			
				AlertMsg msg = new AlertMsg("근무시간 수정", "근무시간 수정에 실패하였습니다.");
				session.setAttribute("failMsg", msg);
				
				return "redirect:workingEmp.HR?no="+empNo;
			}
		}
		
		//휴가관리(인사게정)
		@RequestMapping("vacList.HR")
		public ModelAndView selectVacList(ModelAndView mv, HttpSession session, @RequestParam(value="cpage", defaultValue="1")int currentPage) {
			
			int listCount = cService.selectListCount();
			
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
			ArrayList<Employee> list = cService.selectEmpList(pi);
			
			if(list != null) {
				mv.addObject("pi", pi).addObject("list", list).setViewName("vacation/vacationEmpList");
				
				return mv;
			}else {
				AlertMsg msg = new AlertMsg("휴가관리", "사원 휴가 조회에 실패하였습니다.");
				mv.addObject("failMsg", msg)
				  .setViewName("commute/HRworkingStatus");
				return mv;
			}
			
			
		}
		
		//휴가관리 수정 및 상세페이지
		@RequestMapping("updateVac.HR")
		public String updateVac(int no, HttpSession session) {
			int empNo = no;
			
			ArrayList<VacationRecode> list1 = cService.selectVacMain(empNo);
			ArrayList<VacationForm> list2 = cService.selectVacForm(empNo);
			Employee e = cService.selectEmployeeInformation(empNo);
			
			session.setAttribute("clickEmp", e);
			session.setAttribute("list1", list1);
			session.setAttribute("list2", list2);
			
			System.out.println(list1);
			System.out.println(list2);
			
			return "vacation/vacationUpdate";
			
		}
		
		@RequestMapping("insertRecode.vac")
		public String updateRecodeVac(VacationRecode vr, HttpSession session) {
			int result = cService.insertVacRecode(vr);
			
			if(result>0) {
				
			}else {
				
			}
			return "";
		}
		

}
