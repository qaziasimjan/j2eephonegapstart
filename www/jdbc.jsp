<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="ca.on.conestogac.*"%>
<%@page import="java.sql.*"%>
<%@page import="org.json.simple.*"%>
<%@page import="org.json.simple.parser.*"%>

<html><head><title>Sibghat Database</title>
<link rel="stylesheet" href="css/mainJS.css" type="text/css"/>
</head><body>
<div id="main">
<h1>Sibghat</h1>
<div class="container">
		<form id="searchForm">
			<input type="text" name="q" placeholder="search term" />
			<button type="submit">Search</button>
		</form>
		<h1>Check Bread's Availability</h1>
		<table>
		        <thead>
		        <tr><th>Bread's Name</th><th>Manufacturer</th><th>Availability</th><th>Store's Name</th><th>Store's Address</th><th>City</th><th>Province</th><th>PostCode</th><th>Country</th><th>Store's Image</th></tr>
		        </thead>
<%
try{
	Connection oConnection = OpenShiftDataSource.getConnection(
			getServletContext().getInitParameter("the.db"));	
	String name = request.getParameter("q");
	name = name.toLowerCase();
	Statement oStmt = oConnection.createStatement();
	String sSQL = "SELECT bread, manufacturers, available, storeName, storeAddress, City, Province, Postcode, Country, storeImage FROM firstview where bread LIKE '"+name+ "%' OR manufacturers LIKE '"+name+ "%' OR available LIKE '"+name+ "%' OR storeName LIKE '"+name+ "%' OR storeAddress LIKE '"+name+ "%' OR City LIKE '"+name+ "%' OR Postcode LIKE '"+name+ "%'";
	ResultSet oRs = oStmt.executeQuery(sSQL);	
	ResultSetMetaData rsmd = oRs.getMetaData();
	int nCols = rsmd.getColumnCount();
	%><tr><%
	/*for (int Kcol = 1; Kcol <= nCols; Kcol++) {
		out.print("<td><b>" + rsmd.getColumnName(Kcol)+ "</b></td>");
	}*/%></tr><%				
	while (oRs.next()){	
		%><tr><%
		for (int Kcol = 1; Kcol <= nCols-1; Kcol++){
	out.print("<td>" + oRs.getString(Kcol)+"</td>");	
		}
		out.print("<td>" + "<img src='/j2eephonegapstart/www/image/"+ oRs.getString(10) +"'/></td>");
		%></tr><%
	}
	oStmt.close();
	oConnection.close();
	%></table><%
}
catch(Exception e)
{
	out.println(e.toString());
}
%>
<h3>Bread's Details</h3>
		 <table id="tableRight">		
	        <tr><td>Name</td><td bread </td></tr>
	        <tr><td>Size</td><td>Size </td></tr>
	        <tr><td>Price (Dollars)</td><td>Price</td></tr>
			<tr><td>Image</td><td>Image Destination</td></tr>
		</table>

</div>
</body></html>






