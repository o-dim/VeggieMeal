package com.gdu.veggiemeal.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RecipeDTO {
	
	private int recipeNo;
	private PersonDTO id;
	private String title;
	private String tool;
	private String content1;
	private String content2;
	private Date writeAt;
	private Date modifiedAt;
	private String imgfileName;
}
