package com.spring.goodluxe.jiyemypage;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.goodluxe.voes.MemberVO;

@Controller
public class JyMyPageController {

		@Autowired
		private JyMyPageServiceImpl jyMyPageService;
		
		@RequestMapping(value = "myInfo.do")
		public String my_info(Model model, HttpSession session)throws Exception {                   
			//Model model, @RequestParam(value = "member_id", required = false, defaultValue = "1") String member_id
			//throws Exception 
			
			MemberVO memberVO = null;
			
			String session_id = (String)session.getAttribute("member_id") ;
			
			if(session_id == null) {
				return "redirect:mainPage.do";
			}
			 
			memberVO=jyMyPageService.getMemberInfo(session_id);
		
			model.addAttribute("memberVO",memberVO);
			
			return "my_info";
		}
		
		@RequestMapping(value = "myInfoAction.do")
		public String myInfoAction(Model model, MemberVO memberVO, HttpServletRequest request )throws Exception {                   
			
			String member_phone=(String)request.getParameter("tel1")+(String)request.getParameter("tel2")+(String)request.getParameter("tel3");
			memberVO.setMember_phone(member_phone);
			
			String member_email = (String)request.getParameter("email1") + "@" + (String)request.getParameter("email2");
			memberVO.setMember_email(member_email);
			
			String cate[] = request.getParameterValues("prefer_category");
			String member_like_category = "";
			member_like_category += cate[0];
			for(int i = 1; i<cate.length; i++) {
				member_like_category += ",";	
				member_like_category += cate[i];
			}
			System.out.println(member_like_category);
			memberVO.setMember_like_category(member_like_category);
			
			String brand[] = request.getParameterValues("prefer_brand");
			String member_like_brand = "";
			member_like_brand += brand[0];
			for(int j = 1; j<brand.length; j++ ) {
				member_like_brand += ",";
				member_like_brand += brand[j];
			}
			memberVO.setMember_like_brand(member_like_brand);
			
			jyMyPageService.myInfoAction(memberVO);
			
			// return "my_info mjmj";
			return "redirect:myInfo.do";
		}
		@RequestMapping(value = "myLikedGoods.do")
		public String likedGoods(HttpSession session, Model model, MemberVO memberVO, HttpServletRequest request 
				,@RequestParam(value = "pageCount", required = false, defaultValue = "1") int pageCount
				,@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum 
				)throws Exception {                   
			
			if(pageNum<=0) {
				pageNum = 1;
			}
			if(pageNum>pageCount) {
				pageNum = pageCount;
			}
			int pageSize = 10;
			int currentPage = pageNum;
			int startRow = (currentPage-1) * pageSize +1;
			int endRow = startRow + pageSize - 1;
			int count = 0;
			int number = 0;
			
			String member_id = (String) session.getAttribute("member_id"); //session
			if(member_id == null) {
				return "redirect:mainPage.do";
			}
			
			ArrayList<HashMap<String,Object>> productList = null; 
			count = jyMyPageService.myLikedGoodsCount(startRow, endRow,member_id);
			
			if (count < startRow) {
				currentPage = currentPage - 1;
				startRow = (currentPage - 1) * pageSize + 1;
				endRow = startRow + pageSize - 1;
			}
			if (count > 0) {
				productList = jyMyPageService.myLikedGoods(startRow, endRow,member_id);
				number = count - (currentPage - 1) * pageSize;
			}
		
			System.out.println("list" +productList);
			
			model.addAttribute("productList",productList);		
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("count", count);
			model.addAttribute("number", number);
			model.addAttribute("pageSize", pageSize);
			
			return "mypage_liked_goods";
		}
		@RequestMapping(value = "deleteLikedGoods.do")
		public String deleteLikedGoods(Model model,HttpSession session, @RequestParam(value = "entity_number", required = false ,defaultValue = "40") String entity_number)throws Exception {                   
			
			String member_id = (String) session.getAttribute("member_id");
			
			jyMyPageService.deleteLikedGoods(entity_number, member_id);
			
			return "redirect:myLikedGoods.do";
		}
		@RequestMapping(value = "deleteCheckedGoods.do")
		public String deleteCheckedGoods(Model model, HttpServletRequest request,HttpSession session)throws Exception {                   
			
			
			//jyMyPageService.deleteLikedGoods(entity_number);
			
			String member_id = (String) session.getAttribute("member_id");
			String[] checked = request.getParameterValues("chk_one");
			System.out.println("멤버아이디: "+ member_id);
			System.out.println("checked: "+ checked[0]);
			
//			System.out.println("check" + checked);
//			for(int i = 0; i<checked.length; i++) {
//				System.out.println(checked[i]);
//			}
			
			jyMyPageService.deleteCheckedGoods(checked ,member_id);
			
			return "redirect:myLikedGoods.do";
		}
		@RequestMapping(value = "mypageApplyForm.do")
		public String mypageApplyForm(Model model, HttpServletRequest request)throws Exception {                   
			return "mypage_apply_form";
		}
		
		
}
