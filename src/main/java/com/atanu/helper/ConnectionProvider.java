package com.atanu.helper;
import java.sql.*;

public class ConnectionProvider {
		private static Connection con;
		
		
		public static Connection getConnection()
		{
			try {
				if(con==null)
				{
					Class.forName("com.mysql.cj.jdbc.Driver");
					
					String URL = "jdbc:mysql://localhost/blogbox";
					String USER = "root";
					String PASS = "";
					
					con=DriverManager.getConnection(URL,USER,PASS);
				}
				
				
			}catch(Exception e)
			{
				e.printStackTrace();
			}
			
			return con;
		}
}
