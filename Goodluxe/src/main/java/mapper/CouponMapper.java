package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.goodluxe.voes.CouponVO;

public interface CouponMapper {
	ArrayList<CouponVO> selectCoupon(String member_id);
	void updateCouponstatus(CouponVO couponVO);
	int getCouponListCount(String member_id);
	ArrayList<CouponVO> getCouponList(HashMap<String, Object> cvo);
	void updateCouponExstatus(CouponVO couponVO);
}
