<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="includes.jsp" />
<title>Add new customer</title>
</head>
<body>
    <jsp:include page="header.jsp" />
	<form action="addCustomerDB.jsp" method="post">
	
	<div class="col-lg-12"></div>
	<div class="col-lg-4"></div>
	
		<div class="form-group col-lg-4">
			
			<label for="name">Customer Name</label> &nbsp;&nbsp;&nbsp;<input type="text" name="name" class="form-control" />
			<br />
			<label for="address">Address</label> &nbsp;&nbsp;&nbsp;<input type="text" name="address" class="form-control" />
			<br />
			<label for="phone">Phone</label> &nbsp;&nbsp;&nbsp;<input type="text" name="phone" class="form-control" />
			<br />
			<label for="id">Customer ID</label> &nbsp;&nbsp;&nbsp;<input type="text" name="id" class="form-control" /> 
			<br /><br />
			<input type="Submit" value="Add customer"  class="btn btn-primary" />
		</div>
	<div class="col-lg-4"></div>
	</div>
	</form>
	<jsp:include page="footer.jsp" />
</body>
</html>