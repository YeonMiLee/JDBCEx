<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! //선언부는 첫 방문자에 의해서 단 한번 수행함
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;		//여러 레코드를 저장하는데 한번에 하나의 레코드만 처리할 수 있음(cursor)
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String uid = "ex_user";
	String pass = "1234";
	String sql = "select * from manager";%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width='800' border='1'>
		<tr>
			<th>이름</th>
			<th>주소</th>
			<th>전화번호</th>			
		</tr>	
	<%
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, uid, pass);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		while(rs.next()) {
			out.println("<tr>");
			out.println("<td>" + rs.getString("name") + "</td>");
			out.println("<td>" + rs.getString("address") + "</td>");			
			out.println("<td>" + rs.getString("phone") + "</td>");
			out.println("</tr>");
		} //while 끝
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	%>
	</table>
</body>
</html>