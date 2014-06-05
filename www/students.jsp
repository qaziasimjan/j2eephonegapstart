<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="ca.on.conestogac.*"%>
<%@page import="java.sql.*"%>
<%@page import="org.json.simple.*"%>
<%@page import="org.json.simple.parser.*"%>
<h1>Sibghat</h1>
<table>
<%
try{
	Connection oConnection = OpenShiftDataSource.getConnection(
			getServletContext().getInitParameter("the.db"));
	Statement oStmt = oConnection.createStatement();
	String sSQL = "SELECT * FROM students";	
	ResultSet oRs = oStmt.executeQuery(sSQL);	
	String oNrs = ResultSetValue.toJsonString(oRs);
	JSONParser parser=new JSONParser();
	Object obj = parser.parse(oNrs);

	JSONArray list = (JSONArray)obj;
	//for (int n = 0; n <= oNrs.length(); n++)
	
	out.println(list.get(3));
}
catch(Exception e)
{
	out.println(e.toString());
}
%>
