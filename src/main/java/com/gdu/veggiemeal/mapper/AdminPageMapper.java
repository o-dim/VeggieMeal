package com.gdu.veggiemeal.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.veggiemeal.domain.RImgDTO;

@Mapper
public interface AdminPageMapper {
	public RImgDTO selectVeggiemealByNo(int RecipeNo);
}
