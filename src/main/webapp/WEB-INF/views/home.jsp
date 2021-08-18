<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>


<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>주소록 Servlet</title>
<style type="text/css">
body{background-color:royalblue; color:white}
table{border-collapse:collapse}
td, th{border:2px solid red;width:100px;height:20px;text-alingn:center}</style>
</head>

<body>
	<h1>목록</h1>
	<p>검색어<input type="text" name="email" id="email" />
	<input type="submit" value="검색" /></p>
	<table>
	<tr>
		<td>이름</td>
		<td>휴대전화</td>
		<td>전화번호</td>
		<td>구분</td>
	</tr>
	</table>
	<p><a href="<%= request.getContextPath() %>/ad?a=index">새 주소 추가</a></a>
</body>

</html>
