<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록</title>
</head>
<body>
	<h1>새 주소 등록</h1>
	<form action="<%= request.getContextPath() %>/ad"
		method="POST">
		<!-- hidden은 사용자 입력은 아니지만 전송해야 할 데이터 -->
		<input type="hidden" value="add" name="a" />
		<label for="last_name">이름</label><br />
		<input type="text" name="last_name" id="last_name" /><br />
		<label for="first_name">휴대전화</label><br />
		<input type="text" name="first_name" id="first_name" /><br />
		<label for="email">집전화</label><br />
		<input type="text" name="email" id="email" /><br />
		
		<!-- 전송 버튼 -->
		<input type="submit" value="주소 등록" />
	</form>
	
	<!-- 리스트로 돌아가기  -->
	<p>
		<a href="<%= request.getContextPath() %>/AddressBook2/">목록 보기</a>
	</p>
</body>
</html>
