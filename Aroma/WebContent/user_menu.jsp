<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<head>
   <link rel="stylesheet" href="/Aroma/WebContent/css/menu_style.css" />


</head>
<% 	
                        
						
						if(session.getAttribute("username")==null) {
                    			
                     			System.out.println("Invalid	 Session");
                     			
                     			response.sendRedirect("/Aroma");
                    		}else { %>
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
                             Welcome <strong><%{
                    			out.print(session.getAttribute("username"));
                    		}
                             %> </strong> 
                        </div>
                        
                        <!--  From database Menu Table -->
                          <div class="row">
            <div class="col-md-6"><h3>Menu</h3></div>
          
        </div>
        <p></p>
        <table class="table table-hover table-striped">
            <thead>
                <tr>
                    <th style="align:center;">Name</th>
                    <th>Type</th>
                    <th>Price</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                String Host = "jdbc:mysql://localhost:3306/aromadb";
                Connection connection = null;
                Statement statement = null;
                ResultSet rs = null;
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection(Host, "root", "root");
                statement = connection.createStatement();
                String Data = "select * from menu";
                rs = statement.executeQuery(Data);
                while (rs.next()) {
                %>
                <tr>
                
                    <td hidden=true;> <%=rs.getInt("item_code")%></td>
                    <td> <span class="shop-item-title" style=""><%=rs.getString("name")%></span></td>
                    <td><%=rs.getString("type")%></td>
                    <td> <span class="shop-item-price"><%=rs.getDouble("price")%></span></td>
                    
                    <td class="text-center" width="180">
                        <button class="btn btn-primary shop-item-button" type="button">ADD TO CART</button>
                    </td>
                </tr>
                <%
                }
                
                %>
            </tbody>
        </table>
                        
     </div>
     
     <!-- Menu Ends -->
     
     <!-- Cart -->
     <form action="placeOrder.jsp" method = "get">
<section class="container content-section ">
    <h2 class="" name = "itm">CART</h2>
    <div class="cart-row">
        <span class="cart-item cart-header cart-column" >ITEM</span>
        <span class="cart-price cart-header cart-column">PRICE</span>
        <span class="cart-quantity cart-header cart-column">QUANTITY</span>
    </div>
    <div class="cart-items">
    </div>
    <div class="cart-total">
        <strong class="cart-total-title">Total</strong>
        <span class="cart-total-price" id="p" name ="q">&#8377; 0</span>
    </div>
    <!--<button class="btn btn-primary btn-purchase" type ="button" >PURCHASE</button> -->
	<input type= "submit" value="Purchase" class="btn btn-primary btn-purchase">
</section> 

</form>   
     </div>
     </div>
     </div>
     
    <!-- Cart Ends -->
             <!-- /. PAGE INNER  -->

         <!-- /. PAGE WRAPPER  -->
    <%} %>  
 <%@ include file="footer.jsp"  %>