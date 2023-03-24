package com.ep.spring.schedule.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ep.spring.common.model.vo.AlertMsg;
import com.ep.spring.login.model.vo.Department;
import com.ep.spring.login.model.vo.Employee;
import com.ep.spring.login.model.vo.Job;
import com.ep.spring.schedule.model.service.ScheduleService;
import com.ep.spring.schedule.model.vo.Attendee;
import com.ep.spring.schedule.model.vo.Calendar;
import com.ep.spring.schedule.model.vo.Schedule;
import com.google.gson.Gson;

@Controller
public class ScheduleController {

	@Autowired
	private ScheduleService scService;
	
	@Autowired
	private ScheduleService oService;
	
	@RequestMapping("main.sc")
	public String mainSchedule(HttpSession session) {
		
		int empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		ArrayList<Calendar> myCalList = scService.selectMyCalendar(empNo); 
		
		session.setAttribute("myCalList", myCalList);
		
		return "schedule/scheduleMainView";
	}
	
	@RequestMapping("insert.cal")
	public String insertCalendar(Calendar c, Model model, HttpSession session) {
		
		int result = scService.insertCalendar(c);
		
		if(result > 0) {
			model.addAttribute("c", c);
		}
		
		return "redirect:main.sc";
	}
	
	@RequestMapping("setting.sc")
	public String settingSchedule(HttpSession session) {
		
		int empNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		ArrayList<Calendar> myCalList = scService.selectMyCalendar(empNo); 
		
		session.setAttribute("myCalList", myCalList);
		
		return "schedule/scheduleSetting";
	}
	
	@RequestMapping("enrollForm.sc")
	public String scheduleEnrollForm() {
		
	
		return "schedule/scheduleEnrollForm";
	}
	
	
	@RequestMapping("insert.sc")
	public String insertSchedule(Schedule s, String empNo, Model model, HttpSession session) {
		
		
		if(s.getAllDay() == null) {
			s.setAllDay("N");
		}else {
			s.setAllDay("Y");
		}
		
		if(s.getScCompany() == null) {
			s.setScCompany("N");
		}else {
			s.setScCompany("Y");
		}
		
		if(s.getScCompany().equals("Y")) {
			s.setCalNo(0);
		}
		
		//System.out.println(s);
		//System.out.println(empNo);
		
		int result1 = scService.insertSchedule(s);
		
		if(result1 > 0) {
			
			if(empNo != null) {
				
				String empNoArr[] = empNo.split(",");
				ArrayList<Attendee> atList = new ArrayList<>();
				
				for(int i=0; i<empNoArr.length; i++) {
					Attendee a = new Attendee();
					a.setEmpNo(empNoArr[i]);
					atList.add(a);
					//System.out.println("a : " + a);
					//System.out.println("atList : " + atList);
					
					//System.out.println("atList.get(i) : " + atList.get(i));
				}
				
				int result2 = scService.insertAttendee(atList);

			}
			
			AlertMsg msg = new AlertMsg("일정 등록", "성공적으로 등록되었습니다");
			session.setAttribute("successMsg", msg);
			model.addAttribute("s", s);
			return "redirect:main.sc";
		}else {
			
			AlertMsg msg = new AlertMsg("일정 등록", "일정 등록 실패");
			session.setAttribute("failMsg", msg);
			return "redirect:main.sc";
		}
		
	}
	
	
	@RequestMapping("settingUpdel.cal")
	public String settingScheduleUpDel(int no, Model model) {
		
		Calendar cal = scService.selectCalendar(no);
		
		model.addAttribute("c", cal);
		
		return "schedule/scheduleSettingUpDel";
	}
	
	
	@RequestMapping("update.cal")
	public String settingScheduleUpdate(Calendar c, HttpSession session) {
		
		int result = scService.updateCalendar(c);
		
		if(result > 0) {
			AlertMsg msg = new AlertMsg("캘린더 수정", "성공적으로 수정되었습니다");
			session.setAttribute("successMsg", msg);
			return "redirect:setting.sc";
		}else {
			AlertMsg msg = new AlertMsg("캘린더 수정", "캘린더 수정 실패");
			session.setAttribute("failMsg", msg);
			return "redirect:setting.sc";
		}
		
	}
	
	@RequestMapping("delete.cal")
	public String settingScheduleDelete(int no, HttpSession session) {
		
		int result1 = scService.deleteSchedule(no);
		int result2 = scService.deleteCalendar(no);
		
		if(result1 > 0 && result2 > 0) {
			
			AlertMsg msg = new AlertMsg("캘린더 삭제", "성공적으로 삭제되었습니다");
			session.setAttribute("successMsg", msg);
			return "redirect:setting.sc";
			
		}else {
			AlertMsg msg = new AlertMsg("캘린더 삭제", "캘린더 삭제 실패");
			session.setAttribute("failMsg", msg);
			return "redirect:setting.sc";
		}
		
	}
	
	@RequestMapping("add.cal")
	public String settingScheduleAdd() {
		
		return "schedule/scheduleSettingCalendarAdd";
	}
	
	@RequestMapping("insertBtn.cal")
	public String insertCalendar(Calendar c, HttpSession session) {
		
		int result = scService.insertCalendar(c);
		
		if(result > 0) {
			AlertMsg msg = new AlertMsg("캘린더 추가", "성공적으로 등록되었습니다");
			session.setAttribute("successMsg", msg);
			return "redirect:setting.sc";
		}else {
			AlertMsg msg = new AlertMsg("캘린더 추가", "캘린더 추가 실패");
			session.setAttribute("failMsg", msg);
			return "redirect:setting.sc";
		}
		
	}
	
	@RequestMapping("selectSchedule.sc")
	public String selectSchedule(int no) {
		
		System.out.println(no);
		
		//ArrayList<Schedule> scList = scService.selectSchedule();

		return "";
	}
	
	@ResponseBody
	@RequestMapping(value="defaultUpdate.cal")
	public int defaultCalUpdate(int no, int dno, HttpSession session) {
		
		//System.out.println(no);
		//System.out.println(dno);
		
		int result1 = scService.defaultCalUpdate(no);
		int result2 = scService.defaultUpdate(dno);
		
		int result = result1*result2;
		
		return result;
		
	}

}
