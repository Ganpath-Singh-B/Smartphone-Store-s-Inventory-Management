<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="includes.jsp" />
<title>Welcome smartphone store</title>
</head>
<body>

	<jsp:include page="header.jsp" />
	<div class="container-fluid">
                
                <br />
                <br />

                <section class="inlineSection invLinks">
                    <h3>View inventory</h3>
                    
                    <div class="anchorElements">
	                    <a href="phoneInventory.jsp">Phone Inventory</a><br />
	                    <a href="purchase.jsp">Purchase</a><br />
	                    <a href="sale.jsp">Sale</a><br />
	                    <a href="showPhones.jsp">Show Phones</a><br />
                    </div>
                    
                </section>
                
                <section class="inlineSection invLinks">
	                 <h3>Update inventory</h3>
	                    
	                <div class="anchorElements">
		                <a href="addSmartphone.jsp">Add phone</a><br />
		                <a href="addSaleInfo.jsp">Add sale info</a><br />
		                <a href="addPurchaseInfo.jsp">Add purchase info</a><br />
	                </div>
                
                </section>
                
                <section class="inlineSection invLinks">
	                 <h3>Customer</h3>
	                    
	                <div class="anchorElements">
		                <a href="addCustomer.jsp">Add customer</a><br />
		                <a href="listCustomers.jsp">List of customers</a><br />
	                </div>
                
                </section>
                
                
            </div>
            
            <jsp:include page="footer.jsp" />
</body>
</html>