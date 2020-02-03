package com.spring.goodluxe.jy;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.goodluxe.voes.ConsignProductVO;
import com.spring.goodluxe.voes.ProductBoardVO;
import com.spring.goodluxe.voes.PurchaseProductVO;

@Controller

public class ProductlistController {
	
	@Autowired
	private ProductlistServiceImpl productlistService; 
	
		//
		@RequestMapping(value = "adminProductRegisterPurchase.do")
		public String adminProductRegisterPurchase() {
			
			return "admin_purc_regi";
		}
		//
		@RequestMapping(value = "adminProductRegisterConsign.do")
		public String adminProductRegisterConsign() {
			
			return "admin_consign_regi";
		}
		//
		@RequestMapping(value = "adminPostUpload.do")
		public String adminPostUpload() {
			
			return "admin_post_upload";
		}
		
		// 메인 페이지
		@RequestMapping(value = "mainPage.do")
		public String mainPage( Model model ) throws Exception {
			
			ArrayList<HashMap<String, Object>> productList = new ArrayList<HashMap<String, Object>>();
			productList = productlistService.getMainPageItem();
			
			
			ArrayList<HashMap<String, Object>> productList_view = new ArrayList<HashMap<String, Object>>();
			productList_view = productlistService.getMainPageItem_view();
			

			model.addAttribute("productList",productList);
			model.addAttribute("productList_view", productList_view);
			
			return "main_page";
		}
		
		//
		@RequestMapping(value = "purcRegiAction.do")
		public String purcRegiAction(PurchaseProductVO purcVO, HttpServletRequest request) throws Exception {
			
			String txt_date = (String) request.getParameter("purc_date_text");
			Date date_date = new SimpleDateFormat("yyyy-MM-dd").parse(txt_date);
			purcVO.setPurc_date(date_date);
			
			int res = productlistService.registerProduct(purcVO);	
			
		
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
			
			return "admin_consign_regi";
		}
		
		
		@RequestMapping(value = "postUploadAction.do")
		public String postUploadAction(ProductBoardVO sellboVO, Model model, MultipartHttpServletRequest m_request) throws Exception {
			
			MultipartFile mf_main = m_request.getFile("pb_main_img");
			MultipartFile mf_detail1 = m_request.getFile("pb_detail_img1");
			MultipartFile mf_detail2 = m_request.getFile("pb_detail_img2");
			MultipartFile mf_detail3 = m_request.getFile("pb_detail_img3");

			String uploadPath = "C:\\Project138\\upload\\";
			
		
			String originalFileExtension_main = mf_main.getOriginalFilename().substring(mf_main.getOriginalFilename().lastIndexOf("."));
			String storedFileName_main = UUID.randomUUID().toString().replaceAll("-", "")+originalFileExtension_main;
			if(mf_main.getSize()!=0) { 
				mf_main.transferTo(new File(uploadPath+storedFileName_main));
			}
			sellboVO.setPb_main_img_original(mf_main.getOriginalFilename());
			sellboVO.setPb_main_img_stored(storedFileName_main);
			
			
			String originalFileExtension_detail1 = mf_detail1.getOriginalFilename().substring(mf_detail1.getOriginalFilename().lastIndexOf("."));
			String storedFileName_detail1 = UUID.randomUUID().toString().replaceAll("-", "")+originalFileExtension_detail1;
			if(mf_detail1.getSize()!=0) { 
				mf_detail1.transferTo(new File(uploadPath+storedFileName_detail1));
			}
			sellboVO.setPb_detail_img1_original(mf_detail1.getOriginalFilename());
			sellboVO.setPb_detail_img1_stored(storedFileName_detail1);
		
			
			String originalFileExtension_detail2 = mf_detail2.getOriginalFilename().substring(mf_detail2.getOriginalFilename().lastIndexOf("."));
			String storedFileName_detail2 = UUID.randomUUID().toString().replaceAll("-", "")+originalFileExtension_detail2;
			if(mf_detail2.getSize()!=0) { 
				mf_detail2.transferTo(new File(uploadPath+storedFileName_detail2));
			}
			sellboVO.setPb_detail_img2_original(mf_detail1.getOriginalFilename());
			sellboVO.setPb_detail_img2_stored(storedFileName_detail2);
			
			
			String originalFileExtension_detail3 = mf_detail3.getOriginalFilename().substring(mf_detail3.getOriginalFilename().lastIndexOf("."));
			String storedFileName_detail3 = UUID.randomUUID().toString().replaceAll("-", "")+originalFileExtension_detail3;
			if(mf_detail3.getSize()!=0) { 
				mf_detail3.transferTo(new File(uploadPath+storedFileName_detail3));
			}
			sellboVO.setPb_detail_img3_original(mf_detail3.getOriginalFilename());
			sellboVO.setPb_detail_img3_stored(storedFileName_detail3);
			int res = productlistService.uploadProductBoard(sellboVO);	
			
			return "admin_post_upload";
		}
		

