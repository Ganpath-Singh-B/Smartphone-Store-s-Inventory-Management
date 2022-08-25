<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
 
<html>
   <head>
      <jsp:include page="includes.jsp" />
      <title>Add Smartphone to database</title>
   </head>

   <body>
   
   	  
   
   
   <jsp:include page="header.jsp" />
   <%
	String Brand=request.getParameter("brand");
	String Colour=request.getParameter("colour");
	String Model=request.getParameter("model");
	String Memory_GB=request.getParameter("memory");
	String ID=request.getParameter("id");

	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/smstore", "root", "newrootpasswords");
		Statement st=conn.createStatement();
	
		int i=st.executeUpdate("insert into smartphone(Brand, Colour, Model, Memory_GB, Id) values('"+Brand+"','"+Colour+"','"+Model+"','"+Memory_GB+"','"+ID+"')");
		//out.println("Data is successfully inserted!");
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
         SELECT * from smartphone;
      </sql:query>
      
      <br />
      
      <div class="col-md-12"></div>
 	  <div class="col-md-2"></div>
 	  <div class="col-md-8">
 	  
 	  <h5>Data is successfully inserted!</h5>
 
 	
 
        <table border = "1" width = "100%">
         <tr>
            <th>Brand Name</th>
            <th>Colour</th>
            <th>Model</th>
            <th>Memory(GB)</th>
            <th>ID</th>
         </tr>
         
         
         
         <c:forEach var = "row" items = "${result.rows}">
            <tr>
               <td><c:out value = "${row.Brand}"/></td>
               <td><c:out value = "${row.Colour}"/></td>
               <td><c:out value = "${row.Model}"/></td>	
               <td><c:out value = "${row.Memory_GB}"/></td>
               <td><c:out value = "${row.ID}"/></td>
            </tr>
         </c:forEach>
      </table>
      
      <div class="col-md-2"></div>
      </div> 
 	<jsp:include page="footer.jsp" />
   </body>
</html>