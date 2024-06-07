package com.mit.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {
	Connection conn = null;
	PreparedStatement pstmt;
	
	/*
	 * Connection conn = DriverManager.getConnection(
	 * ‘jdbc:oracle:thin:@localhost:1521:xe’, ‘ora_user’, ‘1234’);
	 */

	
	final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
	final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	
	public void open() {	    //데이터베이스 접속
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(JDBC_URL,"ora_user","1234");		//(JDBC_URL,"사용자정보","pw")
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void close() {		//데이터베이스 접속 해제
		try {
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void insert(Student s) {		//(oracle sql)student table에 새로온 학생 추가 구문
		open();		//insert 하기 위해 데이터베이스 접속=open메소드 호출
		String sql = "INSERT INTO STUDENT VALUES(SEQ_ID.NEXTVAL,?,?,?,?)";
		
		try {		
			pstmt = conn.prepareStatement(sql);		//sql 변수 만들어서 입력	
			pstmt.setString(1, s.getName());		//첫번째 ? -> name 입력하게 (mapping)
			pstmt.setString(2, s.getUniv());
			pstmt.setDate(3, s.getBirth());
			pstmt.setString(4, s.getEmail());
			
			pstmt.executeUpdate();		//위에 내용 update하라고
		} catch(Exception e) {		//예외처리해주고
			e.printStackTrace();
		} finally {
			close();
		}		
	}
	
	public List<Student> getAll() {
		open();
		List<Student> students = new ArrayList<>();		//List<> 사용 import 진행
		
		try {
			pstmt = conn.prepareStatement("select * from student order by 1");
			ResultSet rs = pstmt.executeQuery();
	
			while(rs.next()) {
				Student s = new Student();
				s.setId(rs.getInt("id"));
				s.setName(rs.getString("name"));
				s.setUniv(rs.getString("univ"));
				s.setBirth(rs.getDate("birth"));
				s.setEmail(rs.getString("email"));
				
				students.add(s);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return students;
	}
	
}


































