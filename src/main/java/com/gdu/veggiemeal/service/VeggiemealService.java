package com.gdu.veggiemeal.service;

import javax.servlet.http.HttpServletRequest;

import com.gdu.veggiemeal.domain.RImgDTO;

public interface VeggiemealService {
	public RImgDTO getVeggiemealByNo(HttpServletRequest request);
}
