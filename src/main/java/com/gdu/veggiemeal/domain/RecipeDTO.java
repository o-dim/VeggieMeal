package com.gdu.veggiemeal.domain;

import java.sql.Date;

public class RecipeDTO {
	
	private int RecipeNo;
	private PersonDTO id;
	private String title;
	private String tool;
	private String content1;
	private String content2;
	private Date writeAt;
	private Date modifiedAt;
	private String imgfileName;
}
