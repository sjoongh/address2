<%@page import="com.example.address.vo.AddressVo"%>
<%@page import="java.util.List"%>
<%@page import="com.example.address.dao.AddressBookDaoImpl"%>
<%@page import="com.example.address.dao.AddressBookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
AddressBookDao dao = new AddressBookDaoImpl();
//	이메일 리스트 받아오기
List<AddressVo> list = dao.getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>address (Model 1)</title>
</head>
<body>
	<h1>메일링 리스트(Model 1)</h1>
	
	<!-- 이메일 리스트: 목록 -->
	<!-- 루프 시작 -->
	<% for (AddressVo vo: list) { %>
	<table border="1">
		<!-- 행 -->
		<tr>
			<th>이름</th>
			<td><%= vo.getName() %></td>
		</tr>
		<tr>
			<th>번호</th>
			<td><%= vo.getHp() %></td>
		</tr>
		<tr>
			<th>집</th>
			<td><%= vo.getTel() %></td>
		</tr>
		<tr>
			<td colspan="2">
			<!-- 삭제 폼 -->
				<form action="<%= request.getContextPath() %>/address/delete.jsp"
				method="POST">
				<!--  vo.getNo()?? -->
				<input type="hidden" name="no" />
				<input type="submit" value="삭제" />
				</form>
			</td>
		</tr>
	</table>
	<br />
	<% } %>
	<!-- 루프의 끝 -->
	
	<!-- 작성 폼으로 이동 -->
	<p>
		<a href="<%= request.getContextPath() %>/address/form.jsp">추가 이메일 등록</a>
	</p>
	
</body>
</html>