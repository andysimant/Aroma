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
                     			response.sendRedirect("index.html");
                     			return;
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
                    <th>Order Id</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Item Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                    
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
                String Data = "select * from orders where user_email=?";
                statement = connection.prepareStatement(Data);
                statement.setString(1,ema);
                rs = statement.executeQuery();
                while (rs.next()) {
                %>
                <tr>
                    
                    <td><%=rs.getString("order_id")%></td>
                    <td><%=rs.getDate("order_date")%></td>
                    <td><%=rs.getTime("time")%></td>
                    <td><%=rs.getString("item_name")%></td>
                    <td><%=rs.getDouble("item_price")%></td>
                    <td><%=rs.getInt("quantity")%></td>
                    <td><%=rs.getDouble("Total")%></td>
                    
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

