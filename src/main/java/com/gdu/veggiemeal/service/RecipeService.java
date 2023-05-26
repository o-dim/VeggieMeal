package com.gdu.veggiemeal.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;

import com.gdu.veggiemeal.domain.RecipeDTO;

public interface RecipeService {
	public void selectRecipeList(HttpServletRequest request, Model model);
	public ResponseEntity<byte[]> display(int recipeNo);
	public RecipeDTO getRecipeByNo(HttpServletRequest request);
	public int removeRecipe(int recipeNo);
	public void modifyRecipe(HttpServletRequest request, HttpServletResponse response);
	/* public int addRecipe(MultipartHttpServletRequest multipartRequest); */
}
