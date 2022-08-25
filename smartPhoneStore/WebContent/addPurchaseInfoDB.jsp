<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
 
<html>
   <head>
   <jsp:include page="includes.jsp" />
      <title>Add Purchaseinfo to database</title>
   </head>

   <body>
   <jsp:include page="header.jsp" />
   
   <%
	String Date=request.getParameter("date");
	String BatchNo=request.getParameter("batchno");
	String Quantity=request.getParameter("quantity");
	String UnitPrice=request.getParameter("unitprice");
	String SalePrice=request.getParameter("saleprice");
	String SId=request.getParameter("sid");
	int quantityBefore = 0;
	try {    
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/smstore", "root", "newrootpasswords");
		Statement st=conn.createStatement();
		
		ResultSet rs = st.executeQuery("SELECT Quantity from inventory where SId = "+SId);
		if(rs.next()) {
			quantityBefore = rs.getInt("Quantity");
		}
		
	
		int i=st.executeUpdate("insert into purchase(Date, BatchNo, Quantity, Unit_price, Sale_price, SId) values('"+Date+"','"+BatchNo+"','"+Quantity+"','"+UnitPrice+"','"+SalePrice+"','"+SId+"')");
		
		st.executeUpdate("update smartphone set Price = '" + SalePrice + "' where Id = " +SId);
		
		if(i != 0) {
			
			if(quantityBefore != 0) {
				int updatedQuantity = quantityBefore + Integer.parseInt(Quantity);			
				int updateInvRes = st.executeUpdate("UPDATE inventory set Quantity = " + updatedQuantity + " WHERE SId = "+SId+"");	
				if(updateInvRes != 0) {
					//out.println("Data is successfully inserted!");
				}
			}
			else {
				int insertInvRes = st.executeUpdate("INSERT INTO inventory(SId, Quantity) VALUES('"+SId+"','"+Quantity+"')");	
				if(insertInvRes != 0) {
					//out.println("Data is successfully inserted!");
				}			
			}
			
		}
		else
			out.println("Something went wrong! Check logs");
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
         SELECT * from purchase;
      </sql:query>
      
      <div class="col-md-12"></div>
 	  <div class="col-md-2"></div>
 	  <div class="col-md-8">
      <br />
      <h5>A purchase has been made!</h5>
 
      <table border = "1" width = "100%">
         <tr>
            <th>Date of purchase</th>
            <th>Batch No</th>
            <th>Quantity</th>
            <th>Unit Price</th>
            <th>Sale Price</th>
            <th>Smartphone ID</th>
         </tr>
         
         <c:forEach var = "row" items = "${result.rows}">
            <tr>
               <td><c:out value = "${row.Date}"/></td>
               <td><c:out value = "${row.BatchNo}"/></td>
               <td><c:out value = "${row.Quantity}"/></td>	
               <td><c:out value = "${row.Unit_price}"/></td>
               <td><c:out value = "${row.Sale_price}"/></td>
               <td><c:out value = "${row.SId}"/></td>
            </tr>
         </c:forEach>
      </table>
      <div class="col-md-2"></div>
      </div>
      
 	<jsp:include page="footer.jsp" />
   </body>
</html>