package com.gdu.veggiemeal.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor 
@AllArgsConstructor
public class CartDTO {
	private int cartNo;
	private Date createdAt;
	private PersonDTO personDTO;
}
