package org.ncibi.resource.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class MysqlConnect{
	  public static void main(String[] args) {
	  System.out.println("MySQL Connect Example.");
	  Connection conn = null;
	  String url = "jdbc:mysql://localhost:3306/";
	  String dbName = "serverapps";
	  String driver = "com.mysql.jdbc.Driver";
	  String userName = "snehal"; 
	  String password = "snehal";
	  try {
	  Class.forName(driver).newInstance();
	  conn = DriverManager.getConnection(url+dbName,userName,password);
	  System.out.println("Connected to the database");
	  conn.close();
	  System.out.println("Disconnected from database");
	  } catch (Exception e) {
	  e.printStackTrace();
	  }
	  }
	}