package com.turtle.aroma;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Time;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Statement;
@WebServlet("/placeOrder")
public class user_PlaceOrderServlet extends HttpServlet{
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	Connection conn=null;
	PreparedStatement pstmt= null;
	String dburl="jdbc:mysql://localhost:3306/aromadb?user=root&password=root";
	String user_email="mjkjk";
	Statement stmt=null;
	int quantity = 0;
	int item_code = 0;
	double item_price=0;
	double total = 0;
	long millis=System.currentTimeMillis();  
	Date date = new Date(millis);
	Time tim = new Time(millis);
	
	PrintWriter out = resp.getWriter();
	out.print(" Getting "+req.getAttribute("itm"));
	out.print(tim);
	try {
		out.print("Hello");
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(dburl);
		conn.setAutoCommit(false);
		String query_std = "INSERT INTO orders(order_id, order_date,time, user_email, quantity, item_code, item_price,total) values(?,?,?,?,?,?,?)";
		out.print("Hello");
		
		pstmt =conn.prepareStatement(query_std);
		
		pstmt.setInt(1,1001 );
		pstmt.setDate(2, date);
		
		pstmt.setString(3, user_email);
		pstmt.setInt(4, quantity);
		pstmt.setInt(5, item_code);
		pstmt.setDouble(6, item_price);
		pstmt.setDouble(7, total);
		out.print("Hello up");
		pstmt.executeUpdate();
		out.print("Hellonjhj");
		System.out.println("hola");
		pstmt.clearParameters();
		pstmt.close();
		conn.commit();
		out.println("<h1>Successfully Entered.<h1>");
	}catch(ClassNotFoundException | SQLException e ) {
		
		e.printStackTrace();
	}
	
} 
}
