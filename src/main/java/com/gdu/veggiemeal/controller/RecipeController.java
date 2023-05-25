package com.gdu.veggiemeal.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gdu.veggiemeal.service.RecipeService;

@RequestMapping("/menu2")
@Controller
public class RecipeController {

	@Autowired
	private RecipeService recipeService;

	@GetMapping("/recipe.form")
	public String recipeJsp() {
		return "menu2/recipe";
	}
	
	@ResponseBody
	@GetMapping("/recipe.do")
	public Map<String, Object> scroll(HttpServletRequest request){
		return recipeService.selectRecipeList(request);
	}
	//
}
