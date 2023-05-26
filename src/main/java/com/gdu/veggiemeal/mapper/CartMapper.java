package com.gdu.veggiemeal.mapper;

import java.util.List;

import com.gdu.veggiemeal.domain.CartDetailDTO;

public interface CartMapper {

	public List<CartDetailDTO> selectCartDetailList(String id); 		// 카트 목록 조회
	public CartDetailDTO selectCartByNo(int cartNo);					// 카트 번호 조회
	public CartDetailDTO selectCartDetailByNo(int cartDetailNo);
	public int addCart(CartDetailDTO cartDetail);						// 카트 추가
	public int modifyCart(CartDetailDTO cartDetail);					// 카트 (수량)수정
	public int deleteCart(int cartNo);									// 카트 삭제
	public int deleteCartList(List<String> cartNoList); 				// 카트 목록 삭제
	public int selectCartCount();						

}
