<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="includes.jsp" />
<title>Add new smartphone</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<form action="addSmartPhoneDB.jsp" method="post" >
	<div class="form-group col-lg-4">
		
		<br />
		<h5>Add a new Smartphone:-</h5>
		<br />
		<label for="brand">Brand Name</label> &nbsp;&nbsp;&nbsp;<input type="text" name="brand" class="form-control"   />
		<br />
		<label for="Colour">Colour</label> &nbsp;&nbsp;&nbsp;<input type="text" name="colour" class="form-control"   />
		<br />
		<label for="model">Model</label> &nbsp;&nbsp;&nbsp;<input type="text" name="model" class="form-control"  />
		<br />
		<label for="memory">Memory(GB)</label> &nbsp;&nbsp;&nbsp;<input type="text" name="memory" class="form-control"   />
		<br />
		<label for="id">ID</label> &nbsp;&nbsp;&nbsp;<input type="text" name="id" class="form-control"  />
		<br />
		<input type="Submit" value="Add smartphone" class="btn btn-primary" />
	</div>
	</form>
	
	<jsp:include page="footer.jsp" />
</body>
</html>