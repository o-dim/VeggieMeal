package com.gdu.veggiemeal.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface RecipeService {
	public Map<String, Object> selectRecipeList(HttpServletRequest request);
	/* public void selectRecipeByNo(); */
}
