<%@page import="com.example.address.vo.AddressVo"%>
<%@page import="com.example.address.dao.AddressBookDaoImpl"%>
<%@page import="com.example.address.dao.AddressBookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//	파라미터 받아오기
	String name = request.getParameter("name");
	String hp = request.getParameter ("hp");
	String tel = request.getParameter("tel");
	//	파라미터 확인
	//	DAO
	AddressBookDao dao = new AddressBookDaoImpl();
	
	//	Vo 객체 생성
	AddressVo vo = new AddressVo();
	vo.setName(name);
	vo.setHp(hp);
	vo.setTel(tel);
	
	//	index.jsp로 리다이렉트(페이지 전환: 302)
	response.sendRedirect(request.getContextPath() + "/address/");
%>