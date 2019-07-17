<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
String no=request.getParameter("d");
//int no=Integer.parseInt(id);
try {
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/aromadb", "root", "root");
    Statement st = conn.createStatement();
    st.executeUpdate("DELETE FROM users WHERE email = '"+no+"'");
    response.sendRedirect("http://localhost:11441/Aroma/admin_users.jsp");
} catch(Exception e){}
%>