package com.ep.spring.login.controller;

import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ep.spring.login.model.service.EmployeeService;
import com.ep.spring.login.model.vo.Employee;

import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;

@Controller
public class EmployeeController {
	
	@Autowired
	private EmployeeService eService;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	//로그인
	@RequestMapping("login.ep")
	public String loginEmployee(Employee e, HttpSession session) {
		
		Employee loginUser = eService.loginEmployee(e);
		
		if(loginUser == null) {//로그인실패
			session.setAttribute("alertMsg", "로그인에 실패했습니다. 다시 시도 해주세요.");
			return "redirect:/";
		}else {//로그인성공
			session.setAttribute("loginUser", loginUser);
			return "common/main";
		}
		
	}
	
	// 메인페이지 이동
	@RequestMapping("main.ep")
	public String mainPage() {
		return "common/main";
	}
	
	//아이디 찾기 폼 응답
	@RequestMapping("findIdForm.ep")
	public String findIdForm() {
		return "login/searchIdForm";
	}
	
	//아이디찾기 문자인증
	@RequestMapping("findId.ep")
	public String findId(Employee e, HttpSession session) {
		int result = eService.findId(e);
		
		if(result>0) {//회원정보 일치 => 인증번호 발송 => 인증번호 확인
			
			return "redirect:/";
			
		}else {//회원정보 불일지 => 다시 입력
			session.setAttribute("alertMsg", "등록되지 않은 회원정보입니다. 다시 입력해주세요.");
			return "redirect:/";
		}
		
	}
	
	//비밀번호찾기 폼 응답
	@RequestMapping("findPwdForm.ep")
	public String findPwdForm() {
		return "login/searchPwdForm";
	}
	
	//마이페이지
	@RequestMapping("myPage.ep")
	public String selectEmployee(Employee e) {
		
		return "login/myPageUpdateForm";
	}
	
	
	/*
	 
	@RequestMapping("updateForm.mp")
	public String updateMyPage() {
		return "login/myPageUpdateForm";
		
	}
	 */
	
	//마이페이지 정보수정
	@RequestMapping("update.mp")
	public String updateEmployee(Employee e, HttpSession session) {
		int result = eService.updateEmployee(e);
		
		if(result>0) {//정보수정 성공
			Employee updateUser = eService.loginEmployee(e);
			session.setAttribute("loginUser", updateUser);
			session.setAttribute("alertMsg", "정보 수정이 완료되었습니다.");
			
			return "redirect:myPage.ep";
		}else {//정보수정 실패
			session.setAttribute("alertMsg", "수정에 실패했습니다. 다시 시도해주세요.");
			
			return "redirect:myPage.ep";
		}
	}
	
	//비밀번호 수정
	@RequestMapping("updatePwd.ep")
	public String updatePwd(String empPwd, String updatePwd, String empId, HttpSession session, Employee e) {
		
		//비번 일치 확인
				//입력한 비번 : userPwd
				//조회된 비번 : encPwd
				String encPwd = ((Employee)session.getAttribute("loginUser")).getEmpPwd();
				
				if(bcryptPasswordEncoder.matches(empPwd, encPwd)) {//비번일치
					//바꿀 비번 암호화
					String encPwd2 = bcryptPasswordEncoder.encode(updatePwd);
					e.setEmpPwd(encPwd2);
					e.setEmpId(empId);
					
					int result = eService.updatePwd(e);
					
					if(result>0) {//변경성공
						
						Employee updateUser = eService.loginEmployee(e);
						session.setAttribute("loginUser", updateUser);
						session.setAttribute("alertMsg", "비밀번호 변경이 완료되었습니다");
						
						return "redirect:myPage.ep";
						
					}else {//변경실패
						
						session.setAttribute("alertMsg", "비밀번호 변경을 실패하였습니다");
						return "redirect:myPage.ep";
						
					}
					
					
				}else {//비번틀림
					session.setAttribute("alertMsg", "비밀번호를 잘못 입력하셨습니다");
					return "redirect:myPage.ep";
				}
	}
	

}
