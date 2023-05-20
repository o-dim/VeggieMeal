package com.gdu.veggiemeal.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderTblDTO {
	
	private int orderNo;
	private PersonDTO perNo;
	private CartDetailDTO cartDetailNo;
	private int total;
	private int fastOrder;

}
