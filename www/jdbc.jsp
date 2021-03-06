<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="ca.on.conestogac.*"%>
<%@page import="java.sql.*"%>
<%@page import="org.json.simple.*"%>
<%@page import="org.json.simple.parser.*"%>
<html>
<head>
<title>Sibghat Database</title>
<link rel="stylesheet" href="css/lavish-bootstrap.css" type="text/css" />
<link rel="stylesheet" href="css/mainJS.css" type="text/css" />
</head>
<body>
	<div id="main">

		<div class="container">
			<h1>Sibghat</h1>
			<img src="${pageContext.request.contextPath}/image/Kings5050.jpg" />
			<form id="searchForm">
				<input type="text" name="q" placeholder="search term" />
				<button type="submit">Search</button>
			</form>
			<h2>Check Bread's Availability</h2>
			<table>
				<thead>
					<tr>
						<th>Bread's Name</th>
						<th>Manufacturer</th>
						<th>Availability</th>
						<th>Store's Name</th>
						<th>Store's Address</th>
						<th>City</th>
						<th>Province</th>
						<th>PostCode</th>
						<th>Country</th>
						<th>Store's Image</th>
					</tr>
				</thead>

				<% 
						 Connection oConnection = OpenShiftDataSource
								.getConnection(getServletContext().getInitParameter(
										"the.db"));						
						
						String name = request.getParameter("q");
						if(name != null){
						name = name.toLowerCase();}
						String sSQL = "SELECT * FROM firstview WHERE bread LIKE '"
								+ name + "%' OR manufacturers LIKE '" + name
								+ "%' OR available LIKE '" + name
								+ "%' OR storeName LIKE '" + name
								+ "%' OR storeAddress LIKE '" + name
								+ "%' OR City LIKE '" + name + "%' OR Postcode LIKE '"
								+ name + "%'";							
						Statement oStmt = oConnection.createStatement();												
						ResultSet oRs = oStmt.executeQuery(sSQL);
						ResultSetMetaData rsmd = oRs.getMetaData();
						int nCols = rsmd.getColumnCount();

						String FullPath = "image/";	
						try {
				int nRow = 0;		 
				while (oRs.next()) {
					%>
				
				<tr>
					<%
						if (oRs.getString(1) != null) {
									out.print("<td ><a class='tell' href='#"+nRow+"'/>"
											+ oRs.getString(1) + "</td><td>"
											+ oRs.getString(5) + "</td><td>"
											+ oRs.getString(11) + "</td><td>"
											+ oRs.getString(12) + "</td><td>"
											+ oRs.getString(13) + "</td><td>"
											+ oRs.getString(14) + "</td><td>"
											+ oRs.getString(15) + "</td><td>"
											+ oRs.getString(16) + "</td><td>"
											+ oRs.getString(17) + "</td><td><img src='"
											+ FullPath + oRs.getString(18) + "'/></td>");					
					}//end if				
					%></tr><tr id="<%= nRow++ %>" class="hid" ><td>
					
					 <table class="right">
			<tr><td>	<h3>Bread's Details</h3></td></tr>
						 <% 						 
						 out.print("<tr><td>Name</td><td> " + oRs.getString(1)
						+ "</td></tr><tr><td>Size</td><td> " + oRs.getString(2)
						+ "</td></tr><tr><td>Price</td><td> " + oRs.getString(3)
						+ "</td></tr><tr><td>Bread</td><td><img src=' " + FullPath
						+ oRs.getString(4) + "'/></td></tr>");%>
						</table></td></tr>				
					<%
				}//end while
							oRs.close();
							oConnection.close();
							
						}//end try
						
					catch (Exception e) {
						out.println(e.toString());
					}%>
					
						</table>			
		</div>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.js"></script>
	
		<script>
		$(".hid").hide();
		jQuery(".tell").click(function(evt) {			
			var sHref = $(evt.currentTarget).attr("href");			
			//alert("hello " + sHref);			
			$(".hid").hide();
			$(sHref).show();			
			//return false;
			});		
		</script>
</body>
</html>