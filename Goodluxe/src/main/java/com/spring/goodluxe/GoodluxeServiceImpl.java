package com.spring.goodluxe;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.goodluxe.voes.ApplyVO;
import com.spring.goodluxe.voes.CouponVO;
import com.spring.goodluxe.voes.MemberVO;
import com.spring.goodluxe.voes.OrderVO;
import com.spring.goodluxe.voes.PointVO;
import com.spring.goodluxe.voes.ProductBoardVO;
import com.spring.goodluxe.voes.ProductVO;
import com.spring.mapper.AjaxMapper;
import com.spring.mapper.ApplyMapper;
import com.spring.mapper.CouponMapper;
import com.spring.mapper.MemberMapper;
import com.spring.mapper.MypageMapper;
import com.spring.mapper.OrderMapper;
import com.spring.mapper.PointMapper;
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
			System.out.println("ERRPR(GoodluxeService/isMemberLiked) : " + e.getMessage());
			throw new Exception("ERRPR(GoodluxeService/isMemberLiked)");
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
			System.out.println("ERRPR(GoodluxeService/setLike) : " + e.getMessage());
			throw new Exception("ERRPR(GoodluxeService/setLike)");
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
	
	// Find Entity Number
	public String findEnNum(int pb_number) throws Exception {
		String enNum = null;
		try {
			ProductlistMapper productlistMapper = sqlSession.getMapper(ProductlistMapper.class);
			
			enNum = productlistMapper.findEnNum(pb_number);
		}catch(Exception e) {
			System.out.println("ERROR(ProductlistService/findEnNum) : " + e.getMessage());
			throw new Exception("ERROR(ProductlistService/findEnNum)");
		}
		return enNum;
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
			theme.put("entity_number", entity_number);
			recommandList = productlistMapper.getRecommandList(theme);
			
			return recommandList;
		}catch(Exception e) {
			System.out.println("ERROR(ProductlistService/getTheProduct) : " + e.getMessage());
			throw new Exception("ERROR(ProductlistService/getTheProduct)");
		}
	}
	
	
	
	
	
	
	// Order Service
	// Get Member Information
	@Override
	public MemberVO selectMember(String member_id) throws Exception{
		MemberVO mvo = null;
		try {
			MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
			mvo = memberMapper.selectMember(member_id);
		}catch(Exception e) {
			System.out.println("ERROR(OrderService/selectMember) : " + e.getMessage());
			throw new Exception("ERROR(OrderService/selectMember)", e);
		}
		return mvo;
	}
	// Get Product Information
	@Override
	public ProductVO selectProduct(String entity_number) throws Exception{
		ProductVO pvo = null;
		try {
			OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
			pvo = orderMapper.selectProduct(entity_number);
		}catch(Exception e) {
			System.out.println("ERROR(OrderService/selectProduct) : " + e.getMessage());
			throw new Exception("ERROR(OrderService/selectProduct)", e);
		}
		return pvo;
	}
	// Get ProductBoard Information
	@Override
	public ProductBoardVO selectPB(String entity_number) throws Exception{
		ProductBoardVO pbvo = null;
		try {
			OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
			pbvo = orderMapper.selectPB(entity_number);
		}catch(Exception e) {
			System.out.println("ERROR(OrderService/selectPB) : " + e.getMessage());
			throw new Exception("ERROR(OrderService/selectPB)", e);
		}
		return pbvo;
	}
	// Coupon List
	@Override
	public ArrayList<CouponVO> selectCoupon(String member_id) throws Exception{
		ArrayList<CouponVO> coupon_list = null;
		try {
			CouponMapper couponMapper = sqlSession.getMapper(CouponMapper.class);
			coupon_list = couponMapper.selectCoupon(member_id);
			
			if(coupon_list != null) return coupon_list;
			
		}catch(Exception e) {
			System.out.println("ERROR(OrderService/selectCoupon) : " + e.getMessage());
			throw new Exception("ERROR(OrderService/selectCoupon)", e);
		}
		return null;
	}
	// Insert Order Information
	@Override
	public int insertOrder(OrderVO orderVO) throws Exception {
		int res = 0;
		try {
			OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
			res = orderMapper.insertOrder(orderVO);
			
			if(res == 1) {
				MypageMapper mypageMapper = sqlSession.getMapper(MypageMapper.class);
				mypageMapper.updatePBStatus(orderVO.getOrder_number(), "거래진행중");
			}
		}catch(Exception e) {
			System.out.println("ERROR(OrderService/insertOrder) : " + e.getMessage());
			throw new Exception("ERROR(OrderService/insertOrder)", e);
		}
		return res;
	}	
	// Insert Order Information(KAKAO)
	@Override
	public int insertKakaoOrder(OrderVO orderVO) throws Exception{
		int res = 0;
		try {
			OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
			res = orderMapper.insertKakaoOrder(orderVO);
			
			if(res == 1) {
				MypageMapper mypageMapper = sqlSession.getMapper(MypageMapper.class);
				mypageMapper.updatePBStatus(orderVO.getOrder_number(), "거래진행중");
			}
		}catch(Exception e) {
			System.out.println("ERROR(OrderService/insertKakaoOrder) : " + e.getMessage());
			throw new Exception("ERROR(OrderService/insertKakaoOrder)", e);
		}
		return res;
	}
	// Apply Used Point
	@Override
	public void updateMemberpoint(MemberVO memberVO) throws Exception{
		int cnt = 0;
		try {
			MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
			cnt = memberMapper.updateMemberpoint(memberVO);
		}catch(Exception e) {
			System.out.println("ERROR(OrderService/updateMemberpoint) : " + e.getMessage());
			throw new Exception("ERROR(OrderService/updateMemberpoint)", e);
		}
		if(cnt == 0) {
			System.out.println("WARNING> 포인트 사용 내역 반영 실패(현재 포인트 : " + memberVO.getMember_point() + ")");
		}
	}
	// Order_done 페이지에 띄울 정보
	@Override
	public OrderVO selectOrder(OrderVO vo) throws Exception{
		OrderVO ovo = null;
		try {
			OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
			ovo = orderMapper.selectOrder(vo);
		}catch(Exception e) {
			throw new Exception("주문정보 검색 실패.", e);
		}
		return ovo;
	}
	// 포인트 사용시 히스토리 추가
	@Override
	public void insertPointHistory(PointVO pointVO) throws Exception{
		try {
			PointMapper pointMapper = sqlSession.getMapper(PointMapper.class);
			pointMapper.insertPointHistory(pointVO);
		}catch(Exception e) {
			throw new Exception("포인트 히스토리 추가 실패.", e);
		}
	}
	// 쿠폰 사용 주문시 쿠폰 상태 사용으로 변경
	@Override
	public void updateCouponstatus(CouponVO couponVO) throws Exception{
		try {
			CouponMapper couponMapper = sqlSession.getMapper(CouponMapper.class);
			couponMapper.updateCouponstatus(couponVO);
		}catch(Exception e) {
			throw new Exception("쿠폰상태변경 실패. ", e);
		}
	}

	// 포인트 리스트 가져오기
	@Override
	public ArrayList<PointVO> getPointList(String member_id, int startRow, int endRow) throws Exception{
		ArrayList<PointVO> point_list = null;
		try {
			HashMap<String, Object> pvo = new HashMap<String, Object>();
			pvo.put("member_id", member_id);
			pvo.put("startRow", startRow);
			pvo.put("endRow", endRow);
			
			PointMapper pointMapper =sqlSession.getMapper(PointMapper.class);
			point_list = pointMapper.getPointList(pvo);
			
			if(point_list != null) {
				return point_list;
			}else {
				return null;
			}
		}catch(Exception e) {
			throw new Exception("포인트 리스트 불러오기 실패.", e);
		}
	}
	
	// 포인트 리스트 개수
	@Override
	public int getListCount(String member_id) throws Exception{
		int count = 0;
		PointMapper pointMapper = sqlSession.getMapper(PointMapper.class);
		try {
			count = pointMapper.getListCount(member_id);
		}
		catch (Exception e) { 
			System.out.println("포인트 리스트 카운트 실패." + e.getMessage());
		}
		return count;
	}
	
	// 쿠폰 리스트 가져오기
	@Override
	public ArrayList<CouponVO> getCouponList(String member_id, int startRow, int endRow) throws Exception{
		ArrayList<CouponVO> coupon_list = null;
		try {
			HashMap<String, Object> cvo = new HashMap<String, Object>();
			cvo.put("member_id", member_id);
			cvo.put("startRow", startRow);
			cvo.put("endRow", endRow);
			
			CouponMapper couponMapper =sqlSession.getMapper(CouponMapper.class);
			coupon_list = couponMapper.getCouponList(cvo);
			
			if(coupon_list != null) {
				return coupon_list;
			}else {
				return null;
			}
		}catch(Exception e) {
			throw new Exception("쿠폰 리스트 불러오기 실패.", e);
		}
	}
	
	// 쿠폰리스트 개수
	@Override
	public int getCouponListCount(String member_id) throws Exception{
		int count = 0;
		CouponMapper couponMapper = sqlSession.getMapper(CouponMapper.class);
		try {
			count = couponMapper.getCouponListCount(member_id);
		}
		catch (Exception e) { 
			System.out.println("쿠폰 리스트 카운트 실패." + e.getMessage());
		}
		return count;
	}
	
	// 기간만료시 쿠폰상태 변경
	@Override
	public void updateCouponExstatus(CouponVO couponVO) throws Exception{
		try {
			CouponMapper couponMapper = sqlSession.getMapper(CouponMapper.class);
			couponMapper.updateCouponExstatus(couponVO);
		}catch(Exception e) {
			throw new Exception("쿠폰 기간만료 상태변경 실패. ", e);
		}
	}
	
	// 구매제한 페이지에 띄울 order리스트 불러오기
	@Override
	public ArrayList<HashMap<String, Object>> getOrderList(String member_id) throws Exception{
		ArrayList<HashMap<String,Object>> order_list = null;
		try {
			// 주문상태 파라미터로 가져가야
			
			OrderMapper orderMapper =sqlSession.getMapper(OrderMapper.class);
			order_list = orderMapper.getOrderList(member_id);
			
			if(order_list != null) {
				return order_list;
			}else {
				return null;
			}
		}catch(Exception e) {
			throw new Exception("주문 리스트 불러오기 실패.", e);
		}
	}
	
	// 매입 위탁 데이터 입력
	@Override
	public void insertApplyGoods(ApplyVO applyVO) throws Exception{
		try {
			ApplyMapper applyMapper = sqlSession.getMapper(ApplyMapper.class);
			applyMapper.insertApplyGoods(applyVO);
				
		}catch(Exception e) {
			throw new Exception("매입 위탁판매 등록 실패. ", e);
		}
	}
	
	// 위탁상품 등록전 상품 리스트 가져오기
	@Override
	public ArrayList<ApplyVO> getApplyList(String member_id) throws Exception{
		ArrayList<ApplyVO> apply_list = null;
		try {
			HashMap<String,String> map = new HashMap<String,String>();
			map.put("member_id", member_id);
			map.put("ap_smethod", "위탁판매");
			
			
			ApplyMapper applyMapper =sqlSession.getMapper(ApplyMapper.class);
			apply_list = applyMapper.getApplyList(map);
			
			if(apply_list != null) {
				return apply_list;
			}else {
				return null;
			}
		}catch(Exception e) {
			throw new Exception("등록전 위탁상품 리스트 불러오기 실패.", e);
		}
	}
	// 판매조회 판매중 리스트
		public ArrayList<HashMap<String,Object>> getSellingList(String member_id) throws Exception{
			ArrayList<HashMap<String,Object>> sellingList = null;
			try {
				
				ApplyMapper applyMapper =sqlSession.getMapper(ApplyMapper.class);
				sellingList = applyMapper.getSellingList(member_id);
				
				if(sellingList != null) {
					return sellingList;
				}else {
					return null;
				}
				
			}catch(Exception e) {
				throw new Exception("판매중 위탁상품 리스트 불러오기 실패.", e);
			}
		}
	// 판매조회 거래진행중 리스트
		public ArrayList<HashMap<String,Object>> getTradingList(String member_id) throws Exception{
			ArrayList<HashMap<String,Object>> tradingList = null;
			try {
				
				ApplyMapper applyMapper =sqlSession.getMapper(ApplyMapper.class);
				tradingList = applyMapper.getTradingList(member_id);
				
				if(tradingList != null) {
					return tradingList;
				}else {
					return null;
				}
				
			}catch(Exception e) {
				throw new Exception("거래진행중 위탁상품 리스트 불러오기 실패.", e);
			}
		}
	// 판매조회 판매완료 리스트
		public ArrayList<HashMap<String,Object>> getFinishList(String member_id) throws Exception{
			ArrayList<HashMap<String,Object>> finishList = null;
			try {
				ApplyMapper applyMapper =sqlSession.getMapper(ApplyMapper.class);
				finishList = applyMapper.getFinishList(member_id);
				
				if(finishList != null) {
					return finishList;
				}else {
					return null;
				}
				
			}catch(Exception e) {
				throw new Exception("판매완료 위탁상품 리스트 불러오기 실패.", e);
			}
		}
	
	// 판매조회 매입상품 리스트
		public ArrayList<HashMap<String,Object>> getPurchasingList(String member_id) throws Exception{
			ArrayList<HashMap<String,Object>> purchasingList = null;
			try {
				ApplyMapper applyMapper =sqlSession.getMapper(ApplyMapper.class);
				purchasingList = applyMapper.getPurchasingList(member_id);
				
				if(purchasingList != null) {
					return purchasingList;
				}else {
					return null;
				}
			}catch(Exception e) {
				throw new Exception("매입상품 리스트 불러오기 실패.", e);
			}
		}
}
