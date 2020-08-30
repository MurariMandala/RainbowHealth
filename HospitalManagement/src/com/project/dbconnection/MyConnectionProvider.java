package com.project.dbconnection;

import java.sql.Connection;
import java.sql.DriverManager;

public class MyConnectionProvider implements DbConnection {
static Connection conn=null;

public static Connection getConn() {
	try {
		Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
		conn=DriverManager.getConnection(url,userName,passWord);
			
	} catch (Exception e) {
		System.out.println(e);
	}
	return conn;
	
}
}
