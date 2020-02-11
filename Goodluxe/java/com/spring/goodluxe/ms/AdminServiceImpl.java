package com.spring.goodluxe.ms;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.goodluxe.voes.MemberVO;
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
			System.out.println("ERROR(AjaxService/defaultPointList) : " + e.getMessage());
			throw new Exception("ERROR(AjaxService/defaultPointList)");
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
			System.out.println("ERROR(AjaxService/getSearchPointList) : " + e.getMessage());
			throw new Exception("ERROR(AjaxService/getSearchPointList)");
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
			System.out.println("ERROR(AjaxService/insertPointStatus) : " + e.getMessage());
			throw new Exception("ERROR(AjaxService/insertPointStatus)");
		}
	}

	// 회수일때
	@Override
	public void minusPointStatus(PointVO pvo, HttpServletResponse response) throws Exception {
		int res = 0;
		try {
			MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
			MemberVO mvo = memberMapper.selectMemberPoint(pvo);
			
			// 멤버 포인트 변경 계산
			int current_point = mvo.getMember_point();
			int get_point = pvo.getPoint_amount();

			// 멤버테이블에 아이디가 있을 경우
			if (mvo != null) {
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
			System.out.println("ERROR(AjaxService/minusPointStatus) : " + e.getMessage());
			throw new Exception("ERROR(AjaxService/minusPointStatus)");
		}
	}
}
