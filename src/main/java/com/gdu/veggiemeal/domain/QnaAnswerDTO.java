package com.gdu.veggiemeal.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class QnaAnswerDTO {

	private String title;
	private String content;
	private Date answerAt;
	private QnaDTO id;
}
