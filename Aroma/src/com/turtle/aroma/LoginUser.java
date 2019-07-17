package com.turtle.aroma;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/login")
public class LoginUser extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url="jdbc:mysql://localhost:3306/aromadb?user=root&password=root";
		String query = "select * from users where email = ? AND password = ?";
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		PrintWriter out=resp.getWriter();
		
		String email= req.getParameter("inputLoginEmail");
		String pswd = req.getParameter("inputLoginPassword");
		
		if(email.equals("admin@admin") && pswd.equals("admin")) {
			RequestDispatcher disp = req.getRequestDispatcher("admin_dash.jsp");
			disp.forward(req, resp);
	
		}else {
		String refCookie="http://localhost:8080/QS-MiniProject/myCookie";
		
		HttpSession session = req.getSession(true);
		if(session == null) {
			out.print("Invalid Session");
		}else {
				
			try { 
				Class.forName("com.mysql.jdbc.Driver");
				con =DriverManager.getConnection(url);
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, email);
				pstmt.setString(2, pswd);
				
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					session.setAttribute("username", rs.getString(1));
					session.setAttribute("email", rs.getString("email"));
					System.out.print("Session is oN" +rs.getString("email")+rs.getString("name"));	
					RequestDispatcher dis = req.getRequestDispatcher("user_panel.jsp");
					dis.forward(req, resp);
				
				}
				
					
					
				else {
					out.print("Record Not Found");
				//NOT found
				//}
				}
				//dispatcher = req.getRequestDispatcher("/footer.html");
			//	dispatcher.include(req, resp);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			 catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		
		}
	}
	}
}