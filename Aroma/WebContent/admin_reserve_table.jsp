<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Reserve</title>

</head>
<body>
<%@ include file="admin_panel_header.jsp" %>
<form method="post" action="reserve_table">
<h3>Reserve</h3>

		<div class="col-lg-3">
			<label for="inputDate"> Date</label>
			<input type="date" class="form-control" name="inputDate" placeholder="Data gg/mm/aaaa">
		</div>
	  	<div class="col-lg-3">
	  		<label for="inputName"> Name</label>
	  		<input type="text" class="form-control" name="inputName" placeholder="Name">	
	  	</div>
	  	<div class="col-lg-3">
	  		<label for="inputTime"> Timetables</label>
	  		<input type="time" class="form-control" name="inputTime" placeholder="Timetables">
	  	</div>

	
		<div class="col-lg-3">
			<label for="inputEmail"> Email</label>
			<input type="email" class="form-control" name="inputEmail" placeholder="Email">
		</div>
	
  	<div class="form-group col-lg-3">
			<label for="inputNumber"> Number of Guests</label>
			<input type="number" class="form-control" name="inputNumber" placeholder="Number of Guests" max="12" min="0">
	</div>
 	<div class="form-group col-lg-3">
	  		<label for="inputCel"> Phone</label>
	  		<input type="tel" class="form-control" name="inputCel" placeholder="Phone">
  	</div>
	<div class="form-group col-lg-3">
			<label for="inputComment"> Further requests</label>
			<input type="text" class="form-control" name="inputComment" placeholder="Further requests">
	</div>
	<div class="row">
  		<div class="col-md-4 col-md-offset-4">
		<button type="submit" class="btn btn-secondary btn-block">Reserve</button>

 		</div>
  	</div>
			</form>					
				<!-- </div> -->
			</div>
			</div>
			</div>
		</div>	
<%@ include file="footer.jsp" %>
</body>
</html>