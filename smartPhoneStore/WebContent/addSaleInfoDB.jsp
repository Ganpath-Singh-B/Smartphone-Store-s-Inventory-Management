<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
 
<html>
   <head>
   	  <jsp:include page="includes.jsp" />
      <title>Add Sale info to database</title>
   </head>

   <body>
   <jsp:include page="header.jsp" />
   
   <%
	String Date=request.getParameter("date");
	String Quantity=request.getParameter("quantity");
	String CustomerID=request.getParameter("customerid");
	String SId=request.getParameter("sid");
	
	
	try {    
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/smstore", "root", "newrootpasswords");
		Statement st=conn.createStatement();
		
		ResultSet rs = st.executeQuery("SELECT Quantity from inventory where SId = " + SId);
		rs.next();
		int inInventory = rs.getInt("Quantity");
		
		String priceQuery = "SELECT Price from smartphone where Id = " + SId;
		ResultSet rs1 = st.executeQuery(priceQuery);
		rs1.next();
		int price = rs1.getInt("Price");
		
		int updatedQuantity = inInventory - Integer.parseInt(Quantity);
		
		st.executeUpdate("update inventory set Quantity = '" + updatedQuantity + "' where SId = " +SId);
	
		st.executeUpdate("insert into sale values('"+Date+"','"+SId+"','"+Quantity+"','"+price+"','"+CustomerID+"')");
		
		
		
	}
	catch(Exception e) {
		System.out.print(e);
		e.printStackTrace();
	}
	%>
   
   
   
   
      <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/smstore"
         user = "root"  password = "newrootpasswords"/>
 
      <sql:query dataSource = "${snapshot}" var = "result">
         SELECT * from sale;
      </sql:query>
      
      <br />
      
      <div class="col-md-12"></div>
 	  <div class="col-md-2"></div>
 	  <div class="col-md-8">
 	  
 	  <h5>A sale has been made!!</h5>
 
      <table border = "1" width = "100%">
         <tr>
            <th>Date of sale</th>
            <th>SId</th>
            <th>Quantity</th>
            <th>Price</th>
            <th>Customer ID</th>
         </tr>
         
         <c:forEach var = "row" items = "${result.rows}">
            <tr>
               <td><c:out value = "${row.Date}"/></td>
               <td><c:out value = "${row.SId}"/></td>
               <td><c:out value = "${row.Quantity}"/></td>	
               <td><c:out value = "${row.Price}"/></td>
               <td><c:out value = "${row.CustomerID}"/></td>
            </tr>
         </c:forEach>
      </table>
 
 	<div class="col-md-2"></div>
      </div> 
 		
 	<jsp:include page="footer.jsp" />
   </body>
</html>