package com.gdu.veggiemeal.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;

import com.gdu.veggiemeal.domain.CartDetailDTO;

public interface CartService {

	public List<CartDetailDTO> getCartList(HttpServletRequest request);					// 카트 목록
	public ResponseEntity<byte[]> display(int cartDetailNo);
	public Map<String, Object> getCartByNo(HttpServletRequest request);
	public void addCart(HttpServletRequest request, HttpServletResponse response);		// 카트 추가
	public void modifyCart(HttpServletRequest request, HttpServletResponse response);	// 카트 수정
	public void removeCart(HttpServletRequest request, HttpServletResponse response); 	// 카트 삭제
	public void removeCartList(HttpServletRequest request, HttpServletResponse response);
	public void getCartCount();

}
