package com.gdu.veggiemeal.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FastOrderDetailDTO {
	
	private int odNo;
	private OrderTblDTO orderNo;
	private ProductDTO prodCode;
	private int count;

}
