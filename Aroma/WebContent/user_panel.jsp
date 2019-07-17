<head>
   <link rel="stylesheet" href="/Aroma/WebContent/css/menu_style.css" />
    <script src="store.js" async></script>
</head>
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
                          <div class="row">
            <div class="col-md-6"><h3>My Profile</h3></div>
                    </div>
        <p></p>
        <table class="table table-hover table-striped">
            <thead>
                <tr>
                    
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Password</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                String Host = "jdbc:mysql://localhost:3306/aromadb";
                Connection connection = null;
                PreparedStatement statement = null;
                ResultSet rs = null;
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection(Host, "root", "root");
                
              	String ema=session.getAttribute("email").toString();
                String Data = "select * from users where email=?";
                statement = connection.prepareStatement(Data);
                statement.setString(1,ema);
                rs = statement.executeQuery();
                while (rs.next()) {
                %>
                <tr>
                    
                    <td><%=rs.getString("name")%></td>
                    <td><%=rs.getString("email")%></td>
                    <td><%=rs.getString("phone")%></td>
                    <td><%=rs.getString("password")%></td>
                    <td >
                        <a href='user_edit.jsp?u=<%=rs.getString("email")%>' class="btn btn-warning">Edit</a>
                      
                    </td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>
                        
     </div>
     
     </div>
     </div>
     </div>
     
             <!-- /. PAGE INNER  -->

         <!-- /. PAGE WRAPPER  -->
      
 <%@ include file="footer.jsp" %>

