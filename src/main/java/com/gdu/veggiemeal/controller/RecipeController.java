package com.gdu.veggiemeal.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gdu.veggiemeal.service.RecipeService;

@RequestMapping("/menu2")
@Controller
public class RecipeController {

	@Autowired
	private RecipeService recipeService;
	
	@GetMapping("/recipe.do")
	public String list(HttpServletRequest request, Model model){
		recipeService.selectRecipeList(request, model);
		return "menu2/recipe";
	}
	
	@GetMapping("/display.do")
	public ResponseEntity<byte[]> display(@RequestParam("recipeNo") int recipeNo){
		return recipeService.display(recipeNo);
	}
	
	@GetMapping("/detail.do")
	public String recipeDetail(HttpServletRequest request, Model model) {
		model.addAttribute("r", recipeService.getRecipeByNo(request));
		return "menu2/foodDetail";
	}
	
	@PostMapping("/editRecipe.do")
	public String editRecipe(HttpServletRequest request, Model model) {
		model.addAttribute("r", recipeService.getRecipeByNo(request));
		return "menu2/recipeEdit";
	}
	
	@PostMapping("/removeRecipe.do")
	public String removeRecipe(RedirectAttributes redirectAttributes, int recipeNo) {
		redirectAttributes.addFlashAttribute("removeResult", recipeService.removeRecipe(recipeNo));
		return "redirect:/menu2/recipe.form";
	}
	
	@PostMapping("/modify.do")
	public void modifyRecipe(HttpServletRequest request, HttpServletResponse response) {
		recipeService.modifyRecipe(request, response);
	}
	
	@GetMapping("/writeRecipe.form")
	public String writeRecipe() {
		return "/menu2/recipe3";
	}
	
	/*
	 * @PostMapping("/addRecipe.do") public String
	 * addRecipe(MultipartHttpServletRequest multipartRequest, RedirectAttributes
	 * redirectAttributes) { int addResult =
	 * recipeService.addRecipe(multipartRequest);
	 * redirectAttributes.addFlashAttribute("addResult", addResult); return
	 * "/redirect:/menu2/recipe.do"; }
	 */
	
	     
}
