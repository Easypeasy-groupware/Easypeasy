package com.ep.spring.approval.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ep.spring.approval.model.service.ApprovalService;
import com.ep.spring.approval.model.vo.Approval;
import com.ep.spring.approval.model.vo.ApprovalLine;
import com.ep.spring.approval.model.vo.ApprovalReply;
import com.ep.spring.approval.model.vo.OverTimeForm;
import com.ep.spring.approval.model.vo.VacationForm;
import com.ep.spring.common.model.vo.AlertMsg;
import com.ep.spring.common.model.vo.Attachment;
import com.ep.spring.common.model.vo.PageInfo;
import com.ep.spring.common.template.FileUpload;
import com.ep.spring.common.template.Pagination;
import com.ep.spring.login.model.service.EmployeeService;
import com.ep.spring.login.model.vo.Department;
import com.ep.spring.login.model.vo.Employee;
import com.ep.spring.login.model.vo.Job;
import com.ep.spring.organization.model.service.OrgService;
import com.google.gson.Gson;

@Controller
public class ApprovalController {
	
	@Autowired
	private ApprovalService aService;
	
	@Autowired
	private OrgService oService;
	
	@Autowired
	private EmployeeService eService;
	
	@RequestMapping("main.ap")
	public String selectAppMain(HttpSession session, Model model) {
		
		int eNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		ArrayList<Approval> list1 = aService.selectMainWList(eNo);
		
		ArrayList<Approval> list2 = aService.selectMainSList(eNo);
		
		model.addAttribute("list1", list1);
		model.addAttribute("list2", list2);
				
		ArrayList<Employee> list = oService.selectOrgList(eNo);
		ArrayList<Department> deptList = oService.selectDept();
		ArrayList<Job> jList = oService.selectJob();
		
		session.setAttribute("list", list);
		session.setAttribute("deptList", deptList);
		session.setAttribute("jList", jList);
		
		return "approval/appMain";
	}
	
	@ResponseBody
	@RequestMapping(value="recent.ap", produces="application/json; charset=UTF-8")
	public String selectRecentApp(HttpSession session, Model model) {
		
		int eNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		ArrayList<Approval> list1 = aService.selectMainWList(eNo);
		ArrayList<Approval> list2 = aService.selectMainSList(eNo);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("list1", list1);
		map.put("list2", list2);
		
		return new Gson().toJson(map);
	}
	
