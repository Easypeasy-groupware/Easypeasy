package com.ep.spring.login.controller;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ep.spring.address.model.service.AddressService;
import com.ep.spring.address.model.vo.AddGroup;
import com.ep.spring.common.template.FileUpload;
import com.ep.spring.login.model.service.EmployeeService;
import com.ep.spring.login.model.vo.Employee;

@Controller
public class EmployeeController {
	
	@Autowired
	private EmployeeService eService;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private AddressService aService;
	
	//로그인
	@RequestMapping("login.ep")
	public String loginEmployee(Employee e, HttpSession session) {
		
		//로그인
		Employee loginUser = eService.loginEmployee(e);
		
		// 로그인한 사원이 등록한 연락처그룹 리스트 조회
		ArrayList<AddGroup> userGroup = aService.selectPersonalAddGroup(e);
		// 공용외부주소록 그룹리스트 조회
		ArrayList<AddGroup> sharedGroup = aService.selectSharedAddGroup();
		
		
		
		if(loginUser == null) {//로그인실패
			session.setAttribute("alertMsg", "로그인에 실패했습니다. 다시 시도 해주세요.");
			return "redirect:/";
		}else {//로그인성공
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("pList", userGroup); //로그인한 사원의 주소록 그룹리스트 세션에 저장
			session.setAttribute("sList", sharedGroup); //외부 공유주소록 그룹리스트 세션에 저장
			
			
			//암호화 작업 (암호문을 만들어내는 과정)
			//System.out.println("평문 : " + m.getUserPwd());
			String encPwd = bcryptPasswordEncoder.encode(e.getEmpPwd());
			System.out.println("암호문 : " + encPwd);
			
			
			return "common/main";
		}
			
		/*
		if(loginUser != null && bcryptPasswordEncoder.matches(e.getEmpPwd(), loginUser.getEmpPwd())) { // 성공
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("pList", userGroup); //로그인한 사원의 주소록 그룹리스트 세션에 저장
			session.setAttribute("sList", sharedGroup); //외부 공유주소록 그룹리스트 세션에 저장
			return "common/main";
		}else { // 실패
			session.setAttribute("alertMsg", "로그인에 실패했습니다. 다시 시도 해주세요.");
			return "redirect:/";
		}
		*/
		
	}
	
	//로그아웃
	@RequestMapping("logout.ep")
	public String logoutMember(HttpSession session) {
		//세션무효화
		session.invalidate();
		return "redirect:/";
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
//	@RequestMapping("findId.ep")
//	public String findId(Employee e, HttpSession session) {
//		Employee findUser = eService.findId(e);
//		
//		if( findUser!=null ) {//회원정보 일치 => 인증번호 발송 => 인증번호 확인
//			String api_key = "NCSTWMDK6G5I0GKQ";      
//		    String api_secret = "5JVRA0L8LQQH3R44H8FERHGITQY5ZYPV";        
//		    Message coolsms = new Message(api_key, api_secret);
//
//		    Random rd = new Random();
//			int ranCode = rd.nextInt(899999)+100000;
//			
//		    HashMap<String, String> params = new HashMap<String, String>();
//		    params.put("to", m.getPhone());
//		    params.put("from", "01084162654");          
//		    params.put("type", "SMS");
//		    params.put("text", "[합플] 아이디찾기 인증번호 : " + ranCode);     //메시지 내용
//		    params.put("app_version", "test app 1.2");
//
//		    try {
//		      JSONObject obj = (JSONObject) coolsms.send(params);
//		      //System.out.println(obj.toString());   //전송 결과 출력 
//		    } catch (CoolsmsException e) {
//		      System.out.println(e.getMessage());
//		      System.out.println(e.getCode());
//		    }
//		    
//		    // 랜덤숫자와 아이디리턴
//		    JSONObject jObj = new JSONObject();
//		    
//		    jObj.put("key", ranCode);
//            jObj.put("memId", m.getMemId());
//            
//            response.setContentType("application/json; charset=UTF-8");
//    		response.getWriter().print(jObj);
//			return "redirect:/";
//			
//		}else {//회원정보 불일지 => 다시 입력
//			session.setAttribute("alertMsg", "등록되지 않은 회원정보입니다. 다시 입력해주세요.");
//			return "redirect:/";
//		}
//		
//	}
	
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
					
					System.out.println(encPwd2);
					
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
	
	//프로필 사진변경
	@ResponseBody
	@RequestMapping("uploadProfile.me")
	public void updateProfile(MultipartFile uploadFile, Employee e, 
			String originalFile, HttpSession session) {
		
		System.out.println(uploadFile);
		if(uploadFile != null) {
			String saveFilePath = FileUpload.saveFile(uploadFile, session, "resources/profile_images/");
			e.setEmpProfile(saveFilePath);
			int result = eService.updateProfile(e);
			
			if(result>0) {// 변경성공
				if(!originalFile.equals("")) {
					new File(session.getServletContext().getRealPath(originalFile)).delete(); //기존의 파일 삭제
				}
				session.setAttribute("loginUser", eService.loginEmployee(e));
				
			}
		}
		
	}
	
	//근태관리 메인페이지(일반사용자)
	@RequestMapping("commute.ep")
	public String commuteMainForm() {
		return "commute/commuteMain";
	}
	

}
