package com.gdu.veggiemeal.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdu.veggiemeal.domain.RImgDTO;
import com.gdu.veggiemeal.mapper.AdminPageMapper;

@Service
public class VeggiemealServiceImpl implements VeggiemealService {
	
	@Autowired
	private AdminPageMapper adminPageMapper;
	
	@Override
	public RImgDTO getVeggiemealByNo(HttpServletRequest request) {
		
		String strRecipeNo = request.getParameter("recipeNo");
		int recipeNo = 0;
		if(strRecipeNo != null && strRecipeNo.isEmpty() == false) {
			recipeNo = Integer.parseInt(strRecipeNo);
		}
		return adminPageMapper.selectVeggiemealByNo(recipeNo);
		
	}
	
}
