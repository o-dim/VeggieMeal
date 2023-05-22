package com.gdu.veggiemeal.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.veggiemeal.domain.QnaDTO;

@Mapper
public interface QnaMapper {

public List<QnaDTO> getQnaList();
public int addQna(QnaDTO qnaDTO);
}
