package test;

import java.sql.Connection;
import java.sql.DriverManager;


public class TestConnectMySQL {
	
	public static void main(String[] args) {
		try{
			String url = "jdbc:mysql://127.0.0.1:3306/mobileshopping";
			String user = "VanNV";
			String password = "123456";

			// Load the Connector/J driver
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			// Establish connection to MySQL
			Connection conn = DriverManager.getConnection(url, user, password);
			System.out.println("Connect successful!");
		}catch(Exception ex){
			System.out.println("Connect error!");
		}
	}

}
