package com.ep.spring.reservation.controller;


import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ep.spring.common.model.vo.AlertMsg;
import com.ep.spring.reservation.model.service.ReservationService;
import com.ep.spring.reservation.model.vo.Reservation;
import com.ep.spring.reservation.model.vo.Resource;

@Controller
public class ReservationController {

	@Autowired
	private ReservationService reService;
	
	@RequestMapping("main.re")
	public String mainReservation(HttpSession session) {
		ArrayList<Resource> meList = reService.selectSettingMettingRoom();
		//System.out.println(meList);
		session.setAttribute("meList", meList);
		
		ArrayList<Resource> beList = reService.selectSettingBeamProjector();
		session.setAttribute("beList", beList);
	

		ArrayList<Reservation> mList = reService.selectMettingRoom();
		session.setAttribute("mList", mList);
		
		ArrayList<Reservation> bList = reService.selectBeamProjector();
		session.setAttribute("bList", bList);
		
		return "reservation/reservationMainView";
	}
	
	@RequestMapping("beamProjectorMain.re")
	public String beamMainReservation(HttpSession session, Model model) {
		
		ArrayList<Resource> beList = reService.selectSettingBeamProjector();
		session.setAttribute("beList", beList);
		
		ArrayList<Reservation> bList = reService.selectBeamProjector();
		model.addAttribute("bList", bList);
		
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
	public String selectBeamProjector(Model model) {
		
		return "reservation/reservationBeamProjector";
	}
	
	@RequestMapping("mettingRoom.re")
	public String selectMettingRoom() {

		return "reservation/reservationMettingRoom";
	}
	
	
	@RequestMapping("insertReservationBeam.re")
	public String insertReservationBeam(Reservation r, HttpSession session, Model model) {
		
		//System.out.println(r);

		if(r.getAllDay() == null) {
			r.setAllDay("N");
		}else {
			r.setAllDay("Y");
		}
		
		int result = reService.insertReservation(r);
		
		if(result > 0) {
			AlertMsg msg = new AlertMsg("예약", "성공적으로 예약되었습니다");
			session.setAttribute("successMsg", msg);
			model.addAttribute("r", r);
			return "redirect:beamProjector.re";
		}else {
			AlertMsg msg = new AlertMsg("예약", "예약 실패");
			session.setAttribute("failMsg", msg);
			return "redirect:beamProjector.re";
		}
			
	}
	
	@RequestMapping("insertReservationMe.re")
	public String insertReservationMe(Reservation r, HttpSession session, Model model) {
		
		//System.out.println(r);

		if(r.getAllDay() == null) {
			r.setAllDay("N");
		}else {
			r.setAllDay("Y");
		}
		
		int result = reService.insertReservation(r);
		
		if(result > 0) {
			AlertMsg msg = new AlertMsg("예약", "성공적으로 예약되었습니다");
			session.setAttribute("successMsg", msg);
			model.addAttribute("r", r);
			return "redirect:mettingRoom.re";
		}else {
			AlertMsg msg = new AlertMsg("예약", "예약 실패");
			session.setAttribute("failMsg", msg);
			return "redirect:mettingRoom.re";
		}
			
	}
	
	@RequestMapping("insertReservationBeamMain.re")
	public String insertReservationBeamMain(Reservation r, HttpSession session, Model model) {
		
		//System.out.println(r);

		if(r.getAllDay() == null) {
			r.setAllDay("N");
		}else {
			r.setAllDay("Y");
		}
		
		int result = reService.insertReservation(r);
		
		if(result > 0) {
			AlertMsg msg = new AlertMsg("예약", "성공적으로 예약되었습니다");
			session.setAttribute("successMsg", msg);
			model.addAttribute("r", r);
			return "redirect:beamProjectorMain.re";
		}else {
			AlertMsg msg = new AlertMsg("예약", "예약 실패");
			session.setAttribute("failMsg", msg);
			return "redirect:beamProjectorMain.re";
		}
			
	}
	
	@RequestMapping("insertReservationMeMain.re")
	public String insertReservationMeMain(Reservation r, HttpSession session, Model model) {
		
		//System.out.println(r);

		if(r.getAllDay() == null) {
			r.setAllDay("N");
		}else {
			r.setAllDay("Y");
		}
		
		int result = reService.insertReservation(r);
		
		if(result > 0) {
			AlertMsg msg = new AlertMsg("예약", "성공적으로 예약되었습니다");
			session.setAttribute("successMsg", msg);
			model.addAttribute("r", r);
			return "redirect:main.re";
		}else {
			AlertMsg msg = new AlertMsg("예약", "예약 실패");
			session.setAttribute("failMsg", msg);
			return "redirect:main.re";
		}
			
	}
	
	
	
	@RequestMapping("mettingRoomTimeGrid.re")
	public ModelAndView selectMettingRoomTimeGrid(int mno, HttpSession session, ModelAndView mv) {
		
		ArrayList<Reservation> mList = reService.selectMettingRoomTimeGrid(mno);
		
		Resource mname = reService.selectMettingRoomName(mno);
		
		//System.out.println(mList);
		
		//System.out.println(mname);
		
		mv.addObject("mList", mList)
		  .addObject("mno", mno)
		  .addObject("mname", mname)
		  .setViewName("reservation/reservationMettingRoomTimeGrid");
		  return mv;
	}
	
	@RequestMapping("beamProjectorTimeGrid.re")
	public ModelAndView selectbeamProjectorTimeGrid(int bno, HttpSession session, ModelAndView mv) {
		
		ArrayList<Reservation> bList = reService.selectbeamProjectorTimeGrid(bno);
		
		Resource bname = reService.selectMettingRoomName(bno);
		//System.out.println(bList);
		
		mv.addObject("bList", bList)
		  .addObject("bno", bno)
		  .addObject("bname", bname)
		  .setViewName("reservation/reservationBeamProjectorTimeGrid");
		  return mv;
	}
	
	
	@RequestMapping("insertReservationMeTimeGrid.re")
	public String insertReservationMeTimeGrid(Reservation r, HttpSession session, Model model) {
		
		//System.out.println(r);
	
		if(r.getAllDay() == null) {
			r.setAllDay("N");
		}else {
			r.setAllDay("Y");
		}
		
		int result = reService.insertReservation(r);
		
		if(result > 0) {
			AlertMsg msg = new AlertMsg("예약", "성공적으로 예약되었습니다");
			session.setAttribute("successMsg", msg);
			model.addAttribute("r", r);
			return "redirect:mettingRoomTimeGrid.re?mno=" + r.getResourceNo();
			
		}else {
			AlertMsg msg = new AlertMsg("예약", "예약 실패");
			session.setAttribute("failMsg", msg);
			return "redirect:mettingRoomTimeGrid.re?mno=" + r.getResourceNo();
		}
			
	}
	
	@RequestMapping("insertReservationBeTimeGrid.re")
	public String insertReservationBeTimeGrid(Reservation r, HttpSession session, Model model) {
		
		//System.out.println(r);
	
		if(r.getAllDay() == null) {
			r.setAllDay("N");
		}else {
			r.setAllDay("Y");
		}
		
		int result = reService.insertReservation(r);
		
		if(result > 0) {
			AlertMsg msg = new AlertMsg("예약", "성공적으로 예약되었습니다");
			session.setAttribute("successMsg", msg);
			model.addAttribute("r", r);
			return "redirect:beamProjectorTimeGrid.re?bno=" + r.getResourceNo();
			
		}else {
			AlertMsg msg = new AlertMsg("예약", "예약 실패");
			session.setAttribute("failMsg", msg);
			return "redirect:beamProjectorTimeGrid.re?bno=" + r.getResourceNo();
		}
			
	}
	
}
