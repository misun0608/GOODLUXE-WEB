package com.spring.goodluxe.ms;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.goodluxe.voes.MemberVO;
import com.spring.goodluxe.voes.OrderVO;
import com.spring.goodluxe.voes.PointVO;
import com.spring.mapper.AdminPointMapper;
import com.spring.mapper.MemberMapper;
import com.spring.mapper.ProductlistMapper;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public ArrayList<PointVO> getAdminPointList() throws Exception {
		ArrayList<PointVO> point_list = null;
		try {
			AdminPointMapper adminpointmapper = sqlSession.getMapper(AdminPointMapper.class);
			point_list = adminpointmapper.getAdminPointList();

		} catch (Exception e) {
			System.out.println("ERROR(AdminService/defaultPointList) : " + e.getMessage());
			throw new Exception("ERROR(AdminService/defaultPointList)");
		}
		return point_list;
	}

	@Override
	public ArrayList<PointVO> getSearchPointList(PointVO pvo) throws Exception {
		ArrayList<PointVO> point_list = null;
		try {
			AdminPointMapper adminpointmapper = sqlSession.getMapper(AdminPointMapper.class);
			point_list = adminpointmapper.getSearchPointList(pvo);

		} catch (Exception e) {
			System.out.println("ERROR(AdminService/getSearchPointList) : " + e.getMessage());
			throw new Exception("ERROR(AdminService/getSearchPointList)");
		}
		return point_list;
	}

	// 적립일 때
	@Override
	public void insertPointStatus(PointVO pvo, HttpServletResponse response) throws Exception {
		int res = 0;
		try {
			MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
			MemberVO mvo = memberMapper.selectMemberPoint(pvo);
			// 멤버테이블에 아이디가 있을 경우
			if (mvo != null) {
				AdminPointMapper adminpointMapper = sqlSession.getMapper(AdminPointMapper.class);
				// 포인트 업데이트
				res = adminpointMapper.insertPointStatus(pvo);

				if (res != 0) {
					// 멤버 포인트 변경 계산
					int current_point = mvo.getMember_point();
					int get_point = pvo.getPoint_amount();
					mvo.setMember_point(current_point + get_point);
					System.out.println("멤버 포인트" + mvo.getMember_point());

					HashMap<String, Object> map = new HashMap<String, Object>();
					map.put("member_point", mvo.getMember_point());
					map.put("member_id", pvo.getMember_id());

					int result = memberMapper.updateMemberPoint(map);

					if (result != 0) {
						// 테스트
						String originalStr = "Å×½ºÆ®"; // 테스트 
						String [] charSet = {"utf-8","euc-kr","ksc5601","iso-8859-1","x-windows-949"};
						  
						for (int i=0; i<charSet.length; i++) {
						 for (int j=0; j<charSet.length; j++) {
						  try {
						   System.out.println("[" + charSet[i] +"," + charSet[j] +"] = " + new String(originalStr.getBytes(charSet[i]), charSet[j]));
						  } catch (Exception e) {
						   e.printStackTrace();
						  }
						 }
						}
						System.out.println("포인트 적립 업데이트 성공!");
					} else {
						System.out.println("포인트 적립 업데이트 실패!");
					}
				}
			} else {
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('아이디가 존재하지 않습니다!');</script>");
				out.flush();
			}

		} catch (Exception e) {
			System.out.println("ERROR(AdminService/insertPointStatus) : " + e.getMessage());
			throw new Exception("ERROR(AdminService/insertPointStatus)");
		}
	}

	// 회수일때
	@Override
	public void minusPointStatus(PointVO pvo, HttpServletResponse response) throws Exception {
		int res = 0;
		try {
			MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
			MemberVO mvo = memberMapper.selectMemberPoint(pvo);
			
			// 회수당해야할 포인트 amount
			int get_point = pvo.getPoint_amount();

			// 멤버테이블에 아이디가 있을 경우
			if (mvo != null) {
				int current_point = mvo.getMember_point();
				// 현재 가지고 있는 포인트보다 많이 회수 시킬 경우 -> 가지고 있는 모든 포인트 회수
				if(current_point < get_point) {
					pvo.setPoint_amount(mvo.getMember_point());
					get_point = pvo.getPoint_amount();
				}

				AdminPointMapper adminpointMapper = sqlSession.getMapper(AdminPointMapper.class);
				// 포인트 업데이트
				res = adminpointMapper.insertPointStatus(pvo);

				HashMap<String, Object> map = new HashMap<String, Object>();
				if (res != 0) {
					
					mvo.setMember_point(current_point - get_point);
					System.out.println("멤버 포인트" + mvo.getMember_point());

					map.put("member_point", mvo.getMember_point());
					map.put("member_id", pvo.getMember_id());

					int result = memberMapper.updateMemberPoint(map);

					if (result != 0) {
						System.out.println("포인트 회수 업데이트 성공!");
					} else {
						System.out.println("포인트 회수 업데이트 실패!");
					}
				}
			} else {
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('아이디가 존재하지 않습니다!');</script>");
				out.flush();
			}
		} catch (Exception e) {
			System.out.println("ERROR(AdminService/minusPointStatus) : " + e.getMessage());
			throw new Exception("ERROR(AdminService/minusPointStatus)");
		}
	}
	
	@Override
	public HashMap<String,Object> getTodayOrderCount() throws Exception{
		HashMap<String,Object> map = new HashMap<String,Object>();
		int order_count = 0;	// 주문건수
		int order_sales = 0;	// 주문액
		int paid_order_count = 0;	// 결제건수
		int paid_order_sales = 0;	// 결제액
		int refund_order_count = 0;	// 환불건수
		int refund_order_sales = 0;	// 환불액
		int paid_before_count = 0;	// 한달 결제전 주문
		int prepared_count = 0;	// 한달 결제전 주문
		int shipping_count = 0;	// 한달 결제전 주문
		int done_count = 0;	// 한달 결제전 주문
		int cancel_count = 0;	// 한달 취소
		int item_back_count = 0;	// 반품
		int refund_count = 0;	// 환불
		
		try {
			AdminPointMapper adminpointMapper = sqlSession.getMapper(AdminPointMapper.class);
			order_count = adminpointMapper.getTodayOrderCount();
			paid_order_count = adminpointMapper.getTodayPaidOrderCount();
			refund_order_count = adminpointMapper.getTodayRefundOrderCount();
			ArrayList<OrderVO> order_sales_list = adminpointMapper.getTodayOrderSales();
			for(int i=0; i<order_sales_list.size(); i++) {
				OrderVO ovo = (OrderVO)order_sales_list.get(i);
				order_sales += ovo.getOrder_pay_price();
			}
			
			ArrayList<OrderVO> paid_order_sales_list = adminpointMapper.getTodayPaidOrderSales();
			for(int i=0; i<paid_order_sales_list.size(); i++) {
				OrderVO ovo = (OrderVO)paid_order_sales_list.get(i);
				paid_order_sales += ovo.getOrder_pay_price();
			}
			
			ArrayList<OrderVO> refund_order_sales_list = adminpointMapper.getTodayRefundOrderSales();
			for(int i=0; i<refund_order_sales_list.size(); i++) {
				OrderVO ovo = (OrderVO)refund_order_sales_list.get(i);
				refund_order_sales += ovo.getOrder_pay_price();
			}
			
			paid_before_count = adminpointMapper.getMonthlyPaidBeforeCount();
			prepared_count = adminpointMapper.getMonthlyPreparedCount();
			shipping_count = adminpointMapper.getMonthlyShippingCount();
			done_count = adminpointMapper.getMonthlyDoneCount();
			cancel_count = adminpointMapper.getMonthlyCancelCount();
			item_back_count = adminpointMapper.getMonthlyItemBackCount();
			refund_count = adminpointMapper.getMonthlyRefundCount();
			
			map.put("order_count", order_count);
			map.put("order_sales", order_sales);
			map.put("paid_order_count", paid_order_count);
			map.put("paid_order_sales", paid_order_sales);
			map.put("refund_order_count", refund_order_count);
			map.put("refund_order_sales", refund_order_sales);
			map.put("paid_before_count", paid_before_count);
			map.put("prepared_count", prepared_count);
			map.put("shipping_count", shipping_count);
			map.put("done_count", done_count);
			map.put("cancel_count", cancel_count);
			map.put("item_back_count", item_back_count);
			map.put("refund_count", refund_count);
			
		}catch(Exception e) {
			System.out.println("ERROR(AdminService/minusPointStatus) : " + e.getMessage());
			throw new Exception("ERROR(AdminService/minusPointStatus)");
		}
		return map;
	}
	
	// 카테고리별 TOP3 주문수
	@Override
	public ArrayList<HashMap<String,Object>> getCateCntData() throws Exception{
		ArrayList<HashMap<String,Object>> cnt_list = null;
		
//		// 카테고리별
//		int clothes = 0;
//		int jewelry = 0;
//		int watch = 0;
//		int bag = 0;
//		int wallet = 0;
//		int glasses = 0;
//		int shoes = 0;
		
		try {
			AdminPointMapper adminpointMapper = sqlSession.getMapper(AdminPointMapper.class);
			cnt_list = adminpointMapper.getCateCnt();
			
			
		}catch(Exception e) {
			System.out.println("ERROR(AdminService/getCateCntData) : " + e.getMessage());
			throw new Exception("ERROR(AdminService/getCateCntData)");
		}
		return cnt_list;
	}
	
	// 브랜드별 TOP5 주문수
	@Override
	public ArrayList<HashMap<String,Object>> getBrandCntData() throws Exception{
		ArrayList<HashMap<String,Object>> cnt_list = null;
		
//		// 브랜드별
//		int Armani = 0;
//		int Balenciaga = 0;
//		int Bally = 0;
//		int Balmain = 0;
//		int Berluti = 0;
//		int BOUCHERON = 0;
//		int Breguet = 0;
//		int BREITLING = 0;
//		int Burberrys = 0;
//		int Bvlgari = 0;
//		int Cartier = 0;
//		int Celine = 0;
//		int Chanel = 0;
		
		try {
			AdminPointMapper adminpointMapper = sqlSession.getMapper(AdminPointMapper.class);
			cnt_list = adminpointMapper.getBrandCnt();
			
			// 브랜드별 cnt를 구해서 각각 변수에 넣어줌
			
			// 그리고 순위 구함(순위가 같으면 어떻하지?)
			
			// hashmap 처음 키값은 TOP1, TOP2, TOP3, 기타
			
			// hashmap 두번째 키값은 카테고리이름 / Object엔 cnt값
			
			// if문 만들어서 배열 숫자에 따라 두번째 HashMap 카테고리 이름 키값 넣어주고 오더개수 넣어주고
			
			
//			//	TOP3 순위 구하기
//			// 점수가 들어있는 배열 생성
//	        int score[] = new int[] {Armani, Balenciaga, Bally, Balmain, Berluti, BOUCHERON, Breguet, BREITLING, Burberrys, Bvlgari, Cartier, Celine, Chanel};
//	        // 등수를 측정하기 위해 rank를 1로 선언
//	        int i=0, j=0, rank=1;
//	        // 배열의 인덱스별 크기 비교
//	        for(i=0; i<score.length; i++) {
//	            for(j=0; j<score.length; j++) {
//	                if(score[i]<score[j]) {
//	                    // 배열의 인덱스별로 자신보다 큰 인덱스의 개수를 카운트
//	                    rank++;
//	                }
//	            }
//	            System.out.println(score[i] + "점 : " + rank + "등");
//	            rank=1;
//	        }
			
			
		}catch(Exception e) {
			System.out.println("ERROR(AdminService/getBrandCntData) : " + e.getMessage());
			throw new Exception("ERROR(AdminService/getBrandCntData)");
		}
		return cnt_list;
	}
	
	// 카테고리 매출액
	@Override
	public ArrayList<HashMap<String,Object>> getCateSalesData() throws Exception{
		ArrayList<HashMap<String,Object>> sales_list = null;
		try {
			AdminPointMapper adminpointMapper = sqlSession.getMapper(AdminPointMapper.class);
			sales_list = adminpointMapper.getCateSales();
		}catch(Exception e) {
			System.out.println("ERROR(AdminService/getCateSalesData) : " + e.getMessage());
			throw new Exception("ERROR(AdminService/getCateSalesData)");
		}
		return sales_list;
	}
	
	// 브랜드 매출액
	@Override
	public ArrayList<HashMap<String,Object>> getBrandSalesData() throws Exception{
		ArrayList<HashMap<String,Object>> sales_list = null;
		try {
			AdminPointMapper adminpointMapper = sqlSession.getMapper(AdminPointMapper.class);
			sales_list = adminpointMapper.getBrandSales();
		}catch(Exception e) {
			System.out.println("ERROR(AdminService/getBrandSalesData) : " + e.getMessage());
			throw new Exception("ERROR(AdminService/getBrandSalesData)");
		}
		return sales_list;
	}
	
	@Override
	public ArrayList<HashMap<String,Object>> getAdminDefaultData() throws Exception{
		ArrayList<HashMap<String,Object>> data_list = null;
		try {
			AdminPointMapper adminpointMapper = sqlSession.getMapper(AdminPointMapper.class);
			data_list = adminpointMapper.getAdminDefaultData();
		}catch(Exception e) {
			System.out.println("ERROR(AdminService/getDefaultGraph) : " + e.getMessage());
			throw new Exception("ERROR(AdminService/getDefaultGraph)");
		}
		return data_list;
	}
	
	@Override
	public ArrayList<HashMap<String, Object>> getRefundData() throws Exception{
		ArrayList<HashMap<String, Object>> refund_list = null;
		try {
			AdminPointMapper adminpointMapper = sqlSession.getMapper(AdminPointMapper.class);
			refund_list = adminpointMapper.getRefundData();
		}catch(Exception e) {
			System.out.println("ERROR(AdminService/getRefundData) : " + e.getMessage());
			throw new Exception("ERROR(AdminService/getRefundData)");
		}
		return refund_list;
	}
	
	// 관리자 아이디 검색
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
				//System.out.println("memberVO는??"+memberVO.getMember_name());
				return memberVO;
			}
			
		}catch(Exception e) {
			System.out.println("ERROR(AdminService/adminSearchId) : " + e.getMessage());
			throw new Exception("ERROR(AdminService/adminSearchId)");
		}
	}
	
	// 관리자 주문관리 주문디테일 모달
	public HashMap<String,String> getShippingInfo(String order_number)throws Exception{
		HashMap<String,String> shipping_info = null;
		try {
			ProductlistMapper productlistMapper = sqlSession.getMapper(ProductlistMapper.class);
			shipping_info = productlistMapper.getShippingInfo(order_number);
		}catch(Exception e) {
			System.out.println("ERROR(AdminService/getShippingInfo) : " + e.getMessage());
			throw new Exception("ERROR(AdminService/getShippingInfo)");
		}
		return shipping_info;
	}
}
