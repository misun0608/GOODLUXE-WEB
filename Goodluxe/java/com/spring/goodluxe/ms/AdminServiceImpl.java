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
	
	@Override
	public ArrayList<HashMap<String,Object>> getDefaultGraph() throws Exception{
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
}
