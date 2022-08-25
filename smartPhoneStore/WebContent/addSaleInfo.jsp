<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="includes.jsp" />
<title>Add sale info</title>
</head>
<body>
    <jsp:include page="header.jsp" />

	<form action="addSaleInfoDB.jsp" method="post">
	
		<div class="col-lg-12"></div>
		
		
		<div class="form-group col-lg-4">
		
		<br />
		<h5>Add sale info:-</h5>
		
	
		<label for="date">Sale Date</label> &nbsp;&nbsp;&nbsp;<input type="text" name="date" class="form-control"  />
		<br />
		<label for="quantity">Quantity</label> &nbsp;&nbsp;&nbsp;<input type="text" name="quantity" class="form-control"  />
		<br />
		
		
		
		<!--  Customer drop down -->
		
		
		<label for="customerid"  >Customer</label> &nbsp;&nbsp;&nbsp;
		<select name="customerid"  class="form-control" >
		
			<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
	         url = "jdbc:mysql://localhost:3306/smstore"
	         user = "root"  password = "newrootpasswords"/>
	 
	      	<sql:query dataSource = "${snapshot}" var = "result">
	         	SELECT * from customer;
	      	</sql:query>	         
	         <c:forEach var = "row" items = "${result.rows}">
	         	<option value = '<c:out value = "${row.Id}"/>'><c:out value = "${row.Name}"/></option>
	         </c:forEach>
		
		</select>
		<br />
		
		
		
		<!-- 	Smartphone dropdown -->
		
		
		
		<label for="sid"  >Smartphone</label> &nbsp;&nbsp;&nbsp;
		<select name="sid" class="form-control" >
		
			<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
	         url = "jdbc:mysql://localhost:3306/smstore"
	         user = "root"  password = "newrootpasswords"/>
	 
	      	<sql:query dataSource = "${snapshot}" var = "result">
	         	SELECT * from smartphone;
	      	</sql:query>	         
	         <c:forEach var = "row" items = "${result.rows}">
	         	<option value = '<c:out value = "${row.Id}"/>'><c:out value = "${row.Brand}"/> - <c:out value = "${row.Colour}"/> - <c:out value = "${row.Model}"/> - <c:out value = "${row.Memory_GB}"/></option>
	         </c:forEach>
		
		</select>
		
		<br />
		
		<input type="Submit" value="Add sale info" class="btn btn-primary"/>
		</div>
		
		
		
	</form>
	<jsp:include page="footer.jsp" />
</body>
</html>