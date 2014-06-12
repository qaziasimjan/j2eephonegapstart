package ca.on.conestogac;
import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletResponse;
public class sSqlStatement extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse res) throws ServletException, IOException {
	doPost(request, res);
	request.setAttribute("PQL", sSQL);
	ServletContext sc = getServletContext();
	RequestDispatcher rd = sc.getRequestDispatcher("/jdbc.jsp");
	rd.forward(request, res);
	
	}
	public String sSQL;
	
	public void setSql(String st){
		sSQL = st;
	}
	public String getSql(){
		return  sSQL;
	}
	public sSqlStatement(String st){
		sSQL = st;
	}	
	public String st = "SELECT * FROM firstview WHERE bread LIKE '"
			+ name + "%' OR manufacturers LIKE '" + name
			+ "%' OR available LIKE '" + name
			+ "%' OR storeName LIKE '" + name
			+ "%' OR storeAddress LIKE '" + name
			+ "%' OR City LIKE '" + name + "%' OR Postcode LIKE '"
			+ name + "%'";	
	
}
