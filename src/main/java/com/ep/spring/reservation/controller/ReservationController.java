package com.ep.spring.reservation.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ep.spring.common.model.vo.AlertMsg;
import com.ep.spring.reservation.model.service.ReservationService;
import com.ep.spring.reservation.model.vo.Resource;

@Controller
public class ReservationController {

	@Autowired
	private ReservationService reService;
	
	@RequestMapping("main.re")
	public String mainReservation(HttpSession session) {
		ArrayList<Resource> meList = reService.selectSettingMettingRoom();
		//System.out.println(list);
		session.setAttribute("meList", meList);
		
		ArrayList<Resource> beList = reService.selectSettingBeamProjector();
		session.setAttribute("beList", beList);
		
		return "reservation/reservationMainView";
	}
	
	@RequestMapping("beamProjectorMain.re")
	public String beamMainReservation(HttpSession session) {
		
		ArrayList<Resource> beList = reService.selectSettingBeamProjector();
		session.setAttribute("beList", beList);
		
		return "reservation/reservationMainBeamView";
	}
	
	@RequestMapping("settingMettingRoomView.re")
	public String selectSettingMettingRoom(HttpSession session) {
		
		ArrayList<Resource> meList = reService.selectSettingMettingRoom();
		session.setAttribute("meList", meList);
		
		return "reservation/reservationSettingMettingRoom";
	}
	
	@RequestMapping("settingBeamProjectView.re")
	public String settingReservationBeam() {
		return "reservation/reservationSettingBeamProjector";
	}
	
	@RequestMapping("resourceAddMettingRoomView.re")
	public String resourceAddMettingRoomView() {
		return "reservation/resourceAddMettingRoom";
	}
	
	@RequestMapping("resourceAddMettingRoom.re")
	public String addMettingRoomResource(Resource rsc, HttpSession session, Model model) {
		
		int result = reService.addMettingRoomResource(rsc);
		
		if(result > 0) {
			AlertMsg msg = new AlertMsg("자산 추가", "성공적으로 추가되었습니다");
			session.setAttribute("successMsg", msg);
			model.addAttribute("rsc", rsc);
			return "redirect:settingMettingRoomView.re";
		}else {
			AlertMsg msg = new AlertMsg("자산 추가", "자산 추가 실패");
			session.setAttribute("failMsg", msg);
			return "redirect:settingMettingRoomView.re";
		}
	}
	
	@RequestMapping("upDelMettingRoom.re")
	public String upDelMettingRoom(int mno, String mname, Model model) {
		
		model.addAttribute("mno", mno);
		model.addAttribute("mname", mname);
		return "reservation/reservationSettingMettingRoomUpdel";
	}
	
	@RequestMapping("mettingRoomUp.re")
	public String mettingRoomUpdate(Resource rsc, HttpSession session) {
		
		//System.out.println(rsc);
		
		int result = reService.mettingRoomUpdate(rsc);
		
		if(result > 0) {
			AlertMsg msg = new AlertMsg("자산 수정", "성공적으로 수정되었습니다");
			session.setAttribute("successMsg", msg);
			return "redirect:settingMettingRoomView.re";
		}else {
			AlertMsg msg = new AlertMsg("자산 수정", "자산 수정 실패");
			session.setAttribute("failMsg", msg);
			return "redirect:settingMettingRoomView.re";
		}
		
	}
	
	@RequestMapping("mettingRoomDel.re")
	public String mettingRoomDelete(int mno, HttpSession session) {

		int result = reService.mettingRoomDelete(mno);
		
		if(result > 0) {
			AlertMsg msg = new AlertMsg("자산 삭제", "성공적으로 삭제되었습니다");
			session.setAttribute("successMsg", msg);
			return "redirect:settingMettingRoomView.re";
		}else {
			AlertMsg msg = new AlertMsg("자산 삭제", "자산 삭제 실패");
			session.setAttribute("failMsg", msg);
			return "redirect:settingMettingRoomView.re";
		}
		
	}
	
	// 빔프
	@RequestMapping("settingBeamProjectorView.re")
	public String selectSettingBeamProjector(HttpSession session) {
		
		ArrayList<Resource> beList = reService.selectSettingBeamProjector();
		session.setAttribute("beList", beList);
		
		return "reservation/reservationSettingBeamProjector";
	}
	
	@RequestMapping("resourceAddBeamProjectorView.re")
	public String resourceAddBeamProjectorView() {
		return "reservation/resourceAddBeamProjector";
	}
	
	@RequestMapping("resourceAddBeamProjector.re")
	public String addBeamProjectorResource(Resource rsc, HttpSession session, Model model) {
		
		int result = reService.addBeamProjectorResource(rsc);
		
		if(result > 0) {
			AlertMsg msg = new AlertMsg("자산 추가", "성공적으로 추가되었습니다");
			session.setAttribute("successMsg", msg);
			model.addAttribute("rsc", rsc);
			return "redirect:settingBeamProjectorView.re";
		}else {
			AlertMsg msg = new AlertMsg("자산 추가", "자산 추가 실패");
			session.setAttribute("failMsg", msg);
			return "redirect:settingBeamProjectorView.re";
		}
	}
	
	@RequestMapping("upDelBeamProjector.re")
	public String upDelBeamProjector(int bno, String bname, Model model) {
		
		model.addAttribute("bno", bno);
		model.addAttribute("bname", bname);
		return "reservation/reservationSettingBeamProjectorUpdel";
	}
	
	@RequestMapping("BeamProjectorUp.re")
	public String BeamProjectorUpdate(Resource rsc, HttpSession session) {
		
		//System.out.println(rsc);
		
		int result = reService.BeamProjectorUpdate(rsc);
		
		if(result > 0) {
			AlertMsg msg = new AlertMsg("자산 수정", "성공적으로 수정되었습니다");
			session.setAttribute("successMsg", msg);
			return "redirect:settingBeamProjectorView.re";
		}else {
			AlertMsg msg = new AlertMsg("자산 수정", "자산 수정 실패");
			session.setAttribute("failMsg", msg);
			return "redirect:settingBeamProjectorView.re";
		}
		
	}
	
	@RequestMapping("BeamProjectorDel.re")
	public String BeamProjectorDelete(int bno, HttpSession session) {

		int result = reService.BeamProjectorDelete(bno);
		
		if(result > 0) {
			AlertMsg msg = new AlertMsg("자산 삭제", "성공적으로 삭제되었습니다");
			session.setAttribute("successMsg", msg);
			return "redirect:settingBeamProjectorView.re";
		}else {
			AlertMsg msg = new AlertMsg("자산 삭제", "자산 삭제 실패");
			session.setAttribute("failMsg", msg);
			return "redirect:settingBeamProjectorView.re";
		}
		
	}
	
	@RequestMapping("beamProjector.re")
	public String selectBeamProjector() {

		return "reservation/reservationBeamProjector";
	}
	
	@RequestMapping("mettingRoom.re")
	public String selectMettingRoom() {

		return "reservation/reservationMettingRoom";
	}
	
	
}
