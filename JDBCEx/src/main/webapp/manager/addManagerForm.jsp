<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>관리자 관리 폼</h2>
	<form method="post" action="addManager.jsp">	
	<table>	
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" size="20"> </td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" name="address" size="20"> </td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input type="text" name="phone" size="20"> </td>
		</tr>		
	</table>
	<input type="submit" value="전송">
	<input type="reset" value="취소">
	</form>
</body>
</html>
