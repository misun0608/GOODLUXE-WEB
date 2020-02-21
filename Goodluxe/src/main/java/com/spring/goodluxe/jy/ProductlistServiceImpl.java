package com.spring.goodluxe.jy;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.goodluxe.voes.ConsignProductVO;
import com.spring.goodluxe.voes.CouponVO;
import com.spring.goodluxe.voes.MemberVO;
import com.spring.goodluxe.voes.ProductBoardVO;
import com.spring.goodluxe.voes.PurchaseProductVO;
import com.spring.mapper.ProductlistMapper;

@Service("productlistService")
public class ProductlistServiceImpl implements ProductlistService{
	
	@Autowired
	private SqlSession sqlSession;
	
	public int registerProduct(PurchaseProductVO purcVO) throws Exception {
		try {
			ProductlistMapper productlistMapper = sqlSession.getMapper(ProductlistMapper.class);
			
			int res = productlistMapper.insertPurcProduct(purcVO);
			
			return res;
		}catch(Exception e) {
			System.out.println("ERROR(ProductlistService/registerProduct/purcVO) : " + e.getMessage());
			System.out.println("ERROR(ProductlistService/registerProduct/purcVO) : " + e.getStackTrace());
			throw new Exception("ERROR(ProductlistService/registerProduct/purcVO)");
		}
		
	}



	@Override
	public int registerProduct(ConsignProductVO consVO)  throws Exception{
		try {
			ProductlistMapper productlistMapper = sqlSession.getMapper(ProductlistMapper.class);
		
			int res = productlistMapper.insertConsProduct(consVO);
		
			return res;
		}catch(Exception e) {
			System.out.println("ERROR(ProductlistService/registerProduct/consVO) : " + e.getMessage());
			System.out.println("ERROR(ProductlistService/registerProduct/consVO) : " + e.getStackTrace());
			throw new Exception("ERROR(ProductlistService/registerProduct/consVO)");
		}
		
	}


	@Override
	public int uploadProductBoard(ProductBoardVO sellboVO) throws Exception {
		try {
			ProductlistMapper productlistMapper = sqlSession.getMapper(ProductlistMapper.class);
		
			sellboVO.setPb_sale_status("판매중");
			sellboVO.setPb_view_count(0);
			sellboVO.setPb_like(0);
			if(sellboVO.getPb_division().equals("purchase")) {
				productlistMapper.setPurcSaleStatus(sellboVO);
			}else if(sellboVO.getPb_division().equals("consign")) {
				productlistMapper.setConsSaleStatus(sellboVO);
			}
				
			int res = productlistMapper.insertSellingBoard(sellboVO);
		
			return res;
		}catch(Exception e) {
			System.out.println("ERROR(ProductlistService/uploadProductBoard) : " + e.getMessage());
			System.out.println("ERROR(ProductlistService/uploadProductBoard) : " + e.getStackTrace());
			throw new Exception("ERROR(ProductlistService/uploadProductBoard)");
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


	public ArrayList<HashMap<String, Object>> getMainPageProduct(int startRow, int endRow ,String il_search_brand 
			,String il_search_category ,String il_search_grade ,String il_search_price) throws Exception{
		
		try {
			ProductlistMapper productlistMapper = sqlSession.getMapper(ProductlistMapper.class);

			ArrayList<HashMap<String, Object>> sellbo_list = null;
			//HashMap<String, Object> sellbo_list = null;
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
			System.out.println("�޼���" + e.getMessage());
			System.out.println("����" + e.getStackTrace());
			throw new Exception("������ ������ �̸� �ҷ����� ����");
		}	
	}
	
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
			System.out.println("ERROR(ProductlistService/getMainPageItem) : " + e.getStackTrace());
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
			System.out.println("ERROR(ProductlistService/getMainPageItem_view) : " + e.getStackTrace());
			throw new Exception("ERROR(ProductlistService/getMainPageItem_view)");
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
			
			System.out.println("엔티티 = "+entity_number);
			
			HashMap<String, String> map = new HashMap<String, String>();
			HashMap<String, String> theme = new HashMap<String, String>();
			map.put("entity", entity_number);	
			theme = productlistMapper.getRecommandtheme(map);
			
			System.out.println("테마 = " + theme.get("pb_category"));
			//theme.put("entity_number", entity_number);
			recommandList = productlistMapper.getRecommandList(theme);
			
			return recommandList;
		}catch(Exception e) {
			System.out.println("ERROR(ProductlistService/getTheProduct) : " + e.getMessage());
			throw new Exception("ERROR(ProductlistService/getTheProduct)");
		}
	}



