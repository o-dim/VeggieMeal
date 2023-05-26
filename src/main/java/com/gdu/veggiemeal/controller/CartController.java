package com.gdu.veggiemeal.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gdu.veggiemeal.domain.CartDetailDTO;
import com.gdu.veggiemeal.service.CartService;

@RequestMapping("/order")
@Controller
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	@GetMapping("/cart.form")
	public String list(HttpServletRequest request, Model model) {
		List<CartDetailDTO> cartDetailList = cartService.getCartList(request);
		model.addAttribute("cartDetailList", cartDetailList);
		return "order/cart";
	}
	
	@GetMapping("/display.do")
	public ResponseEntity<byte[]> display(@RequestParam("cartDetailNo") int cartDetailNo) {
		return cartService.display(cartDetailNo);
	}
	
	@GetMapping("/cartdetail.do")
	public String detail(HttpServletRequest request, Model model) {
		model.addAttribute("c", cartService.getCartByNo(request));
		return "order/cartdetail";
	}
	
	
	@PostMapping("/cartadd.do")
	public void add(HttpServletRequest request, HttpServletResponse response) {
		cartService.addCart(request, response);
	}
	

	@GetMapping("/cartmodify.form")
	public String modify() {
		return "order/modify";
	}
	
	@PostMapping("/cartremove.do")
	public void remove(HttpServletRequest request, HttpServletResponse response) {
		cartService.removeCart(request, response);
	}
	@PostMapping("/cartremoveList.do")
	public void removeList(HttpServletRequest request, HttpServletResponse response) {
		cartService.removeCartList(request, response);
	}
	
}	
