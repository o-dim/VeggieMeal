package com.gdu.veggiemeal.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderDetailDTO {
	
	private int ODNo;
	private OrderDTO orderNo;
	private ProductDTO prodCode;

}
