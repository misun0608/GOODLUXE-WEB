package com.spring.goodluxe.jy;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	//게시물 작성 페이지 이동
	@RequestMapping(value = "adminPostUpload.do")
	public String adminPostUpload() {
		
		return "admin_post_upload";
	}
	
	//매입상품 입력 액션
	@RequestMapping(value = "purcRegiAction.do")
	public String purcRegiAction(PurchaseProductVO purcVO, HttpServletRequest request) throws Exception {
		
		String txt_date = (String) request.getParameter("purc_date_text");
		Date date_date = new SimpleDateFormat("yyyy-MM-dd").parse(txt_date);
		purcVO.setPurc_date(date_date);
		
		int res = productlistService.registerProduct(purcVO);	
		if(res == 1) {
			System.out.println("컨트롤러 purc성공");
		}
		return "admin_purc_regi";
	}
	
	
	
	@RequestMapping(value = "consRegiAction.do")
	public String consRegiAction(ConsignProductVO consVO, HttpServletRequest request) throws Exception {
		
		String txt_start_date = (String) request.getParameter("start_date_text");
		String txt_end_date = (String) request.getParameter("end_date_text");
		Date date_start_date = new SimpleDateFormat("yyyy-MM-dd").parse(txt_start_date);
		Date date_end_date = new SimpleDateFormat("yyyy-MM-dd").parse(txt_end_date);
		consVO.setStart_date(date_start_date);
		consVO.setEnd_date(date_end_date);
		
		int res = productlistService.registerProduct(consVO);	
		if(res == 1) {
			System.out.println("컨트롤러 cons 성공");
		}
		return "admin_purc_regi";
	}
	
	
	
	@RequestMapping(value = "postUploadAction.do")
	public String postUploadAction(SellingBoardVO sellboVO, Model model, MultipartHttpServletRequest m_request) throws Exception {
		
		MultipartFile mf_main = m_request.getFile("pb_main_img");
		MultipartFile mf_detail = m_request.getFile("pb_detail_img");

		String uploadPath = "C:\\Project138\\upload\\";
		
		/*메인 이미지 처리부분*/
		String originalFileExtension_main = mf_main.getOriginalFilename().substring(mf_main.getOriginalFilename().lastIndexOf("."));
		String storedFileName_main = UUID.randomUUID().toString().replaceAll("-", "")+originalFileExtension_main;
		if(mf_main.getSize()!=0) { 
			mf_main.transferTo(new File(uploadPath+storedFileName_main));
		}
		sellboVO.setPb_main_img_original(mf_main.getOriginalFilename());
		sellboVO.setPb_main_img_stored(storedFileName_main);
		
		/*디테일 이미지 처리부분*/
		String originalFileExtension_detail = mf_detail.getOriginalFilename().substring(mf_detail.getOriginalFilename().lastIndexOf("."));
		String storedFileName_detail = UUID.randomUUID().toString().replaceAll("-", "")+originalFileExtension_detail;
		if(mf_detail.getSize()!=0) { 
			mf_detail.transferTo(new File(uploadPath+storedFileName_detail));
		}
		sellboVO.setPb_detail_img_original(mf_detail.getOriginalFilename());
		sellboVO.setPb_detail_img_stored(storedFileName_detail);
	
		int res = productlistService.uploadProductBoard(sellboVO);	
		
		return "admin_post_upload";
	}
	
	//제품리스트 페이지 이동
		@RequestMapping(value = "itemList.do")
		public String itemList( Model model
				,@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum ) throws Exception {
			
			int pageSize = 12;
			
			int currentPage = pageNum;
			int startRow = (currentPage-1) * pageSize +1;
			int endRow = startRow + pageSize - 1;
			int count = 0;
			int number = 0;
			
			List productList = null; //이름 & 이미지
			List productListDetail = null; //가격 & 브랜드
			
			count = productlistService.getSellingBoardCount();
			
			if (count < startRow) {
				currentPage = currentPage - 1;
				startRow = (currentPage - 1) * pageSize + 1;
				endRow = startRow + pageSize - 1;
			}
			
			if (count > 0) {
				productList = productlistService.getSellingBoardProduct(startRow, endRow);
				number = count - (currentPage - 1) * pageSize;
			}
			
			
			model.addAttribute("productList",productList);
			model.addAttribute("productListDetail", productListDetail);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("count", count);
			model.addAttribute("number", number);
			model.addAttribute("pageSize", pageSize);
			
			return "item_list";
		}
	
	
	
	
	
}
