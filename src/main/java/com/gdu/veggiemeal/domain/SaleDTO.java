package com.gdu.veggiemeal.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SaleDTO {
	
	private int saleNo;
	private ProductDTO prodCode;
	private String saleTitle;
	private String saleContent;
	private int salePrice;
	private ProductDTO prodPath;
	private ProductDTO prodImgName;

}
