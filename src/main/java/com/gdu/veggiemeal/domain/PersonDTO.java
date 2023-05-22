package com.gdu.veggiemeal.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PersonDTO {
	private int	perNo;
	private String pw;
	private String phoneno;
	private String postAddress;
	private String roadAddress;
	private String jibunAddress;
	private String detailAddress;
	private String email;
	private String gender;
	private String name;
	private Date joinedAt;
	private String id;
}
