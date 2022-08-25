<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
 
<html>
   <head>
      <jsp:include page="includes.jsp" />
      <title>Add Customer to database</title>
   </head>

   <body>
   <jsp:include page="header.jsp" />
   
   
   <%
	String Name=request.getParameter("name");
	String Address=request.getParameter("address");
	String Phone=request.getParameter("phone");
	String ID=request.getParameter("id");
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/smstore", "root", "newrootpasswords");
		Statement st=conn.createStatement();
	
		int i=st.executeUpdate("insert into customer values('"+Name+"','"+Address+"','"+Phone+"','"+ID+"')");
		
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
         SELECT * from customer;
      </sql:query>
      
      <br />
      
      <div class="col-md-12"></div>
 	  <div class="col-md-2"></div>
 	  <div class="col-md-8">
 	  
 	  <h5>A new customer has been added!</h5>
 
      <table border = "1" width = "100%">
         <tr>
            <th>Customer Name</th>
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
      
      <div class="col-md-2"></div>
      </div>
      
 	<jsp:include page="footer.jsp" />
   </body>
</html>