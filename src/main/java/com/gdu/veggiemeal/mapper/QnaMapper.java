package com.gdu.veggiemeal.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.veggiemeal.domain.PersonDTO;
import com.gdu.veggiemeal.domain.QnaDTO;

@Mapper
public interface QnaMapper {

	public int getQnaCount();

	public List<QnaDTO> getQnaList(Map<String, Object> map);

	public List<PersonDTO> selectPersonById(String id);

	public int addQnaList(QnaDTO qnaDTO);

}
