<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
 
<html>
   <head>
      <jsp:include page="includes.jsp" />
      <title>Customers</title>
   </head>

   <body>
   		<jsp:include page="header.jsp" />
      <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/smstore"
         user = "root"  password = "newrootpasswords"/>
 
      <sql:query dataSource = "${snapshot}" var = "result">
         SELECT * from customer;
      </sql:query>
 	<div class="col-md-12">
 	<div class="col-md-2"></div>
 	<div class="col-md-8">
 	</br>
 	<h4>List of Customers</h4>
 	
      <table border = "1" width = "100%">
         <tr>
            <th>Name</th>
            <th>Address</th>
            <th>Phone</th>
            <th>ID</th>
         </tr>
         
         <c:forEach var = "row" items = "${result.rows}">
            <tr>
               <td><c:out value = "${row.Name}"/></td>
               <td><c:out value = "${row.Address}"/></td>
               <td><c:out value = "${row.Phone}"/></td>
               <td><c:out value = "${row.Id}"/></td>
            </tr>
         </c:forEach>
      </table>
      	<br /><br />
	
      </div>
      <div class="col-md-2"></div>
      </div>
 	<jsp:include page="footer.jsp" />
   </body>
</html>