package com.gdu.veggiemeal.domain;

import java.sql.Date;

import oracle.sql.DATE;

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
