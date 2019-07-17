<%@page import="java.sql.*"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="user_panel_header.jsp" %>
<META
http-equiv="refresh" content="5;URL=http://localhost:8080/Aroma/order_placed.jsp">
</head> 
<%

int item_count=0;
String[] item_name = request.getParameterValues("items");
String[] item_price = request.getParameterValues("iprice");
String[] item_quant = request.getParameterValues("iquant");
double grand_total=0;
System.out.println(item_name[0]);
item_count=item_name.length;
System.out.print(item_count + " Items in cart");

String query_std = "INSERT INTO orders(order_id, order_date, user_email, quantity, item_name, item_price,total,time)values(?,?,?,?,?,?,?,?)";
String selectOrder ="select max(order_id) from orders";

String query_total = "INSERT INTO order_total (order_id, Total) values(?,?)";

Connection conn=null;
PreparedStatement pstmt= null;
String dburl="jdbc:mysql://localhost:3306/aromadb?user=root&password=root";
String user_email=session.getAttribute("email").toString();
Statement stmt=null;
int quantity = 0;
int item_code = 0;

double total = 0;
long millis=System.currentTimeMillis();  
Date date = new Date(millis);
Time tim = new Time(millis);
int lastOrderId=0;
double GrandTotal=0;
out.print(tim);
try {

	out.print("Hello");
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(dburl);
	stmt = conn.createStatement();
	ResultSet rs=stmt.executeQuery(selectOrder);
	if(rs.next()){
		lastOrderId=rs.getInt(1);
	}
	else{
		lastOrderId=1;
	}
	
	conn.setAutoCommit(false);
	for(int j=0;j<item_count;j++){
	total=Double.parseDouble(item_quant[j])*Double.parseDouble(item_price[j]);
	GrandTotal+=total;
	out.print("Hello");
	pstmt =conn.prepareStatement(query_std);
	pstmt.setInt(1,lastOrderId+1);
	pstmt.setDate(2, date);
	pstmt.setString(3, user_email);
	pstmt.setInt(4, Integer.parseInt(item_quant[j]));
	pstmt.setString(5, item_name[j]);
	pstmt.setDouble(6,Double.parseDouble(item_price[j]));
	pstmt.setDouble(7, total);
	pstmt.setTime(8, tim);

	pstmt.executeUpdate();
	pstmt.clearParameters();
	
	}

	
	pstmt = conn.prepareStatement(query_total);
	pstmt.setInt(1, lastOrderId+1);
	pstmt.setDouble(2, GrandTotal);
	pstmt.setDate(3, date);
	pstmt.executeUpdate();
	pstmt.close();
	stmt.close();
	
	conn.commit();
	
	
}catch(ClassNotFoundException | SQLException e ) {
	
	e.printStackTrace();
}


finally{
 	out.print("<h1>Order Successful</h1>");
}
%>
