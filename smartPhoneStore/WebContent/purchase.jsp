<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
 
<html>
   <head>
      <jsp:include page="includes.jsp" />
      <title>Purchases</title>
   </head>

   <body>
   		<jsp:include page="header.jsp" />
      <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/smstore"
         user = "root"  password = "newrootpasswords"/>
 
      <sql:query dataSource = "${snapshot}" var = "result">
         SELECT s.Brand, s.Model, p.Date, p.BatchNo, p.Quantity, p.Unit_price, p.Sale_price from smartphone s, purchase p where p.SId = s.Id order by Date;
      </sql:query>
 		 <div class="col-md-12">
 		 <div class="col-md-2"></div>
 		 <div class="col-md-8">
 		</br>
 		<h4>Purchase</h4>
      <table border = "1" width = "100%">
         <tr>
         	<th>Brand</th>
         	<th>Model</th>
            <th>Date</th>
            <th>Batch no</th>
            <th>Quantity</th>
            <th>Unit Price</th>
            <th>Sale Price</th>
         </tr>
         
         <c:forEach var = "row" items = "${result.rows}">
            <tr>
               <td><c:out value = "${row.Brand}"/></td>
               <td><c:out value = "${row.Model}"/></td>
               <td><c:out value = "${row.Date}"/></td>
               <td><c:out value = "${row.BatchNo}"/></td>
               <td><c:out value = "${row.Quantity}"/></td>
               <td><c:out value = "${row.Unit_price}"/></td>
               <td><c:out value = "${row.Sale_price}"/></td>
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