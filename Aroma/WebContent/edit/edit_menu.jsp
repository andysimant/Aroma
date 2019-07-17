<%-- 
    Document   : addnew
    Created on : Aug 13, 2017, 8:55:00 AM
    Author     : TedirGhazali
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">


        <p><br/></p>
        <%
       String Host = "jdbc:mysql://localhost:3306/aromadb";
        Connection connection = null;
        Statement statement = null;
        ResultSet rs = null;
       
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        connection = DriverManager.getConnection(Host, "root", "root");
        PreparedStatement ps=null;
        %>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="row">
                    <div class="col-md-6"><h3>Edit/Update Data</h3></div>
                    <div class="col-md-6 text-right">
                        <a href="index.jsp" class="btn btn-info">Back to Home</a>
                    </div>
                </div>
                <p></p>
                <form action="" method="post">
                    <%
                    statement = connection.createStatement();
                    String u=request.getParameter("u");
                    int num=Integer.parseInt(u);
                    String Data = "select * from menu where item_code='"+num+"'";
                    rs = statement.executeQuery(Data);
                    while (rs.next()) {
                    %>   
                    <input type="hidden" name="id" value='<%=rs.getInt("item_code")%>'/>
                    <div class="form-group">
                        <label for="myname">Name</label>
                        <input type="text" class="form-control" id="myname" name="nm" value='<%=rs.getString("name")%>'>
                    </div>
                    <div class="form-group">
                        <label for="myemail">Email address</label>
                        <input type="text" class="form-control" id="myemail" name="em" value='<%=rs.getString("type")%>'>
                    </div>
                    <div class="form-group">
                        <label for="mynumber">Phone number</label>
                        <input type="number" class="form-control" id="mynumber" name="pn" value='<%=rs.getString("price")%>'>
                    </div>
                    <%   
                    }
                    %>
                    <button type="submit" class="btn btn-warning">Update</button>
                </form>
            </div>
        </div>
  
</html>
<%
String a=request.getParameter("id");
String b=request.getParameter("nm");
String c=request.getParameter("em");
String d=request.getParameter("pn");

int updateQuery = 0;
if(a!=null && b!=null && c!=null && d!=null){
    try{
        String query="update menu set name=?,type=?,price=? where item_code='"+a+"'";
        ps=connection.prepareStatement(query);
        ps.setString(1,b);
        ps.setString(2,c);
        ps.setString(3,d);
        
        updateQuery=ps.executeUpdate();
        if(updateQuery!=0){
            response.sendRedirect("http://localhost:11441/Aroma/admin_menu.jsp");
        }
    }catch(Exception ex){
        out.println("Your Connection: "+ex);
    }finally{
        ps.close();
        connection.close();
    }
}
%>