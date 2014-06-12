package ca.on.conestogac;
import java.sql.*;
public class sSqlStatement {
	String name = request.getParameter("q");
	name = name.toLowerCase();
	String sSQL = "SELECT * FROM firstview WHERE bread LIKE '"
			+ name + "%' OR manufacturers LIKE '" + name
			+ "%' OR available LIKE '" + name
			+ "%' OR storeName LIKE '" + name
			+ "%' OR storeAddress LIKE '" + name
			+ "%' OR City LIKE '" + name + "%' OR Postcode LIKE '"
			+ name + "%'";
}
