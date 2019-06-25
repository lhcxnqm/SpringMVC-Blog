package blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import blog.utils.DBUtils;

public class UserDao {
	
	//判断登录时用户名和密码是否正确
	public boolean isValid(String username,String password) {
		boolean valid=false;
		
		Connection conn = DBUtils.getConnection();
		try {
			PreparedStatement stat = conn.prepareStatement("select * from user where username=? and password=?");
			stat.setString(1, username);
			stat.setString(2, password);
			ResultSet rs = stat.executeQuery();
			if(rs.next()) {
				valid = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.closeQuietly(conn);
		}
		
		return valid;
	}
	
	//判断注册时用户名是否已经存在
	public boolean isExists(String username) {
		boolean valid = false;
		Connection conn = DBUtils.getConnection();
		try {
			PreparedStatement stat = conn.prepareStatement("select * from user where username=?");
			stat.setString(1, username);
			ResultSet rs = stat.executeQuery();
			if(rs.next()) {
				valid = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.closeQuietly(conn);
		}
		
		return valid;		
	}
	
	//注册后往数据表里增加用户
	public void addUser(String username,String password) {
		Connection conn = DBUtils.getConnection();
		try {
			PreparedStatement stat = conn.prepareStatement("insert into user(username,password) values(?,?)");
			stat.setString(1, username);
			stat.setString(2, password);
			stat.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.closeQuietly(conn);
		}
		
	}
	
}
