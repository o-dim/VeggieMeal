package com.gdu.veggiemeal.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RecommandDTO {
	private int RecommandNo;
	private PersonDTO perNo;
	private RecipeDTO recipeNo;
}
