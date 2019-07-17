package com.turtle.aroma;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addItem")
public class add_menu_servlet extends HttpServlet{
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	Connection conn=null;
	//PreparedStatement pstmt_std = null;
	//PreparedStatement pstmt_std_id = null;
	//PreparedStatement pstmt_std_ginfo =null;
	PreparedStatement pstmt =null;
	
	//Getting the data from page
	
	
	
	//int iCode=Integer.parseInt(req.getParameter("itemCode"));
	String iName=req.getParameter("itemName");
	String iType=req.getParameter("itemType");
	double iPrice = Double.parseDouble(req.getParameter("itemPrice"));
	System.out.println("HOLA");
	PrintWriter out = resp.getWriter();
	try {
		Class.forName("com.mysql.jdbc.Driver");
		String dburl = "jdbc:mysql://localhost:3306/aromadb?user=root&password=root";
		conn = DriverManager.getConnection(dburl);
		conn.setAutoCommit(false);
		String query_std = "INSERT INTO menu(name,price,type) values(?,?,?)";
		
		//pstmt_std =conn.prepareStatement(query_std);
		
		pstmt =conn.prepareStatement(query_std);

		//pstmt.setInt(1, 5);
		pstmt.setString(1, iName);
		pstmt.setDouble(2, iPrice);
		pstmt.setString(3, iType);
		pstmt.executeUpdate();
		System.out.println("hola");
		pstmt.clearParameters();
		pstmt.close();
	
		conn.commit();
		out.println("<h1>Successfully Inserted.<h1>");
		resp.sendRedirect("admin_menu.jsp");
		//RequestDispatcher dis = req.getRequestDispatcher("admin_menu.jsp");
		//dis.forward(req, resp);

	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	finally {
		try {
		
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
