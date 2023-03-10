package com.ep.spring.login.controller;

import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
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
		
		return "login/myPageView";
	}
	
	//마이페이지 정보수정
	@RequestMapping("updateMP.ep")
	public String updateMyPage() {
		return "login/myPageUpdateForm";
	}
	

}
