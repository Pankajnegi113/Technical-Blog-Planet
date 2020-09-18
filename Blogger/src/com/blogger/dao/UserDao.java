package com.blogger.dao;

import java.sql.*;

import com.blogger.entities.User;
public class UserDao {
	private Connection con;

	public UserDao(Connection con) {
		super();
		this.con = con;
	}

	//registering the user-saving data in user table
	public boolean saveUser(User user) 
	{
		boolean saved=false;
		try
		{
			String q= "Insert into User(name,email,password,gender) values(?,?,?,?)";
			PreparedStatement psmt = con.prepareStatement(q);
			psmt.setString(1, user.getName());
			psmt.setString(2, user.getEmail());
			psmt.setString(3, user.getPassword());
			psmt.setString(4, user.getGender());
			psmt.executeUpdate();
			saved=true;
		}

		catch(Exception e)
		{
			e.printStackTrace();
		}
		return saved;
	}
	
	
	public User getUserByEmailPwd(String email,String password) 
	{
		User user = null;
		try
		{
			String q = "Select * from User where email =? and password=?";
			PreparedStatement psmt = con.prepareStatement(q);
			psmt.setNString(1, email);
			psmt.setNString(2, password);
			//since we will get only one user, so get by using if only, no need of while loop
			ResultSet set = psmt.executeQuery();
			
			if(set.next())
			{
				user = new User();
				user.setId(set.getInt("id"));
				user.setName(set.getString("name"));
				user.setEmail(email);set.getString("email");
				user.setGender(set.getString("gender"));
				user.setPassword(set.getString("password"));
				user.setDate(set.getTimestamp("rdate"));
				user.setProfile(set.getString("profile"));
			}
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return user;
		
	}
	
	public boolean updateUserInfo(User user)
	{
		boolean flag=false;
		try 
		{
			String q = "Update user set email=?, name=? ,password=?, gender=?, profile=? where id=?";
			PreparedStatement psmt = con.prepareStatement(q);
			psmt.setString(1, user.getEmail());
			psmt.setString(2, user.getName());
			psmt.setString(3, user.getPassword());
			psmt.setString(4, user.getGender());
			psmt.setString(5, user.getProfile());
			psmt.setInt(6, user.getId());
			psmt.executeUpdate();
			flag=true;
			
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return flag;
	}
	
	
	

}
