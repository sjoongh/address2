<%@page import="com.example.address.dao.AddressBookDaoImpl"%>
<%@page import="com.example.address.dao.AddressBookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    // 파라미터 받기
    Long pk = Long.valueOf(request.getParameter("no"));
    // DAo 불러오기
    AddressBookDao dao = new AddressBookDaoImpl();
    // 삭제
    dao.delete(pk);
    
    // index.jsp로 리다이렉트
    response.sendRedirect(request.getContextPath()+"/address/"); 
%>