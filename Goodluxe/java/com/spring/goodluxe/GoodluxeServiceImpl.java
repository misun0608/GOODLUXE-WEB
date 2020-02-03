package com.spring.goodluxe;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.goodluxe.voes.MemberVO;
import com.spring.mapper.AjaxMapper;
import com.spring.mapper.MemberMapper;
import com.spring.mapper.MypageMapper;
import com.spring.mapper.ProductlistMapper;

@Service
public class GoodluxeServiceImpl implements GoodluxeService {
	@Autowired
	private SqlSession sqlSession;
	
	/* AJAX */
	// Login Information
	@Override
	public String userChk(MemberVO membervo) throws Exception {
		MemberVO member_db;
		try {
			MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
			member_db = memberMapper.userChk(membervo);
			
			if(member_db == null)
				return "non-member";
			
			if(!member_db.getMember_pw().equals(membervo.getMember_pw()))
				return "wrong_pw";
			
			// 이렇게 하면 안 됨.
			// membervo = member_db;
			
			membervo.setMember_id(member_db.getMember_id());
			membervo.setMember_class(member_db.getMember_class());
			membervo.setMember_isadmin(member_db.getMember_isadmin());
			
		} catch (Exception e) {
			System.out.println("ERROR(GoodluxeService/userChk) : " + e.getMessage());
			return "error_accur";
		}
		return "ok";
	}
	
	// Check if someone pressed 'Like Button'
	public int isMemberLiked(String member_id, String entity_number)throws Exception {
		int res = 0;
		try {
			AjaxMapper ajaxMapper = sqlSession.getMapper(AjaxMapper.class);
			
			HashMap<String,String>map = new HashMap<String,String>();
			map.put("id", member_id);
			map.put("entity",entity_number);
			
			res = ajaxMapper.isAlreadyLiked(map);
		}catch(Exception e) {
			System.out.println("ERRPR(AjaxService/isMemberLiked) : " + e.getMessage());
			throw new Exception("ERRPR(AjaxService/isMemberLiked)");
		}
		return res;
	}
	// When 'Like Button' is pressed
	public int setLike(String member_id, String entity_number)throws Exception {
		int data = 0;
		try {
			AjaxMapper ajaxMapper = sqlSession.getMapper(AjaxMapper.class);
			HashMap<String,String>map = new HashMap<String,String>();
			map.put("id", member_id);
			map.put("entity",entity_number);
			
			int res = ajaxMapper.isAlreadyLiked(map);
			
			if(res==0) { //좋아요 추가
				ajaxMapper.insertLikedUser(map);
				ajaxMapper.increaseLike(map);
				data=1;
			}
			else { //좋아요 삭제
				ajaxMapper.deleteLikedUser(map);
				ajaxMapper.decreaseLike(map);
				data=0;
			}
		}catch(Exception e) {
			System.out.println("ERRPR(AjaxService/setLike) : " + e.getMessage());
			throw new Exception("ERRPR(AjaxService/setLike)");
		}
		return data;
	}
	
