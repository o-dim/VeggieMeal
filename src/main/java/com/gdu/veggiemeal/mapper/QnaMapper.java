package com.gdu.veggiemeal.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.ui.Model;

import com.gdu.veggiemeal.domain.PersonDTO;
import com.gdu.veggiemeal.domain.QnaDTO;

@Mapper
public interface QnaMapper {

	public int getQnaCount();

	public List<QnaDTO> getQnaList(Map<String, Object> map);

	public List<PersonDTO> selectPersonById(String id);

	public int addQnaList(QnaDTO qnaDTO);

	public QnaDTO getQnaByNo(int qnaNo);
	
	public int updateBoard(QnaDTO qnaDTO);
}
