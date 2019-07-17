package com.turtle.aroma;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/register_user")
public class RegisterUserServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Connection conn=null;
		PreparedStatement pstmt =null;
		System.out.println("HOLA");
		//Getting the data from page
		
		int phone=0;
		System.out.println("HOLA");
		String name=req.getParameter("regName");
		String email=req.getParameter("regEmail");
		String password=req.getParameter("regPassword");
		phone = Integer.parseInt(req.getParameter("regCel"));
		System.out.println("HOLA");
		
				
		
		PrintWriter out = resp.getWriter();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String dburl = "jdbc:mysql://localhost:3306/aromadb?user=root&password=root";
			conn = DriverManager.getConnection(dburl);
			conn.setAutoCommit(false);
			String query_std = "INSERT INTO users values(?,?,?,?,?)";
			pstmt =conn.prepareStatement(query_std);

			pstmt.setString(1, name);
			pstmt.setString(2, email);
			pstmt.setInt(3, phone);
			pstmt.setString(4, password);
			Timestamp timestamp = new Timestamp(new Date().getTime());
			
			pstmt.setTimestamp(5, timestamp);
			pstmt.executeUpdate();
			System.out.println("hola");
			pstmt.clearParameters();
			pstmt.close();
		
			conn.commit();
			out.println("<h1>Successfully Registered.<h1>");
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
			
				if(pstmt != null)
					pstmt.close();
				
				if(conn != null)
					conn.close();
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
