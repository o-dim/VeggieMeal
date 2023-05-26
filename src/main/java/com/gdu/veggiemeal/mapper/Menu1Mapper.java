package com.gdu.veggiemeal.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.veggiemeal.domain.SaleDTO;

@Mapper
public interface Menu1Mapper {
	public int getSaleCount();
	public SaleDTO selectSaleByNo(int saleNo);
	public List<SaleDTO> getSaleListUsingScroll(Map<String, Object> map);

}
