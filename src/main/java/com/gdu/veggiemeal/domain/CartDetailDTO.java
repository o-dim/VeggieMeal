package com.gdu.veggiemeal.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartDetailDTO {

	private int CartDetailNo;
	private CartTblDTO cartNo;
	private PersonDTO perNo;
}