	/* MyPage */
	// mypageOAS
	@Override
	public ArrayList<HashMap<String, Object>> getOasData(String id) {
		ArrayList<HashMap<String, Object>> oaslist = null;
		try {			
			MypageMapper mypageMapper = sqlSession.getMapper(MypageMapper.class);
			oaslist = mypageMapper.getOasData(id);
		} catch(Exception e) {
			System.out.println("ERROR(GoodluxeService/getOasData) : " + e.getMessage());
		}
		return oaslist;
	}
	// mypageOAS
	@Override
	public ArrayList<HashMap<String, Object>> getCancelData(String id) {
		ArrayList<HashMap<String, Object>> cancellist = null;
		try {			
			MypageMapper mypageMapper = sqlSession.getMapper(MypageMapper.class);
			cancellist = mypageMapper.getCancelData(id);
		} catch(Exception e) {
			System.out.println("ERROR(GoodluxeService/getCancelData) : " + e.getMessage());
		}
		return cancellist;
	}
	// mypageOAS:cancel
	@Override
	public void orderCancel(String order_number) {
		try {			
			MypageMapper mypageMapper = sqlSession.getMapper(MypageMapper.class);
			Calendar today = Calendar.getInstance();
			Timestamp ct = new Timestamp(today.getTimeInMillis());
			int num = mypageMapper.orderCancel(order_number, ct, "취소완료");
			mypageMapper.updatePBStatus(order_number, "판매중");
			if(num <= 0) {
				System.out.println("ERROR(GoodluxeService/orderCancel) : 주문 취소 실패");
				mypageMapper.updatePBStatus(order_number, "거래중");
			}
			
		} catch(Exception e) {
			System.out.println("ERROR(GoodluxeService/orderCancel) : " + e.getMessage());
		}
	}
	// mypageOAS:refund
	@Override
	public void orderRefund(String order_number) {
		try {			
			MypageMapper mypageMapper = sqlSession.getMapper(MypageMapper.class);
			Calendar today = Calendar.getInstance();
			Timestamp ct = new Timestamp(today.getTimeInMillis());
			int num = mypageMapper.orderCancel(order_number, ct, "환불신청");
			if(num <= 0) {
				System.out.println("ERROR(GoodluxeService/orderRefund) : 환불 신청 실패");
			}
			
		} catch(Exception e) {
			System.out.println("ERROR(GoodluxeService/orderCancel) : " + e.getMessage());
		}
	}
	// mypageOAS:order_detail
	@Override
	public HashMap<String, Object> getOrderData(String order_number) {
		HashMap<String, Object> orderdata = null;
		try {			
			MypageMapper mypageMapper = sqlSession.getMapper(MypageMapper.class);
			orderdata = mypageMapper.getOrderData(order_number);
		} catch(Exception e) {
			System.out.println("ERROR(GoodluxeService/getOrderData) : " + e.getMessage());
		}
		return orderdata;
	}
	
	
	/* Item List */
	// Main Page Item List
	public ArrayList<HashMap<String, Object>> getMainPageItem() throws Exception{
		try {
			ProductlistMapper productlistMapper = sqlSession.getMapper(ProductlistMapper.class);
			
			ArrayList<HashMap<String, Object>> mainbolist = null;
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("startRow", 1); 
			map.put("endRow", 12);
		
			mainbolist = productlistMapper.getMainPageItem(map);
			
			return mainbolist;
			
		}catch(Exception e){
			System.out.println("ERROR(ProductlistService/getMainPageItem) : " + e.getMessage());
			throw new Exception("ERROR(ProductlistService/getMainPageItem)");
		}	
	}
	
	// Main Page Event Item List
	public ArrayList<HashMap<String, Object>> getMainPageItem_view() throws Exception{
		try {
			ProductlistMapper productlistMapper = sqlSession.getMapper(ProductlistMapper.class);
			
			ArrayList<HashMap<String, Object>> mainbolist_view = null;
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("startRow", 1); 
			map.put("endRow", 6); 
			
			mainbolist_view = productlistMapper.getMainPageItemView(map);
			
			return mainbolist_view;
			
		}catch(Exception e){
			System.out.println("ERROR(ProductlistService/getMainPageItem_view) : " + e.getMessage());
			throw new Exception("ERROR(ProductlistService/getMainPageItem_view)");
		}	
	}
	
