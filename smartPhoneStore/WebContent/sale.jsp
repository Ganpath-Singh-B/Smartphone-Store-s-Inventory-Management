<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
 
<html>
   <head>
      <jsp:include page="includes.jsp" />
   	  <jsp:include page="includes.jsp" />
      <title>Sale</title>
   </head>

   <body>
   		<jsp:include page="header.jsp" />
      <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/smstore"
         user = "root"  password = "newrootpasswords"/>
 
      <sql:query dataSource = "${snapshot}" var = "result">
         SELECT sm.Brand as brand, sm.Colour as colour, sm.Model as model, sm.Memory_GB, s.Date as date, s.Quantity as quantity, s.Price as price, c.Name as name from smartphone sm, sale s, customer c where
         s.SId = sm.Id and s.CustomerID = c.Id order by Date;
      </sql:query>
       <div class="col-md-12">
 	<div class="col-md-2"></div>
 	<div class="col-md-8">
 		</br>
 		<h4>Sales</h4>
 
      <table border = "1" width = "100%">
         <tr>
            <th>Brand</th>
            <th>Colour</th>
            <th>Model</th>
            <th>Memory(GB)</th>
            <th>Date</th>
            <th>Quantity</th>
            <th>Price</th>
            <th>Customer Name</th>
         </tr>
         
         <c:forEach var = "row" items = "${result.rows}">
            <tr>
               <td><c:out value = "${row.brand}"/></td>
               <td><c:out value = "${row.colour}"/></td>
               <td><c:out value = "${row.model}"/></td>
               <td><c:out value = "${row.Memory_GB}"/></td>
               <td><c:out value = "${row.date}"/></td>
               <td><c:out value = "${row.quantity}"/></td>
               <td><c:out value = "${row.price}"/></td>
               <td><c:out value = "${row.name}"/></td>
            </tr>
         </c:forEach>
      </table>
 	</div>
      <div class="col-md-2"></div>
      </div>
 	<jsp:include page="footer.jsp" />
   </body>
</html>