	public MemberVO adminSearchID(String string, String member_id) throws Exception {
		
		try {
			ProductlistMapper productlistMapper = sqlSession.getMapper(ProductlistMapper.class);
			HashMap<String, String> map = new HashMap<String, String>();
			MemberVO memberVO = new MemberVO();
			map.put("member_id", member_id);
			
			int nullChk = productlistMapper.countOneMember(map);
			if(nullChk==0) {
				return null;
			}else {
				memberVO = productlistMapper.adminSearchId(map);
				return memberVO;
			}
		}catch(Exception e) {
			System.out.println("ERROR(ProductlistService/adminSearchId) : " + e.getMessage());
			throw new Exception("ERROR(ProductlistService/adminSearchId)");
		}
	}

	public int issueAllmemberCoupon(CouponVO couponVO) throws Exception {
		ProductlistMapper productlistMapper = sqlSession.getMapper(ProductlistMapper.class);
		try {
			ArrayList<HashMap<String,String>>allIds = null;
			allIds = productlistMapper.selectAllMember();
			
			System.out.println( " 1 "+ allIds.get(0).get("member_id"));
			System.out.println( " 2 "+ allIds.get(1).get("member_id"));
			System.out.println( " 3 "+ allIds.get(2).get("member_id"));
			
			
			for(int i = 0 ; i<allIds.size(); i++) {
				couponVO.setMember_id(allIds.get(i).get("member_id"));
				System.out.println("couponVO.getCoupon_type()="+couponVO.getCoupon_type());
				productlistMapper.issueAllmemberCoupon(couponVO);
			}
			
		}catch(Exception e) {
			System.out.println("ERROR(ProductlistService/issueAllmemberCoupon) : " + e.getMessage());
			throw new Exception("ERROR(ProductlistService/ issueAllmemberCoupon)");
		}
		return 0;
		
		
	}

	public int issueOnememberCoupon(CouponVO couponVO) throws Exception {
		ProductlistMapper productlistMapper = sqlSession.getMapper(ProductlistMapper.class);
		try {
		
			int res = productlistMapper.issueOnememberCoupon(couponVO);
			return res;
			
		}catch(Exception e) {
			System.out.println("ERROR(ProductlistService/issueOnememberCoupon) : " + e.getMessage());
			throw new Exception("ERROR(ProductlistService/ issueOnememberCoupon)");
		}
		
	}
	public HashMap<String,String> getShippingInfo(String order_number)throws Exception {
		ProductlistMapper productlistMapper = sqlSession.getMapper(ProductlistMapper.class);
		try {
		
			HashMap<String, String> shipping_info = productlistMapper.getShippingInfo(order_number);
			return shipping_info;
			
		}catch(Exception e) {
			System.out.println("ERROR(ProductlistService/getShippingInfo) : " + e.getMessage());
			throw new Exception("ERROR(ProductlistService/ getShippingInfo)");
		}
	}

	public void preChgReadStatus(String alarm_number) throws Exception{
		ProductlistMapper productlistMapper = sqlSession.getMapper(ProductlistMapper.class);
		try {
			System.out.println("알람넘버 "+alarm_number);
			System.out.println("안들어왔니???");
			productlistMapper.preChgReadStatus(alarm_number);
			
		}catch(Exception e) {
			System.out.println("ERROR(ProductlistService/preChgReadStatus) : " + e.getMessage());
			throw new Exception("ERROR(ProductlistService/ preChgReadStatus)");
		}
		
	}
	

	
	

}
