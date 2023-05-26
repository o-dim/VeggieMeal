package com.gdu.veggiemeal.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;

import com.gdu.veggiemeal.domain.SaleDTO;

public interface Menu1Service {

	public ResponseEntity<byte[]> display(int saleNo);
	public Map<String, Object> getSaleListUsingScroll(HttpServletRequest request);
	public SaleDTO getSaleByNo(HttpServletRequest request);
}
