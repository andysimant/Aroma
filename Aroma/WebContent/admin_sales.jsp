<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ include file="admin_panel_header.jsp" %>
                        <div class="col-lg-12 col-md-12">
                            
                                <div class="table-wrapper">
                                    <div class="table-title">
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <h2>Sales</h2>
                                            </div>
                                            <div class="col-sm-6">
                                                <a href="#" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add User</span></a>
                                            </div>
                                        </div>
                                    </div>

            
        </div>
        <p></p>
 <table class="table table-hover table-striped">
            <thead>
                <tr>
                    
                    <th>OrderId</th>
                    <th>Date</th>
					<th>Total</th>                   
                    <th></th>
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
                String Data = "select * from order_total";
                rs = statement.executeQuery(Data);
             	double GrandTotal=0;
                while (rs.next()) {
                %>
                <tr>
                    <td><%=rs.getString("order_id")%></td>
                    <td><%=rs.getDate("order_date")%></td>
                    <td><%=rs.getDouble("total")%></td>
                </tr>
                <tr>
                <td> <td><%=GrandTotal%></td></td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>                        
                                    <div class="clearfix">
                                        <div class="hint-text">Total Records: <b><% rs.last();out.print(rs.getRow()); %></b></div>
                                       <!--  <ul class="pagination">
                                            <li class="page-item disabled"><a href="#">Previous</a></li>
                                            <li class="page-item active"><a href="#" class="page-link">1</a></li>
                                            <li class="page-item"><a href="#" class="page-link">2</a></li>
                                            <li class="page-item "><a href="#" class="page-link">3</a></li>
                                            <li class="page-item"><a href="#" class="page-link">4</a></li>
                                            <li class="page-item"><a href="#" class="page-link">5</a></li>
                                            <li class="page-item"><a href="#" class="page-link">Next</a></li>
                                        </ul>
                                         -->
                                    </div>
                                </div>
                            </div>
                                              </div>
                       
                    </div>
                    </div>
                    </div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
      
    <div class="footer">
      
    
            <div class="row">
                <div class="col-lg-12" >
                    &copy;  2019 aroma.com | Design by: <a href="http://binarytheme.com" style="color:#fff;" target="_blank">Simant</a>
                </div>
            </div>
        </div>
          

     <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="assets/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="assets/js/bootstrap.min.js"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="assets/js/custom.js"></script>
    
   
</body>
</html>
