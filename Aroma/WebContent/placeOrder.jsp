<head>
   <link rel="stylesheet" href="/Aroma/WebContent/css/menu_style.css" />
   <link rel="stylesheet" href="/Aroma/WebContent/css/checkout_style.css" />
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="store.js" async></script>
</head>
<%@ include file="user_panel_header.jsp" %>
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-lg-12">
                     <h2>Place Order</h2>   
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
            <div class="col-md-6"><h3>My Cart</h3></div>
           
        </div>
        <p></p>
        
        <%
       	int item_count=0;
        String[] item_name = request.getParameterValues("iname");
        String[] item_price = request.getParameterValues("iprice");
        String[] item_quant = request.getParameterValues("iquant");
        double grand_total=0;
        item_count=item_name.length;
        System.out.print(item_count + " Items in cart");
        
           
        
        %>
      <form action="checkout.jsp" method = "get">  
        
        <table class="table table-hover table-striped">
            <thead>
                <tr>
                    <th>Item No.</th>
                    <th>Name</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Total</th>
                  
                </tr>
            </thead>
            <tbody>
                <%
                
                int i=0;
                while (i<item_count) {
                	double total_item_price=Double.parseDouble(item_quant[i])*Double.parseDouble(item_price[i]);
                	grand_total+=total_item_price;	
                %>
                <tr>
                    <td><%=i+1%></td>
                    <td><%=item_name[i]%></td>
                    <td><%=item_quant[i]%></td>
                    <td><%=item_price[i]%></td>
                     <td><%=total_item_price%></td>
      			
                </tr>
                <input type="text" name="items" value="<%=item_name[i] %>" hidden="true">
                <input type="text" name="iquant"value="<%=item_quant[i] %>" hidden="true">
                <input type="text" name="iprice"value="<%=item_price[i] %>" hidden="true">
                
                <%    
                
                i++;
                }
                %>
              
                <tr>
                
                	<td colspan="3">
                	
                	</td>
                	<td>Grand Total: </td>
                	<td> &#8377; &nbsp;<strong><%=grand_total %> </strong></td>
                </tr>
              
            </tbody>
        </table>
        
        <h2>Responsive Checkout Form</h2>
  <div class="container">
      
        <div class="row">
          
            <h3>Billing Address</h3>
            <label for="fname"><i class="fa fa-user"></i> Full Name</label>
            <input type="text" id="fname" name="firstname" placeholder="John M. Doe">
            <label for="email"><i class="fa fa-envelope"></i> Email</label>
            <input type="text" id="email" name="email" placeholder="john@example.com">
            <label for="adr"><i class="fa fa-address-card-o"></i> Address</label>
            <input type="text" id="adr" name="address" placeholder="542 W. 15th Street">
            <label for="city"><i class="fa fa-institution"></i> City</label>
            <input type="text" id="city" name="city" placeholder="New York">
            <label for="state">State</label>
            <input type="text" id="state" name="state" placeholder="NY">
            <label for="zip">Zip</label>
            <input type="text" id="zip" name="zip" placeholder="10001">
          

          <div class="col-50">
            <h3>Payment</h3>
            <label for="fname">Accepted Cards</label>
            <div class="icon-container">
              <i class="fa fa-cc-visa" style="color:navy;"></i>
              <i class="fa fa-cc-amex" style="color:blue;"></i>
              <i class="fa fa-cc-mastercard" style="color:red;"></i>
              <i class="fa fa-cc-discover" style="color:orange;"></i>
            </div>
            <label for="cname">Name on Card</label>
            <input type="text" id="cname" name="cardname" placeholder="John More Doe">
            <label for="ccnum">Credit card number</label>
            <input type="text" id="ccnum" name="cardnumber" placeholder="1111-2222-3333-4444">
            <label for="expmonth">Exp Month</label>
            <input type="text" id="expmonth" name="expmonth" placeholder="September">
            <div class="row">
              <div class="col-50">
                <label for="expyear">Exp Year</label>
                <input type="text" id="expyear" name="expyear" placeholder="2018">
              </div>
              <div class="col-50">
                <label for="cvv">CVV</label>
                <input type="text" id="cvv" name="cvv" placeholder="352">
              </div>
            </div>
          </div>
          
        </div>
        <label>
          <input type="checkbox" checked="checked" name="sameadr"> Shipping address same as billing
        </label>
        <input type="submit" value="Continue to checkout main" class="btn">
         <%request.setAttribute("items", item_name);
        request.setAttribute("iprice", item_price);
        request.setAttribute("iquant", item_quant);
        %>
      </form>
    </div>
</div>
         <div class="col-md-11 text-right">
         
         	
         	<form method ="get" action="checkout.jsp">
                 <input  type="submit" class="btn btn-primary shopping-cart" value="Continue to checkout">
         </form>
            </div>
                        
     </div>
     
     </div>
    
  
  </div>
</div>
     
     </div>
     
     </div>
     
             <!-- /. PAGE INNER  -->

         <!-- /. PAGE WRAPPER  -->
      
 <%@ include file="footer.jsp" %>

