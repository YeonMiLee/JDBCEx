<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>학생 정보</h2>
	[<a href="/JDBCEx/studentControl">새로고침</a>]
	<hr>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>이름</th>
			<th>대학</th>
			<th>생일</th>
			<th>이메일</th>
		</tr>	
	<c:forEach items="${students}" var="s">
		<tr>
			<th>${s.id}</th>
			<th>${s.name}</th>
			<th>${s.univ}</th>
			<th>${s.birth }</th>
			<th>${s.email}</th>
		</tr>
	</c:forEach>
	</table>
	<hr>
	<h2>학생 추가</h2>
	<hr>
	<form method="post" action="/JDBCEx/studentControl?action=insert">
		<label>이름</label> <input type="text" name="name"><br>
		<label>대학</label> <input type="text" name="univ"><br>
		<label>생일</label> <input type="text" name="birth"><br>
		<label>이메일</label> <input type="text" name="email"><br>
		<button type="submit">전송</button>
	</form>
</body>
</html>


































