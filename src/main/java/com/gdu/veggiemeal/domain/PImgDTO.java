package com.gdu.veggiemeal.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PImgDTO {

	private int pimgNo;
	private String pimgPath;
	private String pimgFile;
	private ProductDTO prodCode;
	private int pimgMainImg;
}
