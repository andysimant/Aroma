package com.turtle.aroma;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/logout")
public class LogoutServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	PrintWriter out = resp.getWriter();
		HttpSession session = req.getSession(false);
		if(session == null) {
			out.print("Already Logged out");
			resp.sendRedirect("http://localhost:8080/Aroma");
		}else {
			session.invalidate();
			out.print("Successfully Logged out");
			resp.sendRedirect("http://localhost:8080/Aroma");
		}
	
	}

}