	// Page Counting
	public int getSellingBoardCount(int startRow, int endRow ,String il_search_brand 
			,String il_search_category ,String il_search_grade ,String il_search_price) throws Exception{
		try {
			ProductlistMapper productlistMapper = sqlSession.getMapper(ProductlistMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("startRow", startRow);
			map.put("endRow", endRow);
			map.put("il_search_brand",il_search_brand);
			map.put("il_search_category",il_search_category);
			map.put("il_search_grade",il_search_grade);
			map.put("il_search_price",il_search_price);
			
			int count = productlistMapper.getSellingBoardCount(map);
			
			return count;
		}catch(Exception e) {
			System.out.println("ERROR(ProductlistService/getSellingBoardCount)" + e.getMessage());
			throw new Exception("ERROR(ProductlistService/getSellingBoardCount)");
		}
	}
	
	// Item List
	public ArrayList<HashMap<String, Object>> getSellingBoardProduct(int startRow, int endRow ,String il_search_brand 
			,String il_search_category ,String il_search_grade ,String il_search_price) throws Exception{
		
		try {
			ProductlistMapper productlistMapper = sqlSession.getMapper(ProductlistMapper.class);

			ArrayList<HashMap<String, Object>> sellbo_list = null;
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("startRow", startRow);
			map.put("endRow", endRow);
			map.put("il_search_brand",il_search_brand);
			map.put("il_search_category",il_search_category);
			map.put("il_search_grade",il_search_grade);
			map.put("il_search_price",il_search_price);
			
			sellbo_list = productlistMapper.SellingBoardProduct(map);
			
			return sellbo_list;
			
		}catch(Exception e){
			System.out.println("ERROR(ProductlistService/getSellingBoardProduct)" + e.getMessage());
			throw new Exception("ERROR(ProductlistService/getSellingBoardProduct)");
		}	
	}
	
	// search result page counting
	public int getSearchBoardCount(String search_content, String orderbywhat)throws Exception {
		try {
			ProductlistMapper productlistMapper = sqlSession.getMapper(ProductlistMapper.class);
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("content", search_content);
	
			int count = productlistMapper.getSearchBoardCount(map);
			return count;
		}catch(Exception e) {
			System.out.println("ERROR(ProductlistService/getSearchBoardCount) : " + e.getMessage());
			throw new Exception("ERROR(ProductlistService/getSearchBoardCount)");
		}
	}
	
	// Search Item List
	public ArrayList<HashMap<String, Object>> getSearchBoardProduct(int startRow, int endRow, String search_content, String orderbywhat)throws Exception {
		try {
			ProductlistMapper productlistMapper = sqlSession.getMapper(ProductlistMapper.class);
			
			ArrayList<HashMap<String, Object>> searchbolist_view = null;
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("startRow", startRow);
			map.put("endRow", endRow);
			map.put("content",search_content);
			map.put("orderbywhat", orderbywhat);
			
			searchbolist_view = productlistMapper.getSearchBoardList(map);
			
			return searchbolist_view;
		
		}catch(Exception e) {
			System.out.println("ERROR(ProductlistService/getSearchBoardProduct) : " + e.getMessage());
			throw new Exception("ERROR(ProductlistService/getSearchBoardProduct)");
		}
	}
	
	// MD Detail Information
	public HashMap<String, Object> getTheProduct(String entity_number)throws Exception {
		try {
			ProductlistMapper productlistMapper = sqlSession.getMapper(ProductlistMapper.class);
			
			HashMap<String, Object> theProduct =null;
			HashMap<String, String> map = new HashMap<String, String>();
			
			map.put("entityNo", entity_number);			
			theProduct = productlistMapper.getTheProduct(map);
			productlistMapper.viewCountPlus(map);
			
			return theProduct;
		}catch(Exception e) {
			System.out.println("ERROR(ProductlistService/getTheProduct) : " + e.getMessage());
			throw new Exception("ERROR(ProductlistService/getTheProduct)");
		}
	}
	// Related Item List
	public ArrayList<HashMap<String, Object>> getRecommand(String entity_number) throws Exception {
		try {
			ProductlistMapper productlistMapper = sqlSession.getMapper(ProductlistMapper.class);
			ArrayList<HashMap<String, Object>> recommandList = null;
			HashMap<String, String> map = new HashMap<String, String>();
			HashMap<String, String> theme = null;
			map.put("entity", entity_number);	
			theme = productlistMapper.getRecommandtheme(map);
			
			recommandList = productlistMapper.getRecommandList(theme);
			
			return recommandList;
		}catch(Exception e) {
			System.out.println("ERROR(ProductlistService/getTheProduct) : " + e.getMessage());
			throw new Exception("ERROR(ProductlistService/getTheProduct)");
		}
	}
}
