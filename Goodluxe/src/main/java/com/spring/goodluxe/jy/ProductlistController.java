package com.spring.goodluxe.jy;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class ProductlistController {
	
	@Autowired
	private ProductlistServiceImpl productlistService; 
	
	//매입상품 입력 페이지 이동
	@RequestMapping(value = "adminProductRegisterPurchase.do")
	public String adminProductRegisterPurchase() {
		
		return "admin_purc_regi";
	}
	//위탁상품 입력 페이지 이동
	@RequestMapping(value = "adminProductRegisterConsign.do")
	public String adminProductRegisterConsign() {
		
		return "admin_consign_regi";
	}
	
	//매입상품 입력 액션
	@RequestMapping(value = "purcRegiAction.do")
	public String purcRegiAction(PurchaseProductVO purcVO) {
		System.out.println("ㅇㅇㅇㅇㅇㅇ");
		System.out.println("엔티티넘버는 : "+ purcVO.getEntity_number());
		int res = productlistService.registerProduct(purcVO);	
		if(res == 1) {
			System.out.println("컨트롤러 purc성공");
		}
		return "admin_purc_regi";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	@RequestMapping(value = "/purc_regi_action.do")
//	public String registerAction(ProductVO productVO, Model model, MultipartHttpServletRequest m_request) throws Exception {
//		
//		
//		MultipartFile mf_main = m_request.getFile("product_main_img");
//		MultipartFile mf_detail = m_request.getFile("product_detail_img");
//		
//		String uploadPath = "C:\\Project138\\upload\\";
//		
//		/*메인 이미지 처리부분*/
//		String originalFileExtension_main = mf_main.getOriginalFilename().substring(mf_main.getOriginalFilename().lastIndexOf("."));
//		String storedFileName_main = UUID.randomUUID().toString().replaceAll("-", "")+originalFileExtension_main;
//		if(mf_main.getSize()!=0) { 
//			mf_main.transferTo(new File(uploadPath+storedFileName_main));
//		}
//		productVO.setProduct_main_img_original(mf_main.getOriginalFilename());
//		productVO.setProduct_main_img_stored(storedFileName_main);
//		/*디테일 이미지 처리부분*/
//		String originalFileExtension_detail = mf_detail.getOriginalFilename().substring(mf_detail.getOriginalFilename().lastIndexOf("."));
//		String storedFileName_detail = UUID.randomUUID().toString().replaceAll("-", "")+originalFileExtension_detail;
//		if(mf_detail.getSize()!=0) { 
//			mf_detail.transferTo(new File(uploadPath+storedFileName_detail));
//		}
//		productVO.setProduct_detail_img_original(mf_detail.getOriginalFilename());
//		productVO.setProduct_detail_img_stored(storedFileName_detail);
//		
//		int res = productlistService.registerProduct(productVO);	
//		
//		return "admin_product_register";
//	}
	
	
	
	
	
	
	
}
