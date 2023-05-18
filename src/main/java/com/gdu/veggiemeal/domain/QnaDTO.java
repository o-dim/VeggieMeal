package com.gdu.veggiemeal.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class QnaDTO {

	private int qnaNo;
	private String title;
	private String content;
	private PersonDTO perNo;
	private Date writeAt;
	private String qnaReply;
}
