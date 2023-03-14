package com.ep.spring.reservation.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ep.spring.reservation.model.service.ReservationService;
import com.ep.spring.reservation.model.vo.Resource;

@Controller
public class ReservationController {

	@Autowired
	private ReservationService reService;
	
	@RequestMapping("main.re")
	public String mainReservation() {
		return "reservation/reservationMainView";
	}
	
	@RequestMapping("settingView.re")
	public String selectSettingMettingRoom(Model model) {
		/*
		ArrayList<Resource> list = reService.selectSettingMettingRoom();
		
		model.addAttribute("list", list);
		*/
		return "reservation/reservationSetting";
	}
	
	@RequestMapping("settingBeamView.re")
	public String settingReservationBeam() {
		return "reservation/reservationSettingBeamProjector";
	}
	
	@RequestMapping("resourceAddView.re")
	public String resourceAddView() {
		return "reservation/resourceAdd";
	}
	
	@RequestMapping("resourceAddMettingRoom.re")
	public String addMettingRoomResource(String category, String writer, Resource rsc, HttpSession session, Model model) {
		
		rsc.setCategoryName(category);
		rsc.setResourceWriter(writer);
		
		int result = reService.addMettingRoomResource(rsc);
		
		if(result > 0) {
			AlertMsg msg = new AlertMsg("자산 추가", "성공적으로 추가되었습니다");
			session.setAttribute("successMsg", msg);
			return "redirect:settingView.re";
		}
	}
}
