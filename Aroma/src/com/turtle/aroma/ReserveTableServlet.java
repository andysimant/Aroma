package com.turtle.aroma;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/reserve_table")
public class ReserveTableServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Connection conn=null;
		PreparedStatement pstmt_std = null;
		PreparedStatement pstmt_std_id = null;
		PreparedStatement pstmt_std_ginfo =null;
		PreparedStatement pstmt =null;
	
		//Getting the data from page
		int phone=Integer.parseInt(req.getParameter("inputCel"));
		String name=req.getParameter("inputName");
		String email=req.getParameter("inputEmail");
		int numOfGuest=Integer.parseInt(req.getParameter("inputNumber"));
		String furtherReq=req.getParameter("inputComment");
		String date_of = req.getParameter("inputDate");
		String time_of = req.getParameter("inputTime");
		
		PrintWriter out = resp.getWriter();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String dburl = "jdbc:mysql://localhost:3306/aromadb?user=root&password=root";
			conn = DriverManager.getConnection(dburl);
			conn.setAutoCommit(false);
			String query_std = "INSERT INTO reserve_table values(?,?,?,?,?,?,?)";
			
			pstmt_std =conn.prepareStatement(query_std);
			
			pstmt =conn.prepareStatement(query_std);

			pstmt.setString(1, name);
			pstmt.setString(2, email);
			pstmt.setInt(3, phone);
			pstmt.setInt(4, numOfGuest);
			pstmt.setString(5, date_of);
			pstmt.setString(6, time_of);
			pstmt.setString(7, furtherReq);
			pstmt.executeUpdate();
			System.out.println("hola");
			pstmt.clearParameters();
			pstmt.close();
		
			conn.commit();
			out.println("<h1>Successfully Reserved.<h1>");
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			try {
			
				if(pstmt_std!=null)
					pstmt_std.close();
				if(pstmt_std_id!=null)
					pstmt_std_id.close();
				if(pstmt_std_ginfo!=null)
					pstmt_std_ginfo.close();
				
				if(pstmt != null)
					pstmt.close();
				
				if(conn != null)
					conn.close();
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
