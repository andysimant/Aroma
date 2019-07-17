<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
 <%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<!DOCTYPE html>
<html lang="en">
<%@ include file="admin_panel_header.jsp" %>
  <div class="col-lg-12 col-md-12">
                            
                                <div class="table-wrapper">
                                    <div class="table-title">
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <h2>Manage <b>Menu</b></h2>
                                            </div>
                                            <div class="col-sm-6">
                                                <a href="#add_item" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add Item</span></a>
                                            </div>
                                        </div>
                                    </div>

            
        </div>
        <p></p>
 <table class="table table-hover table-striped">
            <thead>
                <tr>
                    
                    <th>Item Code</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Type</th>
                    <th>Action</th>
                   
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
                String Data = "select * from menu";
                rs = statement.executeQuery(Data);
             
                while (rs.next()) {
                %>
                <tr>
                    <td><%=rs.getInt("item_code")%></td>
                    <td><%=rs.getString("name")%></td>
                    <td><%=rs.getDouble("price")%></td>
                    <td><%=rs.getString("type")%></td>
                    
                    <td class="text-center" width="180">
                        <a href='edit/edit_menu.jsp?u=<%=rs.getString("item_code")%>' class="btn btn-warning">Edit</a>
                        <a href='delete/delete_menu.jsp?d=<%=rs.getString("item_code")%>' class="btn btn-danger">Delete</a>
                    </td>
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
    
   
                               <div id="add_item" class="modal fade">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <form method ="get" action="addItem">
                                            <div class="modal-header">						
                                                <h4 class="modal-title">Add Item</h4>
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            </div>
                                            <div class="modal-body">					
                                                <div class="form-group">
                                                    <label>Name</label>
                                                    <input type="text" class="form-control" name ="itemName" required>
                                                </div>
                                                <div class="form-group">
                                                    <label>Type</label>
                                                   <br>
                                                    <input type="radio" class="" name="itemType"  value="Veg" > Veg &nbsp; 
                                                    <input type="radio" class="" name="itemType" value="Non-Veg" > Non Veg<br>
                                                </div>
                                                <div class="form-group">
                                                    <label>Price</label>
                                                    <input type="number" class="form-control" name="itemPrice" required>
                                                </div>					
                                            </div>
                                            <div class="modal-footer">
                                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                                <input type="submit" class="btn btn-info" value="Save">
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                           </body>
</html>
