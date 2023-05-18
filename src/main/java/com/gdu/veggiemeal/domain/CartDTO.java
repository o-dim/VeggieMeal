package com.gdu.veggiemeal.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor 
@AllArgsConstructor
public class CartDTO {

	private int cartNo;
	private ProductDTO prodCode;
	private int count;
}
