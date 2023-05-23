package com.gdu.veggiemeal.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gdu.veggiemeal.service.VeggiemealService;

@RequestMapping("/menu2")
@Controller
public class VeggiemealController {
	
	@Autowired
	private VeggiemealService veggiemealService;
	
	@GetMapping("/recipe.form")
	public String recipeJsp() {
		return "menu2/recipe";
	}
	
	@GetMapping("/foodDetail.do")
	public String detail(HttpServletRequest request, Model model) {
		model.addAttribute("r", veggiemealService.getVeggiemealByNo(request));
		return "/menu2/foodDetail";
	}
	
	
}
