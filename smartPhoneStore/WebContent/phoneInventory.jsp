<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
 
<html>
   <head>
      <jsp:include page="includes.jsp" />
      <title>Inventory</title>
   </head>

   <body>
   		<jsp:include page="header.jsp" />
      <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/smstore"
         user = "root"  password = "newrootpasswords"/>
 
      <sql:query dataSource = "${snapshot}" var = "result">
         SELECT s.Brand, s.Colour, s.Model, s.Memory_GB, i.Quantity from smartphone s, inventory i where i.SId = s.Id;
      </sql:query>
      <div class="col-md-12">
 	<div class="col-md-2"></div>
 	<div class="col-md-8">
 		</br>
 		<h4>Inventory</h4>
      <table border = "1" width = "100%">
         <tr>
            <th>Brand</th>
            <th>Colour</th>
            <th>Model</th>
            <th>Memory_GB</th>
            <th>Quantity</th>
         </tr>
         
         <c:forEach var = "row" items = "${result.rows}">
            <tr>
               <td><c:out value = "${row.Brand}"/></td>
               <td><c:out value = "${row.Colour}"/></td>
               <td><c:out value = "${row.Model}"/></td>
               <td><c:out value = "${row.Memory_GB}"/></td>
               <td><c:out value = "${row.Quantity}"/></td>
            </tr>
         </c:forEach>
      </table>
       	<br />
 	
 	</div>
      <div class="col-md-2"></div>
      </div>
 	
 	<jsp:include page="footer.jsp" />
   </body>
</html>