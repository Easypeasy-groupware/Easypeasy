package com.ep.spring.address.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ep.spring.address.model.service.AddressService;

@Controller
public class AddressController {
	
	@Autowired
	private AddressService aService;
	
	@RequestMapping("favorite.add")
	public String addFavList() {
		return "address/addFavorite";
	}
	
	@RequestMapping("newPs.add")
	public String newPsAddForm() {
		return "address/newPersonalAddress";
	}
	

}
