package com.gdu.veggiemeal.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.veggiemeal.domain.RecipeDTO;

@Mapper
public interface RecipeMapper {
	public int getRecipeCount();
	public List<RecipeDTO> selectRecipeList(Map<String, Object> map);
	public RecipeDTO getRecipeByNo(int recipeNo);
	public int removeRecipe(int recipeNo);
	public int modifyRecipe(RecipeDTO recipeDTO);
}
