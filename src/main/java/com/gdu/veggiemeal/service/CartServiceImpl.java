package com.gdu.veggiemeal.service;

import java.io.File;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;

import com.gdu.veggiemeal.domain.CartDetailDTO;
import com.gdu.veggiemeal.domain.ProductDTO;
import com.gdu.veggiemeal.domain.SaleDTO;
import com.gdu.veggiemeal.mapper.CartMapper;
import com.gdu.veggiemeal.util.PageUtil;
@Service
public class CartServiceImpl implements CartService {

	@Autowired
	public CartMapper cartMapper;
	private PageUtil pageUtil;
	
	@Override
	public List<CartDetailDTO> getCartList(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("loginId");
		return cartMapper.selectCartDetailList(id);
	}

	@Override
	public ResponseEntity<byte[]> display(int cartDetailNo) {
		CartDetailDTO cartDetail = cartMapper.selectCartDetailByNo(cartDetailNo);
		ResponseEntity<byte[]> image = null;
		try {
			File file = new File(cartDetail.getSaleDTO().getProductDTO().getProdPath(), cartDetail.getSaleDTO().getProductDTO().getProdImgName());
			image = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return image;
	}

	@Override
	public Map<String, Object> getCartByNo(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addCart(HttpServletRequest request, HttpServletResponse response) {
		// cartDetail -> cartDetailNo, count, saleNo(?)
		int cartDetailNo = Integer.parseInt(request.getParameter("cartDetailNo"));
		int count = Integer.parseInt(request.getParameter("count"));
				
		CartDetailDTO cartDetail = new CartDetailDTO();
		cartDetail.setCartDetailNo(cartDetailNo);
		cartDetail.setCount(count);
				
		int addResult = cartMapper.addCart(cartDetail);
			try {
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					
					out.println("<script>");
					if(addResult == 1) {
						out.println("alert('장바구니에 추가하시겠습니까?')");
						out.println("location.href='" + request.getContextPath() + "/order/cart.do?cartDetailNo='");
					} else {
						out.println("alert('검거하시겠습니까?')");
						out.println("history.back()");
					}
					out.println("</script>");
				} catch(Exception e) {
					e.printStackTrace();
				}
				

				
			}
	@Override
	public void modifyCart(HttpServletRequest request, HttpServletResponse response) {
		
		String prodName = request.getParameter("prodName");
	    int count = Integer.parseInt(request.getParameter("count"));
	    int salePrice = Integer.parseInt(request.getParameter("salePrice"));

	    // cartDetailDTO 생성 및 필요한 객체 설정
	    CartDetailDTO cartDetailDTO = new CartDetailDTO();
	    SaleDTO saleDTO = new SaleDTO();
	    ProductDTO productDTO = new ProductDTO();

	    // SaleDTO에 ProductDTO 설정
	    saleDTO.setProductDTO(productDTO);

	    // cartDetailDTO에 SaleDTO 설정
	    cartDetailDTO.setSaleDTO(saleDTO);

	    // 가져온 파라미터 값을 적절히 설정
	    cartDetailDTO.getSaleDTO().getProductDTO().setProdName(prodName);
	    cartDetailDTO.setCount(count);
	    cartDetailDTO.getSaleDTO().setSalePrice(salePrice);

	}

	@Override
	public void removeCart(HttpServletRequest request, HttpServletResponse response) {


int cartNo = Integer.parseInt(request.getParameter("cartNo"));
		
		int removeResult = cartMapper.deleteCart(cartNo);
		try {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out= response.getWriter();
			
			out.println("<script>");
			if(removeResult == 1) {
				out.println("alert('선택한 수량이 삭제되었습니다.')");
				out.println("location.href='" + request.getContextPath() + "/order/detail.do?cartNo='");
			} else {
				out.println("alert('선택한 수량이 삭제되지 않았습니다.')");
				out.println("history.back()");
			}
			out.println("</script>");
		} catch (Exception e) {
			e.printStackTrace();
		}
		

	}

	@Override
	public void removeCartList(HttpServletRequest request, HttpServletResponse response) {
		
		String[] cartNoList = request.getParameterValues("cartNoList");
		
		int removeResult = cartMapper.deleteCartList(Arrays.asList(cartNoList));
		
		try {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			if(removeResult == cartNoList.length) {
				out.println("alert('모든 수량이 삭제되었습니다.)");
				out.println("location.href='" + request.getContextPath() + "/order/list.do'");
			} else {
				out.println("alert('수량이 삭제되지 않았습니다.')");
				out.println("history.back()");
			}
			out.println("</script>");
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public void getCartCount() {
		
		int cartCount = cartMapper.selectCartCount();
		String msg = LocalDateTime.now().toString() + "카트의 개수는" + cartCount + "개입니다.";
		System.out.println(msg);

	}

}
