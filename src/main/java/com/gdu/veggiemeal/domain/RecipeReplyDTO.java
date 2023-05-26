package com.gdu.veggiemeal.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import oracle.sql.DATE;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RecipeReplyDTO {
	
	private int replyNo;
	private String content;
	private int groupNo;
	private int groupOrder;
	private int depth;
	private DATE writeAt;
	private Date reWriteAt;
	private PersonDTO id;
	private RecipeDTO recipeNo;
}
