package com.gdu.veggiemeal.mapper;

import java.util.List;
import java.util.Map;

import com.gdu.veggiemeal.domain.RecipeDTO;

public interface RecipeMapper {
	public int getRecipeCount();
	public List<RecipeDTO> selectRecipeList(Map<String, Object> map);
	/* public List<RecipeDTO> selectRecipeByNo(int recipeNo); */
}
