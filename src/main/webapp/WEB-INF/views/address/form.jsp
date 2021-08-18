<%@page import="com.example.address.vo.AddressVo"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<AddressVo> list = (List<AddressVo>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Address (Model 2)</title>
</head>
<body>
	<h1>주소</h1>
	
	검색어<input type="hidden" name="a" value="find" />
		<input type="text" name="name" id="name" />
		<input type="submit" value="검색" />
	<% for (AddressVo vo: list) { %>
	<table border="1">
		<tr>
			<td><%= vo.getName() %></td>
			<td><%= vo.getHp() %></td>
			<td><%= vo.getTel() %></td>
		</tr>
	</table>
	<% } %>
	</form>
	
	<table border="1">
		<tr>
			<td>이름</td>
			<td>휴대전화</td>
			<td>집번호</td>
			<td>도구</td>
		</tr>
	</table>
	<% for (AddressVo vo: list) { %>
	<table border="1">
		<tr>
			<td><%= vo.getName() %></td>
			<td><%= vo.getHp() %></td>
			<td><%= vo.getTel() %></td>
			<td colspan="2">
				<form action="<%= request.getContextPath() %>/ad"
					method="POST">
					<input type="hidden" name="a" value="delete" />
					<input type="hidden" name="no" value="<%= vo.getNo() %>" />	
					<input type="submit" value="삭제" />
				</form>
			</td>
		</tr>
	</table>
	<br />
	<% } %>

	<p>
		<a href="<%= request.getContextPath() %>/ad?a=index">새 주소 추가</a>
	</p>
	
</body>
</html>