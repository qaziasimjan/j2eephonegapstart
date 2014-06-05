<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="ca.on.conestogac.*"%>
<%@page import="java.sql.*"%>
<%@page import="org.json.simple.*"%>
<%@page import="org.json.simple.parser.*"%>
<html><head><title>Sibghat Database</title>
<link rel="stylesheet" href="css/main.css" type="text/css"/>
</head><body>
<div id="main">
<h1>Sibghat</h1>
<%
try{
	Connection oConnection = OpenShiftDataSource.getConnection(
			getServletContext().getInitParameter("the.db"));
	Statement oStmt = oConnection.createStatement();
	String sSQL = "SELECT * FROM prices";	
	ResultSet oRs = oStmt.executeQuery(sSQL);
	%><table border="10"><%
	ResultSetMetaData rsmd = oRs.getMetaData();
	int nCols = rsmd.getColumnCount();
	%><tr border="10"><%
	for (int Kcol = 1; Kcol <= nCols; Kcol++) {
		out.print("<td><b>" + rsmd.getColumnName(Kcol)+ "</b></td>");
	}%></tr><%				
	while (oRs.next()){	
		%><tr><%
		for (int Kcol = 1; Kcol <= nCols; Kcol++){
	out.print("<td>" + oRs.getString(Kcol) +"</td> ");
	}
		%></tr><%
	}
	%></table><%
}
catch(Exception e)
{
	out.println(e.toString());
}
%>
</br>
</br>
</br>
</br>
</br>
</div>
</body></html>






