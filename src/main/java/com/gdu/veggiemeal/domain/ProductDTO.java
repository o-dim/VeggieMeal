package com.gdu.veggiemeal.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductDTO {
	
	private int prodCode;
	private String prodName;
	private String prodPath;
	private String prodImgName;
	private int prodOriginPrice;
	private int prodPrice;
	private int prodStock;
	private int prodCount;
	

}
