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
		ArrayList<Resource> list = reService.selectSettingMettingRoom();
		//System.out.println(list);
		session.setAttribute("list", list);
		
		return "reservation/reservationMainView";
	}
	
	@RequestMapping("settingMettingRoomView.re")
	public String selectSettingMettingRoom(HttpSession session) {
		
		ArrayList<Resource> list = reService.selectSettingMettingRoom();
		session.setAttribute("list", list);
		
		return "reservation/reservationSettingMettingRoom";
	}
	
	@RequestMapping("settingBeamProjectView.re")
	public String settingReservationBeam() {
		return "reservation/reservationSettingBeamProjector";
	}
	
	@RequestMapping("resourceAddMettingRoomView.re")
	public String resourceAddView() {
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
			AlertMsg msg = new AlertMsg("주소록 추가", "주소록추가 실패");
			session.setAttribute("failMsg", msg);
			return "redirect:settingMettingRoomView.re";
		}
	}
}
