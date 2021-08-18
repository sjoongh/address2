<%@page import="com.example.address.vo.AddressVo"%>
<%@page import="java.util.List"%>
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
	<h1>주소(Model 2)</h1>
	
	<% for (AddressVo vo: list) { %>
	<table border="1">
		<tr>
			<th>이름</th>
			<td><%= vo.getName() %></td>
		</tr>
		<tr>
			<th>휴대전화</th>
			<td><%= vo.getHp() %></td>
		</tr>
		<tr>
			<th>집전화</th>
			<td><%= vo.getTel() %></td>
		</tr>
		<tr>
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
		<a href="<%= request.getContextPath() %>/ad?a=index">주소 등록</a>
	</p>
	
</body>
</html>