	@RequestMapping("enrollForm.ap")
	public String enrollForm(int formCode, Model model, HttpSession session) {
		
		
		int no = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		/*
		ArrayList<Employee> list = oService.selectOrgList(no);
		ArrayList<Department> deptList = oService.selectDept();
		ArrayList<Job> jList = oService.selectJob();
		
		System.out.println(list);
		System.out.println(deptList);
		System.out.println(jList);
		
		model.addAttribute("list", list);
		model.addAttribute("deptList", deptList);
		model.addAttribute("jList", jList);*/
		
		if(formCode == 1) {
			return "approval/appDraftEnrollForm";
		}else if(formCode == 2) {
			return "approval/appProposalEnrollForm";
		}else if(formCode == 3) {
			return "approval/appVacationEnrollForm";
		}else if(formCode == 4) {
			return "approval/appOvertimeEnrollForm";
		}else {
			session.setAttribute("alertMsg", "페이지 요청오류");
			return "redirect:/";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="enrollinfo.ap", produces="application/json; charset=UTF-8")
	public String selectInfoDraft(HttpSession session, Model model) {
		
		String currentTime = new SimpleDateFormat("yyMMdd").format(new Date());
		// 4자리랜덤숫자
		int ranNum = (int)(Math.random() * 9000 + 1000);
		String appChange = currentTime + ranNum;
			
		int eNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		Employee a = aService.selectEnrollInfo(eNo); 

		HashMap<String, Object> map = new HashMap<>();
		map.put("a", a);
		map.put("appChange", appChange);
		return new Gson().toJson(map);
		
	}
	
	@RequestMapping("recWlist.ap")
	public String selectRecWList(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, Model model) {
		
		int eNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		int listCount = aService.selectWaitingAListCount(eNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Approval> list = aService.selectWatingAList(pi, eNo);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);

		return "approval/appRecWatingListView";
	}
	
	@RequestMapping("refWlist.ap")
	public String selectRefWList(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, Model model) {
		
		int eNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		int listCount = aService.selectWaitingRListCount(eNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Approval> list = aService.selectWaitingRList(pi, eNo);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		
		return "approval/appRefWatingListView";
	}
	
	@RequestMapping("sendList.ap")
	public String selectSendList(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, Model model) {
		
		int eNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		int listCount = aService.selectSendListCount(eNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Approval> list = aService.selectSendList(pi, eNo);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "approval/appSendListView";
	}
	
	@RequestMapping("statusList.ap")
	public String selectSendLists(@RequestParam(value="cpage", defaultValue="1") int currentPage, Approval a, HttpSession session, Model model) {
		
		int eNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		
		if(a.getListType().equals("s")) {
			a.setWriterNo(eNo);
			return "";
		}else {
			return "";
		}
		
		
		
		
	}
	
	@RequestMapping("tempList.ap")
	public String selectTempList(@RequestParam(value="cpage", defaultValue="1")int currentPage, HttpSession session, Model model) {
		int eNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		int listCount = aService.selectTempListCount(eNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Approval> list = aService.selectTempList(pi, eNo);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "approval/appTempStorListView";
	}
	
	@RequestMapping("recList.ap")
	public String selectRecList(@RequestParam(value="cpage", defaultValue="1")int currentPage, HttpSession session, Model model) {
		int eNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		int listCount = aService.selectRecListCount(eNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Approval> list = aService.selectRecList(pi, eNo);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "approval/appRecListView";
	}
	
	@RequestMapping("refList.ap")
	public String selectRefList(@RequestParam(value="cpage", defaultValue="1")int currentPage, HttpSession session, Model model) {
		int eNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		int listCount = aService.selectRefListCount(eNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Approval> list = aService.selectRefList(pi, eNo);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "approval/appRefListView";
	}
	
	@RequestMapping("dSendList.ap")
	public String selectDeptSendList(@RequestParam(value="cpage", defaultValue="1")int currentPage, HttpSession session, Model model) {
		int eNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		int listCount = aService.selectDeptSendListCount(eNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Approval> list = aService.selectDeptSendList(pi, eNo);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "approval/appDSendCompleteListView";
	}
	
	@RequestMapping("dRefList.ap")
	public String selectDeptRefList(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, Model model) {
		int eNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		int listCount = aService.selectDeptRefListCount(eNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Approval> list= aService.selectDeptRefList(pi, eNo);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "approval/appDRefListView";
	}
	
	@RequestMapping("detailSPrg.ap")
	public String selectDetailSPrg(@RequestParam(value="no") int appNo, @RequestParam(value="form") String formName,
								@RequestParam(value="st")String st, HttpSession session, Model model) {
		int eNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		
		
		Approval a = new Approval();
		a.setAppNo(appNo);
		a.setFormName(formName);
		
		
		if(st.equals("기안진행")) {
			a.setTstatus("진행중");
		}
		
		if(st.equals("부서기안완료")) {
			a.setSt("부서기안완료");
			a.setTstatus("결재");
		}else {
			a.setWriterNo(eNo);
		}
		
		//System.out.println(a);
		Approval ap = aService.selectDetailSPrgAp(a);
		
		
		
		ArrayList<ApprovalLine> list1 = aService.selectDetailSPrgAl(a);
		ArrayList<Attachment> list3 = aService.selectDetailSPrgAt(a);
		
		model.addAttribute("ap", ap);
		model.addAttribute("list1", list1);
		model.addAttribute("list3", list3);


		if(a.getFormName().equals("업무기안")) {
			
			return "approval/appDraftDetailView";
			
		}else if(a.getFormName().equals("일반품의서")) {
			
			return"approval/appProposalDetailView";
			
		}else if(a.getFormName().equals("휴가신청서")) {
			
			VacationForm vf = aService.selectDetailSPrgVf(a);
			model.addAttribute("vf", vf);
			return"approval/appVacationDetailView";
			
		}else if(a.getFormName().equals("연장근무신청서")) {
			
			OverTimeForm ot = aService.selectDetailSPrgOt(a);
			model.addAttribute("ot",ot);
			return"approval/appOvertimeDetailView";
			
		}else {
			session.setAttribute("alertMsg", "페이지 요청에 실패했습니다.");
			return"redirect:main.ap";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="rlist.ap", produces="application/json; charset=UTF-8")
	public String selectReplyList(@RequestParam(value="no") int appNo) {
		
		ArrayList<ApprovalReply> list = aService.selectReplyList(appNo);
		System.out.println(list);
		return new Gson().toJson(list); 
		
	}
	
	@ResponseBody
	@RequestMapping("rinsert.ap")
	public String insertReply(@RequestParam(value="replyContent") String content,
							@RequestParam(value="replyWriter") int writerNo,
							@RequestParam(value="appNo") int appNo) {
		ApprovalReply r = new ApprovalReply();
		r.setContent(content);
		r.setWriterNo(writerNo);
		r.setAppNo(appNo);
		int result = aService.insertReply(r);
		return result>0?"success" : "error";
	}
	
	@ResponseBody
	@RequestMapping("rdelete.ap")
	public String deleteReply(@RequestParam(value="no")int replyNo) {
		int result = aService.deleteReply(replyNo);
		return result>0?"success":"error";
	}
	
	@RequestMapping("delete.ap")
	public String deleteApproval(@RequestParam(value="no")int appNo, HttpSession session, ArrayList<String> filePath) {
		

		int result = aService.deleteApproval(appNo);
		
		//System.out.println(result);
		
		if(result > 0) {
				for(int i= 0; i < filePath.size(); i++) {
					if(!filePath.get(i).equals("")) {
					new File(session.getServletContext().getRealPath(filePath.get(i))).delete();
				}
			}

			AlertMsg msg = new AlertMsg("문서삭제", "성공적으로 삭제되었습니다");
			session.setAttribute("successMsg", msg);
			return "redirect:main.ap";
		}else {
			AlertMsg msg = new AlertMsg("문서삭제", "삭제에 실패했습니다.");
			session.setAttribute("failMsg", msg);
			return "redirect:main.ap";
		}
		
	}
	
	@RequestMapping("detailRec.ap")
	public String selectRecDetail(int no, String form, String st, HttpSession session, Model model) {
		int eNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		
		
		Approval a = new Approval();
		a.setAppNo(no);
		a.setFormName(form);
		a.setReceiverNo(eNo);
		
		if(st.equals("결재대기")) {
			a.setTstatus("진행중");
		}
		
		Approval ap = aService.selectDetailRec(a);
		
		if(st.equals("참조대기")) {
			ap.setSt("참조대기");
			
			int result = aService.updateCount(a);
			
			if(result < 0) {
				AlertMsg msg = new AlertMsg("페이지 요청실패", "페이지요청에 실패했습니다.");
				session.setAttribute("failMsg", msg);
				return"redirect:main.ap";
			}
			
		}else if(st.equals("참조전체")) {
			ap.setSt("참조전체");
		}else if(st.equals("부서참조")) {
			ap.setSt("부서참조");
		}
		
		
		ArrayList<ApprovalLine> list1 = aService.selectDetailSPrgAl(a);
		ArrayList<Attachment> list3 = aService.selectDetailSPrgAt(a);
		
		model.addAttribute("ap", ap);
		model.addAttribute("list1", list1);
		model.addAttribute("list3", list3);

		
		if(a.getFormName().equals("업무기안")) {
			
			return "approval/appDraftDetailView";
			
		}else if(a.getFormName().equals("일반품의서")) {
			
			return"approval/appProposalDetailView";
			
		}else if(a.getFormName().equals("휴가신청서")) {
			
			VacationForm vf = aService.selectDetailSPrgVf(a);
			model.addAttribute("vf", vf);
			return"approval/appVacationDetailView";
			
		}else if(a.getFormName().equals("연장근무신청서")) {
			
			OverTimeForm ot = aService.selectDetailSPrgOt(a);
			model.addAttribute("ot",ot);
			return"approval/appOvertimeDetailView";
			
		}else {
			AlertMsg msg = new AlertMsg("페이지 요청실패", "페이지요청에 실패했습니다.");
			session.setAttribute("failMsg", msg);
			return"redirect:main.ap";
		}
		
	}
	
	@RequestMapping("insert.ap")
	public String insertApproval(HttpSession session, Model model, List<MultipartFile> originNames, 
								 Approval ap, VacationForm vf, OverTimeForm ot) {
		//System.out.println(ap);
		System.out.println(originNames);
		
		ap.setWriterNo(((Employee)session.getAttribute("loginUser")).getEmpNo());
		if(ap.getFormCode() == 3 || ap.getFormCode() == 4) {
			ap.setTitle(ap.getFormName());
			ap.setConPeriod(3);
			ap.setSecGrade("B");
		}else {
			ap.setConPeriod(5);
			ap.setSecGrade("A");
		}
		
		//System.out.println(ap);
		
		// 결재자 ApprovalLine에 담기
		
		
		
		ap.setAppSequence(1);
		
		
		ArrayList<ApprovalLine> al = new ArrayList<>();
		if(ap.getAlList() != null) {
			ap.setAppAmount(ap.getAlList().size());
			for(int i = 0; i< ap.getAlList().size(); i++) {
				
				ap.getAlList();
				al.add(i, ap.getAlList().get(i));
				al.get(i).setRefWhether("N");
			}
		}
		
		// 참조자 ApprovalLine에 담기
		int num = 0;
		if(ap.getRefList() != null) {
			for(int j = ap.getAlList().size(); j< (ap.getAlList().size() + ap.getRefList().size()); j++) {
				al.add(j, ap.getRefList().get(num));
				al.get(j).setRefWhether("Y");
				num++;
			}
		}
		
		//System.out.println(al);
		
		// 휴가작성폼 셋팅하기
		if(vf.getHalfOption() != null){
			if(vf.getHalfOption().equals("start")) {
				vf.setHalfDay(vf.getVacStart());
			}else {
				vf.setHalfDay(vf.getVacEnd());
			}
		}
		
		//System.out.println(vf);
		
		
		// 첨부파일 처리하기
		
		ArrayList <Attachment> atList = new ArrayList<>();
		
		
		if(originNames.size() > 1) {
			String path = "resources/approval_attachFiles/";
			
			
			for(MultipartFile mf : originNames) {
				Attachment at = new Attachment();
				String originName = mf.getOriginalFilename();
				String saveFilePath = FileUpload.saveFile(mf, session, path);
				String[] changeNameArr = saveFilePath.split("/");
				String changeName = changeNameArr[2];
				at.setOriginName(originName);
				at.setChangeName(changeName);
				at.setFilePath(saveFilePath);
				atList.add(at);
			}
			
		}
		
		int result = aService.insertApproval(ap, al, vf, ot, atList);
		
		System.out.println(atList);
		
		if(result > 0) {
			
			AlertMsg msg = new AlertMsg("결재상신", "성공적으로 문서상신 완료되었습니다!");
			//System.out.println("status : " + ap.getStatus());
			if(ap.getStatus().equals("2")) {
				msg.setTitle("임시저장");
				msg.setContent("성공적으로 임시저장 되었습니다!");
			}
			session.setAttribute("successMsg", msg);
			return "redirect:main.ap";			
		}else {
			AlertMsg msg = new AlertMsg("상신실패", "문서 상신에 실패했습니다.");
			if(ap.getStatus().equals("2")) {
				msg.setTitle("임시저장");
				msg.setContent("임시저장에 실패했습니다.");
			}
			session.setAttribute("failMsg", msg);
			return "redirect:main.ap";
		}
		
	}
	
	@RequestMapping("updateco.ap")
	public String updateAppLine(HttpSession session, ApprovalLine al) {
		
		//System.out.println(al);
		int eNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		al.setRecEmpNo(eNo);
		
		int result = aService.updateAppLine(al);
		
		if(result > 0) {
			AlertMsg msg = new AlertMsg("의견등록성공", "의견등록에 성공했습니다!");
			session.setAttribute("successMsg", msg);
			return "redirect:recWlist.ap";	
		}else {
			AlertMsg msg = new AlertMsg("의견등록실패", "의견등록에 실패했습니다.");
			session.setAttribute("failMsg", msg);
			return "redirect:recWlist.ap";	
		}
		
	}
	
	@RequestMapping("updateForm.ap")
	public String updateForm(int no, ArrayList<Attachment> filePath, int division, Model model, HttpSession session) {

		Approval ap = aService.selectTempApproval(no);
		// 재기안인지 수정인지 구분하는 값 세팅해주기
		
		System.out.println("재기안일까요 수정일까요?" + division);
		ap.setDivision(division);

		System.out.println("화면에 돌려줄 재기안/수정값?" + ap.getDivision());
		System.out.println(ap);
		model.addAttribute("ap", ap);	
		
		ArrayList<ApprovalLine> list1 = aService.selectDetailSPrgAl(ap);
		model.addAttribute("list1", list1);	
		
		ArrayList<ApprovalLine> list2 = aService.selectDetailSPrgRl(ap);
		model.addAttribute("list2", list2);
		
		ArrayList<Attachment> list3 = aService.selectDetailSPrgAt(ap);
		model.addAttribute("list3", list3);
		System.out.println("업데이트폼에서 보낼 기존 첨부파일 : " + list3);
		
		
		if(ap.getFormCode() == 1) {
			
			return "approval/appDraftUpdateForm";
			
		}else if(ap.getFormCode() == 2) {
			
			return "approval/appProposalUpdateForm";
			
		}else if(ap.getFormCode() == 3) {
			
			VacationForm vf = aService.selectDetailSPrgVf(ap);
			model.addAttribute("vf", vf);
			return "approval/appVacationUpdateForm";
			
		}else {
			OverTimeForm ot = aService.selectDetailSPrgOt(ap);
			model.addAttribute("ot", ot);
			return "approval/appOvertimeUpdateForm";			
		}	

	}
	
	@RequestMapping("update.ap")
	public String updateApproval(HttpSession session, Model model, List<MultipartFile> originNames, 
								 Approval ap, VacationForm vf, OverTimeForm ot) {
		//System.out.println(ap);
		System.out.println("넘어온 파일 : " + originNames);
		
		
		/*
		 * 
		 * 
		 * 1. 새로 첨부된 파일이 없을 경우, 기존 첨부파일 x
		 * 		=> originName : null, changeName, null
		 * 
		 * 2. 새로 첨부된 차일 없을 경우, 기존 첨부파일 o
		 * 		=> originName : 기존첨부파일 원본명, changeName : 기존첨부파일 원본명
		 * 
		 * 3. 새로 첨부된 파일 o, 기존 첨부파일 x 
		 * 		=> 새로 전달된 파일 서버에 업로드
		 * 		=> originName : 새로운 첨부파일원본명, changeName : 새로운첨부파일저장경로
		 * 
		 * 4. 새로 첨부된 파일 o, 기존첨부파일 o
		 * 		=> 기존 파일 삭제
		 * 		=> 새로 전달된 파일 서버에 업로드
		 * 		=> originName : 새로운 첨부파일원본명, changeName : 새로운첨부파일저장경로 
		 */
		

		// 첨부파일 처리하기
		
		ArrayList <Attachment> atList = new ArrayList<>();
		
		if(originNames.size() > 0) {
			
			// 기존 첨부파일이 있었을 경우 => 기존의 파일 지우기
			ArrayList<Attachment> list =  aService.selectDetailSPrgAt(ap);
			System.out.println("기존의 지울 첨부파일 : " + list);
			
			if(list.size() > 0) {
				
				for(Attachment t : list){
					new File(session.getServletContext().getRealPath(t.getFilePath())).delete();
				}
			}
			
			String path = "resources/approval_attachFiles/";
			
			for(MultipartFile mf : originNames) {
				
				Attachment at = new Attachment();
				String originName = mf.getOriginalFilename();
				String saveFilePath = FileUpload.saveFile(mf, session, path);
				String[] changeNameArr = saveFilePath.split("/");
				String changeName = changeNameArr[2];
				at.setOriginName(originName);
				at.setChangeName(changeName);
				at.setFilePath(saveFilePath);
				System.out.println("추가할 하나하나의 첨부파일 : " + at);
				atList.add(at);
				
			}
			
		}

		
		
		
		ap.setWriterNo(((Employee)session.getAttribute("loginUser")).getEmpNo());
		if(ap.getFormCode() == 3 || ap.getFormCode() == 4) {
			ap.setTitle(ap.getFormName());
			ap.setConPeriod(3);
			ap.setSecGrade("B");
		}else {
			ap.setConPeriod(5);
			ap.setSecGrade("A");
		}
		
		//System.out.println(ap);
		
		// 결재자 ApprovalLine에 담기
		
		
		ArrayList<ApprovalLine> al = new ArrayList<>();
		if(ap.getAlList() != null) {

			ap.setAppSequence(1);
			ap.setAppAmount(ap.getAlList().size());
			
			for(int i = 0; i< ap.getAlList().size(); i++) {
				ap.getAlList();
				al.add(i, ap.getAlList().get(i));
				al.get(i).setRefWhether("N");
				al.get(i).setAppNo(ap.getAppNo());
			}
		}
		
		// 참조자 ApprovalLine에 담기
		int num = 0;
		if(ap.getRefList() != null) {
			for(int j = ap.getAlList().size(); j< (ap.getAlList().size() + ap.getRefList().size()); j++) {
				al.add(j, ap.getRefList().get(num));
				al.get(j).setRefWhether("Y");
				al.get(j).setAppNo(ap.getAppNo());
				num++;
			}
		}
		
		//System.out.println(al);
		
		// 휴가작성폼 셋팅하기
		if(vf.getHalfOption() != null){
			if(vf.getHalfOption().equals("start")) {
				vf.setHalfDay(vf.getVacStart());
				vf.setAppNo(ap.getAppNo());
			}else {
				vf.setHalfDay(vf.getVacEnd());
				vf.setAppNo(ap.getAppNo());
			}
		}
		
		//System.out.println(vf);
		
				
		int result = aService.updateApproval(ap, al, vf, ot, atList);
		
		if(result > 0) {
			System.out.println("최종 담은 첨부 : " + atList);
			AlertMsg msg = new AlertMsg("결재상신", "성공적으로 문서상신 완료되었습니다!");
			session.setAttribute("successMsg", msg);
			return "redirect:main.ap";			
		}else {
			AlertMsg msg = new AlertMsg("상신실패", "문서 상신에 실패했습니다.");
			session.setAttribute("failMsg", msg);
			return "redirect:main.ap";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="search.ap", produces="application/json; charset=UTF-8")
	public String selectSearchList(Approval a, @RequestParam(value="cpage", defaultValue="1") int currentPage, Model model, HttpSession session) {
		
		int eNo = ((Employee)session.getAttribute("loginUser")).getEmpNo();
		a.setWriterNo(eNo);
		int listCount = aService.selectSearchListCount(a);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Approval> sList = aService.selectSearchList(a, pi);
		
		System.out.println(a);
		System.out.println(listCount);
		System.out.println(sList);
		System.out.println(pi);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("sList", sList);
		map.put("spi", pi);
		map.put("sListCount", listCount);
		map.put("a", a);
		return new Gson().toJson(map);
	}
			
	

	
	
	/*
	@RequestMapping("search.ap")
	public String selectSearchList(@RequestParam("r-page") String rPage, @RequestParam("period") String period, 
									@RequestParam("option") String option, @RequestParam("keyword") String keyword, 
									@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, Model model) {
		
		String eNo = String.valueOf(((Employee)session.getAttribute("loginUser")).getEmpNo());
		HashMap<String, String> map = new HashMap<>();
		map.put("eNo", eNo);
		map.put("rPage", rPage);
		map.put("period", period);
		map.put("option", option);
		map.put("keyword", keyword);
		
		int listCount = aService.selectSearchListCount(map);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Approval> list = aService.selectSearchList(pi, map);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		if(rPage.equals("cw")) {
			return "approval/appRecWatingListView";
		}else if(rPage.equals("fw")) {
			return "approval/appRefWatingListView";
		}else if(rPage.equals("s")) {
			return "approval/appSendListView";
		}else if(rPage.equals("t")) {
			return "approval/appTempStorListView";
		}else if(rPage.equals("c")) {
			return "approval/appRecListView";
		}else if(rPage.equals("f")) {
			return "approval/appRefListView";
		}else if(rPage.equals("ds")) {
			return "approval/appDSendCompleteListView";
		}else {
			return "approval/appDRefListView";
		}
		
		
	}
	*/
	
	
	

}
