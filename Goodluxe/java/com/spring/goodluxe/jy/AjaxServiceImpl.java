package com.spring.goodluxe.jy;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.goodluxe.voes.CouponVO;
import com.spring.goodluxe.voes.OrderVO;
import com.spring.mapper.AjaxMapper;

@Service("ajaxService")
public class AjaxServiceImpl implements AjaxService{

	@Autowired 
	private SqlSession sqlSession;
	
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
	public int setLike(String member_id, String entity_number)throws Exception {
		int data = 0;
		try {
			AjaxMapper ajaxMapper = sqlSession.getMapper(AjaxMapper.class);
			HashMap<String,String>map = new HashMap<String,String>();
			map.put("id", member_id);
			map.put("entity",entity_number);
			
			int res = ajaxMapper.isAlreadyLiked(map);
			
			if(res==0) {
				//좋아요 추가
				ajaxMapper.insertLikedUser(map);
				ajaxMapper.increaseLike(map);
				data=1;
			}
			else {
				//좋아요 삭제
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
	
	
	@Override
	public ArrayList<CouponVO> defaultCouponList() throws Exception{
		
		try {

			ArrayList<CouponVO> couponList = null;
			AjaxMapper ajaxMapper = sqlSession.getMapper(AjaxMapper.class);

			couponList = ajaxMapper.defaultCouponList();

			return couponList;

		} catch (Exception e) {
			System.out.println("ERRPR(AjaxService/allmemberCouponList) : " + e.getMessage());
			throw new Exception("ERRPR(AjaxService/allmemberCouponList)");
		}
	
	}
	public ArrayList<CouponVO> allmemberCouponList(CouponVO couponVO)throws Exception {
		try {
			
			ArrayList<CouponVO> couponList = null;
			AjaxMapper ajaxMapper = sqlSession.getMapper(AjaxMapper.class);
			
			couponList = ajaxMapper.allmemberCouponList(couponVO);
			
			return couponList;
			
		}catch(Exception e) {
			System.out.println("ERRPR(AjaxService/allmemberCouponList) : " + e.getMessage());
			throw new Exception("ERRPR(AjaxService/allmemberCouponList)");
		}
	}
	
	@Override
	public ArrayList<CouponVO> onememberCouponList(CouponVO couponVO) throws Exception {
try {
			ArrayList<CouponVO> couponList = null;
			AjaxMapper ajaxMapper = sqlSession.getMapper(AjaxMapper.class);
			
			couponList = ajaxMapper.onememberCouponList(couponVO);
			
			return couponList;
			
		}catch(Exception e) {
			System.out.println("ERRPR(AjaxService/allmemberCouponList) : " + e.getMessage());
			throw new Exception("ERRPR(AjaxService/allmemberCouponList)");
		}
	}
	@Override
	public void deleteCouponList(String[] deletethis) throws Exception {
		try {
			AjaxMapper ajaxMapper = sqlSession.getMapper(AjaxMapper.class);
			HashMap<String, String>map = new HashMap<String,String>();
			
			
			for(int i = 0; i<deletethis.length ; i++) {
				map.put("coupon_number", deletethis[i]);
				ajaxMapper.deleteCouponList(map);
			}
			
		}catch(Exception e) {
			System.out.println("ERRPR(AjaxService/deleteCouponList) : " + e.getMessage());
			throw new Exception("ERRPR(AjaxService/deleteCouponList)");
		}
	}
	
	
	@Override
	public ArrayList<HashMap<String, String>> getAllMemberinfo() throws Exception {
		try {
			AjaxMapper ajaxMapper = sqlSession.getMapper(AjaxMapper.class);
			
			ArrayList<HashMap<String,String>>memberList = null;
			memberList = ajaxMapper.getAllMemberinfo();
			
			return memberList;
			
		}catch(Exception e) {
			System.out.println("ERRPR(AjaxService/deleteCouponList) : " + e.getMessage());
			throw new Exception("ERRPR(AjaxService/deleteCouponList)");
		}
	}
	@Override
	public HashMap<String, String> getMemberinfo(String member_id) throws Exception {
		
		try {
			AjaxMapper ajaxMapper = sqlSession.getMapper(AjaxMapper.class);
			
			HashMap<String,String>memberHM = null;
			HashMap<String, String>map = new HashMap<String,String>();

			map.put("member_id", member_id);
			memberHM = ajaxMapper.getAMemberinfo(map);
			return memberHM;
			
		}catch(Exception e) {
			System.out.println("ERRPR(AjaxService/deleteCouponList) : " + e.getMessage());
			throw new Exception("ERRPR(AjaxService/deleteCouponList)");
		}
	}
	@Override
	public String setBlackClass(String member_id) throws Exception {
		try {
			AjaxMapper ajaxMapper = sqlSession.getMapper(AjaxMapper.class);
			HashMap<String, String>map = new HashMap<String,String>();

			map.put("member_id",member_id);
			System.out.println("나");
			String witchClass = ajaxMapper.isBlack(map);
			System.out.println("클래스" + witchClass);
			int res;
			String data ="O";
			if( witchClass.equals("B")){
				res = ajaxMapper.setWhiteClass(map);
				System.out.println("화이트첵");
				if(res==1) {
					System.out.println("화이트첵1");
					data="B";
				}
			}else {
				res = ajaxMapper.setBlackClass(map);
				System.out.println("블랙첵");
				if(res==1) {
					data="Y";
					System.out.println("블랙첵1");
				}
			}
			System.out.println("다");
			return data;
		}catch(Exception e) {
			System.out.println("ERRPR(AjaxService/deleteCouponList) : " + e.getMessage());
			throw new Exception("ERRPR(AjaxService/deleteCouponList)");
		}
	}
	@Override
	public ArrayList<OrderVO> getAllOrderList() throws Exception {
		
		try {
			ArrayList<OrderVO> orderList = null; 
			AjaxMapper ajaxMapper = sqlSession.getMapper(AjaxMapper.class);
			orderList = ajaxMapper.getAllOrderList();
			
			return orderList;
		}catch(Exception e) {
			System.out.println("ERRPR(AjaxService/getAllOrderList) : " + e.getMessage());
			throw new Exception("ERRPR(AjaxService/getAllOrderList)");
		}
		
	}
	@Override
	public ArrayList<OrderVO> getOrderList(HashMap<String, Object> map)throws Exception{
		
		try {
			ArrayList<OrderVO> orderList = null; 
			AjaxMapper ajaxMapper = sqlSession.getMapper(AjaxMapper.class);
			orderList = ajaxMapper.getOrderList(map);
			
			return orderList;
		}catch(Exception e) {
			System.out.println("ERRPR(AjaxService/getOrderList) : " + e.getMessage());
			throw new Exception("ERRPR(AjaxService/getOrderList)");
		}
	}
	
	@Override
	public int orderChangeStatusStartShipping(String[] chked_change_me)throws Exception {
		try {
			AjaxMapper ajaxMapper = sqlSession.getMapper(AjaxMapper.class);
			int res = 0, count = 0;
			String chked;
			for(int i = 0; i<chked_change_me.length; i++) {
				chked = chked_change_me[i];
				res = ajaxMapper.orderChangeStatusStartShipping(chked);
				if(res == 0) {System.out.println(i+"번째 입력실패");}
				else {count++;}
			}
			//ajaxMapper.orderChangeStatusStartShipping()
			return count;
		}catch(Exception e) {
			System.out.println("ERRPR(AjaxService/orderChangeStatusStartShipping) : " + e.getMessage());
			throw new Exception("ERRPR(AjaxService/orderChangeStatusStartShipping)");
		}
		
	}
	@Override
	public int adminOrderSetStartShipping(HashMap<String, String> map) throws Exception {
		try {
			AjaxMapper ajaxMapper = sqlSession.getMapper(AjaxMapper.class);
		
			int res = ajaxMapper.adminOrderSetStartShipping(map);
			
			return res;
			
			
		}catch(Exception e) {
			System.out.println("ERRPR(AjaxService/adminOrderSetEndShipping) : " + e.getMessage());
			throw new Exception("ERRPR(AjaxService/adminOrderSetEndShipping)");
		}
	}
	
	@Override
	public int adminOrderSetEndShipping(String order_number)throws Exception {
		try {
			AjaxMapper ajaxMapper = sqlSession.getMapper(AjaxMapper.class);
		
			int res = ajaxMapper.adminOrderSetEndShipping(order_number);
			
			return res;
			
			
		}catch(Exception e) {
			System.out.println("ERRPR(AjaxService/adminOrderSetEndShipping) : " + e.getMessage());
			throw new Exception("ERRPR(AjaxService/adminOrderSetEndShipping)");
		}
	}
	
	
	
	
	@Override
	public ArrayList<HashMap<String, Object>> adminAllProductList(String pb_division)throws Exception {

		try {
			ArrayList<HashMap<String,Object>> productList = null;
			AjaxMapper ajaxMapper = sqlSession.getMapper(AjaxMapper.class);
			
			if(pb_division.equals("purchase")) {
				productList = ajaxMapper.adminAllProductListPurchase();
			}
			else { //(pb_division.equals("consign")
				productList = ajaxMapper.adminAllProductListConsign();
				System.out.println(productList.get(0).get("pd_name"));
			}
			
			System.out.println("entity는?"+productList.get(0).get("entity_number"));
			System.out.println("프라이스"+productList.get(0).get("sale_price"));
			return productList;
		}catch(Exception e) {
			System.out.println("ERRPR(AjaxService/adminAllProductList) : " + e.getMessage());
			throw new Exception("ERRPR(AjaxService/adminAllProductList)");
		}
	}
	@Override
	public ArrayList<HashMap<String, Object>> adminProductList(HashMap<String, String> map) throws Exception {
		try {
			ArrayList<HashMap<String,Object>> productList = null;
			AjaxMapper ajaxMapper = sqlSession.getMapper(AjaxMapper.class);
			System.out.println("맵"+map.get("entity_number"));
			
			
			if(map.get("entity_number").equals("")) {
				if(map.get("pb_division").equals("purchase")) {
					productList = ajaxMapper.adminProductListPurc(map);
				}else {
					productList = ajaxMapper.adminProductListCons(map);
				}
			}else {
				System.out.println("entity_Not_null");
				if(map.get("pb_division").equals("purchase")) {
					productList = ajaxMapper.adminProductListPurcEnNo(map);
				}else {
					productList = ajaxMapper.adminProductListConsEnNo(map);
				}
			}
			
			return productList;
		}catch(Exception e) {
			System.out.println("ERRPR(AjaxService/adminAllProductList) : " + e.getMessage());
			throw new Exception("ERRPR(AjaxService/adminAllProductList)");
		}
	}
	@Override
	public int adminProductSetPostStatus(String[] chked_post_status) throws Exception {
		try {
			AjaxMapper ajaxMapper = sqlSession.getMapper(AjaxMapper.class);
			int res = 0, count = 0;
			String chked;
			String oneStatus;
			for(int i = 0; i<chked_post_status.length; i++) {
				chked = chked_post_status[i];
				oneStatus = ajaxMapper.checkNowPostStatus(chked);
				System.out.println("ontStatus"+oneStatus);
				if(oneStatus.equals("게시중")) {
					res = ajaxMapper.changeOffBoard(chked);
				}else {
					res = ajaxMapper.changeOnBoard(chked);
				}
				if(res == 0) {System.out.println(i+"번째 입력실패");}
				else {count++;}
			}
			return count;
		}catch(Exception e) {
			System.out.println("ERRPR(AjaxService/adminProductSetPostStatus) : " + e.getMessage());
			throw new Exception("ERRPR(AjaxService/adminProductSetPostStatus)");
		}
	}
	@Override
	public void postStatChange(String entity_number)throws Exception {
		try {
			AjaxMapper ajaxMapper = sqlSession.getMapper(AjaxMapper.class);
			
			String entity_chk = ajaxMapper.checkNowPostStatus(entity_number);
			System.out.println("엔티티췍~~"+entity_chk);
			if(entity_chk.equals("게시중")) {
				ajaxMapper.changeOffBoard(entity_number);
			}else {
				ajaxMapper.changeOnBoard(entity_number);
			}	
		}catch(Exception e) {
			System.out.println("ERRPR(AjaxService/postStatChange) : " + e.getMessage());
			throw new Exception("ERRPR(AjaxService/postStatChange)");
		}
	}
	
	
	@Override
	public void saleStatChange(String entity_number)throws Exception {
		try {
			AjaxMapper ajaxMapper = sqlSession.getMapper(AjaxMapper.class);
			
			String entity_chk = ajaxMapper.checkNowSaleStatus(entity_number);
			
			if(entity_chk.equals("판매중")) {
				ajaxMapper.chgSaleStatOnsale(entity_number);
			}else if(entity_chk.equals("거래진행중")) {
				ajaxMapper.chgSaleStatOndeal(entity_number);
			}else {//판매완료일때
				ajaxMapper.chgSaleStatSoldout(entity_number);
			}
		}catch(Exception e) {
			System.out.println("ERRPR(AjaxService/postStatChange) : " + e.getMessage());
			throw new Exception("ERRPR(AjaxService/postStatChange)");
		}
		
	}
	@Override
	public void deleteProductList(String[] delete_this) throws Exception{
		
		try {
			AjaxMapper ajaxMapper = sqlSession.getMapper(AjaxMapper.class);
			HashMap<String, String>map = new HashMap<String,String>();
			
			String division ;
			int res;
			
			
			for(int i = 0; i<delete_this.length ; i++) {
				map.put("entity_number", delete_this[i]);
				division = ajaxMapper.getDivision(map);
				if( division.equals("purchase")) {
					res = ajaxMapper.deletePurchaseInfo(map);
				}else{
					res = ajaxMapper.deleteConsignmentInfo(map);
				}
				
				if(res!=0) {
					ajaxMapper.deleteProductList(map);
				}
			}
		}catch(Exception e) {
			System.out.println("ERRPR(AjaxService/deleteCouponList) : " + e.getMessage());
			throw new Exception("ERRPR(AjaxService/deleteCouponList)");
		}
		
	}

	
	
	
	

	
}
