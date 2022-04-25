package com.atanu.dao;
import java.sql.*;

import com.atanu.entities.User;
public class UserDao {
	private Connection connection;

	public UserDao(Connection connection) {
		super();
		this.connection = connection;
	}
	
	
	public boolean saveUser(User user)
	{ boolean f=false;
		try {
			
			String query="select * from `user` where email=? ";
			PreparedStatement pstat=	connection.prepareStatement(query);
			pstat.setString(1, user.getEmail());
		ResultSet restResultSet=pstat.executeQuery();
		
//		System.out.println(restResultSet);
		
		if(restResultSet.next())
		{
			return f;
		}else {
			
			String queryString="INSERT INTO `user`( `name`, `email`, `password`) VALUES (?,?,?) ";
			
			PreparedStatement pstate=	connection.prepareStatement(queryString);
			pstate.setString(1, user.getName());
			pstate.setString(2, user.getEmail());
			pstate.setString(3, user.getPassword());
			pstate.executeUpdate();
			f=true;
			
		}
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	
	public User getuserbyEmail(String email,String password) throws SQLException {
		User user=null;
		
		String query="select * from `user` where email=? and password=?";
		PreparedStatement pstat=	connection.prepareStatement(query);
		pstat.setString(1, email);
		pstat.setString(2, password);
	ResultSet restResultSet=pstat.executeQuery();
	
	if(restResultSet.next())
	{
		user=new User();
		String user_name=restResultSet.getString("name");
		String user_email=restResultSet.getString("email");
		user.setName(user_name);
		user.setId(restResultSet.getInt("id"));
		user.setEmail(user_email);
		user.setProfileImage(restResultSet.getString("profileImage"));
	}
	return user;
	
	}
	
	public boolean updateUser(User user)
	{  boolean f=false;
		
		try {
			String query = "update user set name=? , profileImage=? where  id =?";
	        PreparedStatement p = connection.prepareStatement(query);
	        p.setString(1, user.getName());
	        p.setString(2, user.getProfileImage());
	        p.setInt(3, user.getId());
	        
	        p.executeUpdate();
            f = true;
	        
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
	}
	
	
	public User getUserByUserId(int userId) {
        User user = null;
        try {
            String q = "select * from user where id=?";
            PreparedStatement ps = this.connection.prepareStatement(q);
            ps.setInt(1, userId);
            ResultSet set = ps.executeQuery();
            if (set.next()) {
                user = new User();

//             data from db
                String name = set.getString("name");
//             set to user object
                user.setName(name);

                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
              
                user.setProfileImage(set.getString("profileImage"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }
}
