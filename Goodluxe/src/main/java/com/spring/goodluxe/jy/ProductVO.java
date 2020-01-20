package com.spring.goodluxe.jy;

public class ProductVO {

	private String brand_name;					//브랜드명
	private String product_name;				//제품명
	private String product_grade;				//상품등급
	private int selling_price;					//판매가격
	private String product_detail;				//상품 상세
	private String selling_status;				//판매상태
	private String onboard_status;				//게시상태
	private String product_main_img_original; 	//대표이미지 원본이름
	private String product_main_img_stored; 	//대표이미지 UUID이름
	private String product_detail_img_original; //상세이미지 원본이름
	private String product_detail_img_stored;	//상세이미지 UUID이름
	public String getBrand_name() {
		return brand_name;
	}
	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_grade() {
		return product_grade;
	}
	public void setProduct_grade(String product_grade) {
		this.product_grade = product_grade;
	}
	public int getSelling_price() {
		return selling_price;
	}
	public void setSelling_price(int selling_price) {
		this.selling_price = selling_price;
	}
	public String getProduct_detail() {
		return product_detail;
	}
	public void setProduct_detail(String product_detail) {
		this.product_detail = product_detail;
	}
	public String getSelling_status() {
		return selling_status;
	}
	public void setSelling_status(String selling_status) {
		this.selling_status = selling_status;
	}
	public String getOnboard_status() {
		return onboard_status;
	}
	public void setOnboard_status(String onboard_status) {
		this.onboard_status = onboard_status;
	}
	public String getProduct_main_img_original() {
		return product_main_img_original;
	}
	public void setProduct_main_img_original(String product_main_img_original) {
		this.product_main_img_original = product_main_img_original;
	}
	public String getProduct_main_img_stored() {
		return product_main_img_stored;
	}
	public void setProduct_main_img_stored(String product_main_img_stored) {
		this.product_main_img_stored = product_main_img_stored;
	}
	public String getProduct_detail_img_original() {
		return product_detail_img_original;
	}
	public void setProduct_detail_img_original(String product_detail_img_original) {
		this.product_detail_img_original = product_detail_img_original;
	}
	public String getProduct_detail_img_stored() {
		return product_detail_img_stored;
	}
	public void setProduct_detail_img_stored(String product_detail_img_stored) {
		this.product_detail_img_stored = product_detail_img_stored;
	}
	
}
