package com.ep.spring.reservation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ep.spring.reservation.model.service.ReservationService;

@Controller
public class ReservationController {

	@Autowired
	private ReservationService reService;
	
	@RequestMapping("main.re")
	public String mainReservation() {
		return "reservation/reservationMainView";
	}
}
