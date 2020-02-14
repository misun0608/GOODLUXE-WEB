package com.spring.goodluxe.voes;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class Order2VO {
//   private String order_img;         // �̹���
   private String order_number;      // �ֹ���ȣ
   private String order_receipt;      // �޴»��
   private Timestamp order_pay_date;   // ������
   private Timestamp order_order_date;   // �ֹ���
   private String order_status;      // �ֹ�����
   private String order_addr1;         // ��۱⺻�ּ�
   private String order_addr2;         // ��ۻ��ּ�
   private String order_zipcode;      // ��ۿ����ȣ
   private String order_phone;         // �������ȣ
   private String order_invoice_number;   // �����ȣ
   private Timestamp order_ship_date;      // ��۳�¥
   private Timestamp order_cancel_date;    // �ֹ��������
   private int order_product_price;   // ��ǰ �ݾ�
   private int order_ship_fee;         // ��ۺ�
   private int order_used_point;      // ��� ������
   private String order_used_coupon;   // ��� ����
   private String order_pay_system;   // ���� ���
   private String order_refund_bank;   // ȯ�Ұ��� ����
   private String order_refund_account; // ȯ�Ұ��¹�ȣ
   private int pb_number;         // �Խñ� ��ȣ / ����������.....
   private String member_id;         // ��� ���̵� / ���������� ������ ����...?
   private String order_message;      // �ֹ��޼���
   private int order_pay_price;      // ���� �ݾ�
public String getOrder_number() {
	return order_number;
}
public String getOrder_receipt() {
	return order_receipt;
}
public Timestamp getOrder_pay_date() {
	return order_pay_date;
}
public Timestamp getOrder_order_date() {
	return order_order_date;
}
public String getOrder_status() {
	return order_status;
}
public String getOrder_addr1() {
	return order_addr1;
}
public String getOrder_addr2() {
	return order_addr2;
}
public String getOrder_phone() {
	return order_phone;
}
public String getOrder_zipcode() {
	return order_zipcode;
}
public String getOrder_invoice_number() {
	return order_invoice_number;
}
public Timestamp getOrder_ship_date() {
	return order_ship_date;
}
public Timestamp getOrder_cancel_date() {
	return order_cancel_date;
}
public int getOrder_product_price() {
	return order_product_price;
}
public int getOrder_ship_fee() {
	return order_ship_fee;
}
public int getOrder_used_point() {
	return order_used_point;
}
public String getOrder_used_coupon() {
	return order_used_coupon;
}
public String getOrder_pay_system() {
	return order_pay_system;
}
public String getOrder_refund_bank() {
	return order_refund_bank;
}
public String getOrder_refund_account() {
	return order_refund_account;
}
public int getPb_number() {
	return pb_number;
}
public String getMember_id() {
	return member_id;
}
public String getOrder_message() {
	return order_message;
}
public int getOrder_pay_price() {
	return order_pay_price;
}
public void setOrder_number(String order_number) {
	this.order_number = order_number;
}
public void setOrder_receipt(String order_receipt) {
	this.order_receipt = order_receipt;
}
public void setOrder_pay_date(Timestamp order_pay_date) {
	this.order_pay_date = order_pay_date;
}
public void setOrder_order_date(Timestamp order_order_date) {
	this.order_order_date = order_order_date;
}
public void setOrder_status(String order_status) {
	this.order_status = order_status;
}
public void setOrder_addr1(String order_addr1) {
	this.order_addr1 = order_addr1;
}
public void setOrder_addr2(String order_addr2) {
	this.order_addr2 = order_addr2;
}
public void setOrder_phone(String order_phone) {
	this.order_phone = order_phone;
}
public void setOrder_zipcode(String order_zipcode) {
	this.order_zipcode = order_zipcode;
}
public void setOrder_invoice_number(String order_invoice_number) {
	this.order_invoice_number = order_invoice_number;
}
public void setOrder_ship_date(Timestamp order_ship_date) {
	this.order_ship_date = order_ship_date;
}
public void setOrder_cancel_date(Timestamp order_cancel_date) {
	this.order_cancel_date = order_cancel_date;
}
public void setOrder_product_price(int order_product_price) {
	this.order_product_price = order_product_price;
}
public void setOrder_ship_fee(int order_ship_fee) {
	this.order_ship_fee = order_ship_fee;
}
public void setOrder_used_point(int order_used_point) {
	this.order_used_point = order_used_point;
}
public void setOrder_used_coupon(String order_used_coupon) {
	this.order_used_coupon = order_used_coupon;
}
public void setOrder_pay_system(String order_pay_system) {
	this.order_pay_system = order_pay_system;
}
public void setOrder_refund_bank(String order_refund_bank) {
	this.order_refund_bank = order_refund_bank;
}
public void setOrder_refund_account(String order_refund_account) {
	this.order_refund_account = order_refund_account;
}
public void setPb_number(int pb_number) {
	this.pb_number = pb_number;
}
public void setMember_id(String member_id) {
	this.member_id = member_id;
}
public void setOrder_message(String order_message) {
	this.order_message = order_message;
}
public void setOrder_pay_price(int order_pay_price) {
	this.order_pay_price = order_pay_price;
}
   
   
   
   
   
   
   
}