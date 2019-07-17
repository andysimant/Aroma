<%@page import="java.sql.*"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="user_panel_header.jsp" %>
    
      <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-lg-12">
                     <h2>USER DASHBOARD</h2>   
                    </div>
                </div>              
                 <!-- /. ROW  -->
                  <hr />
                  
                <div class="row">
                    <div class="col-lg-12 ">
                        <div class="alert alert-info">
                             Welcome <strong><% 
                            
                     		if(request.getSession(true)==null) {
                    		
                     			out.print("Invalid Session");
                    		}else {
                    			out.print(session.getAttribute("username"));
                    		}
                             %> </strong> 
                        </div>
                        
                        <!--  From database Menu Table -->
                          <div class="row">
            <div class="col-md-6"><h3>Menu</h3></div>
            <p><br/></p>
        <%
       String Host = "jdbc:mysql://localhost:3306/aromadb";
        Connection connection = null;
        Statement statement = null;
        ResultSet rs = null;
       
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(Host, "root", "root");
        PreparedStatement ps=null;
        %>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="row">
                    <div class="col-md-6"><h3>Edit/Update Data</h3></div>
                    <div class="col-md-6 text-right">
                        <a href="user_panel.jsp" class="btn btn-info">Back to Home</a>
                    </div>
                </div>
                <p></p>
                <form action="" method="post">
                    <%
                    statement = connection.createStatement();
                    String u=request.getParameter("u");
                    //int num=Integer.parseInt(u);
                    String Data = "select * from users where email='"+u+"'";
                    rs = statement.executeQuery(Data);
                    while (rs.next()) {
                    %>   
                    <div class="form-group">
                        <label for="myname">Name</label>
                        <input type="text" class="form-control" id="myname" name="nm" value='<%=rs.getString("name")%>'>
                    </div>
                    <div class="form-group">
                        <label for="myemail">Email address</label>
                        <input type="email" class="form-control" id="myemail" name="em" value='<%=rs.getString("email")%>'>
                    </div>
                    <div class="form-group">
                        <label for="mynumber">Phone number</label>
                        <input type="tel" class="form-control" id="mynumber" name="pn" value='<%=rs.getString("phone")%>'>
                    </div>
                     <div class="form-group">
                        <label for="mynumber">Password</label>
                        <input type="tel" class="form-control" id="mypassword" name="ps" value='<%=rs.getString("password")%>'>
                    </div>
                    <%   
                    }
                    %>
                    <button type="submit" class="btn btn-warning">Update</button>
                </form>
            </div>
        </div>
        </div>
        <p></p>
                        
     </div>
     
     <!-- Menu Ends -->
     
     <!-- Cart -->
    
     </div>
     </div>
     </div>
     
      <%
//String a=request.getParameter("id");
String b=request.getParameter("nm");
String c=request.getParameter("em");
String d=request.getParameter("pn");
String e=request.getParameter("ps");
int updateQuery = 0;
if(b!=null && c!=null && d!=null && e!=null){
    try{
        String query="update users set name=?,email=?,phone=?,password=? where email='"+c+"'";
        ps=connection.prepareStatement(query);
        ps.setString(1,b);
        ps.setString(2,c);
        ps.setString(3,d);
        ps.setString(4,e);
        updateQuery=ps.executeUpdate();
        if(updateQuery!=0){
            response.sendRedirect("user_panel.jsp");
        }
    }catch(Exception ex){
        out.println("Your Connection: "+ex);
    }finally{
        ps.close();
        connection.close();
        session.setAttribute("email", c);
    }
}
%>  
    
	<%@ include file="footer.jsp" %>