		@RequestMapping(value = "itemList.do")
		public String itemList( Model model, HttpServletRequest request
				,@RequestParam(value = "pageCount", required = false, defaultValue = "1") int pageCount
				,@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum 
				,@RequestParam(value = "il_search_brand", required = false, defaultValue = "all") String il_search_brand
				,@RequestParam(value = "il_search_category", required = false, defaultValue = "all") String il_search_category
				,@RequestParam(value = "il_search_grade", required = false, defaultValue = "all") String il_search_grade
				,@RequestParam(value = "il_search_price", required = false, defaultValue = "all") String il_search_price
				)throws Exception {
			
			if(pageNum<=0) {
				pageNum = 1;
			}
			if(pageNum>pageCount) {
				pageNum = pageCount;
			}
			int pageSize = 3;
			int currentPage = pageNum;
			int startRow = (currentPage-1) * pageSize +1;
			int endRow = startRow + pageSize - 1;
			int count = 0;
			int number = 0;
		
			//HashMap<String,Object>  productHM = new HashMap <String, Object>();
			ArrayList<HashMap<String, Object>> productList = new ArrayList<HashMap<String, Object>>();

			count = productlistService.getSellingBoardCount(startRow, endRow,il_search_brand,il_search_category,il_search_grade, il_search_price);
			
			if (count < startRow) {
				currentPage = currentPage - 1;
				startRow = (currentPage - 1) * pageSize + 1;
				endRow = startRow + pageSize - 1;
			}
			if (count > 0) {
				productList = productlistService.getSellingBoardProduct(startRow, endRow,il_search_brand,il_search_category,il_search_grade, il_search_price);
				number = count - (currentPage - 1) * pageSize;
			}
			
			model.addAttribute("il_search_brand",il_search_brand);
			model.addAttribute("il_search_category",il_search_category);
			model.addAttribute("il_search_grade",il_search_grade);
			model.addAttribute("il_search_price",il_search_price);
			
			model.addAttribute("productList",productList);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("count", count);
			model.addAttribute("number", number);
			model.addAttribute("pageSize", pageSize);
			
			return "item_list";
		}


		@RequestMapping(value = "searchResult.do")
		public String searchResult(Model model, HttpServletRequest request
				,@RequestParam(value = "pageCount", required = false, defaultValue = "1") int pageCount
				,@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum 
				,@RequestParam(value = "search_content", required = false, defaultValue="") String search_content
				,@RequestParam(value = "orderbywhat", required = false, defaultValue = "recently") String orderbywhat
				)throws Exception {
			
			if(pageNum<=0) { 
				pageNum = 1;
			}
			if(pageNum>pageCount) {
				pageNum = pageCount;
			}
			int pageSize = 3;
			int currentPage = pageNum;
			int startRow = (currentPage-1) * pageSize +1;
			int endRow = startRow + pageSize - 1;
			int count = 0;
			int number = 0;
			
			ArrayList<HashMap<String, Object>> productList = new ArrayList<HashMap<String, Object>>();
			
			search_content = search_content.replaceAll("\\s", "\\|");
		
			
			count = productlistService.getSearchBoardCount(search_content,orderbywhat);
			
			if (count < startRow) {
				currentPage = currentPage - 1;
				startRow = (currentPage - 1) * pageSize + 1;
				endRow = startRow + pageSize - 1;
			}
			if (count > 0) {
				productList = productlistService.getSearchBoardProduct(startRow, endRow, search_content, orderbywhat );
				number = count - (currentPage - 1) * pageSize;
			}
			
			search_content = search_content.replaceAll("\\|", " ");
			
			model.addAttribute("orderbywhat",orderbywhat);
			model.addAttribute("search_content",search_content);
			model.addAttribute("productList", productList);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("count", count);
			model.addAttribute("number", number);
			model.addAttribute("pageSize", pageSize);
			
			return "search_result";
		}
		
	
		@RequestMapping(value = "mdDetail.do")
		public String mdDetail( Model model,HttpServletRequest request
				,@RequestParam(value = "entity_number", required = false, defaultValue = "40" ) String entity_number
				 ) throws Exception {
			HashMap<String,Object>theProduct = new HashMap<String,Object>();
			ArrayList<HashMap<String, Object>> recommandList = new ArrayList<HashMap<String, Object>>();
			
			theProduct = productlistService.getTheProduct(entity_number);
			
			System.out.println("엔티티 프로덕트 찾고 그다음");
			
			recommandList = productlistService.getRecommand(entity_number); 
			System.out.println("컨트롤 "+recommandList);
			
			model.addAttribute("recommandList",recommandList);
			model.addAttribute("theProduct",theProduct);
			return "md_detail";
		}
	
	
	
	
}
