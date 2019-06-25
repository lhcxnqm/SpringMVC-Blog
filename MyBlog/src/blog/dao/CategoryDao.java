package blog.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.sql.Connection;

import blog.bean.Category;
import blog.utils.DBUtils;

public class CategoryDao {
	
	//添加category分类
	public void addCategory(String title) {
		Connection conn=DBUtils.getConnection();
		try {
			PreparedStatement stat = conn.prepareStatement("insert into category(title,created_at) values(?,?)");
			stat.setString(1,title);
			stat.setTimestamp(2, new Timestamp(new Date().getTime()));
			stat.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.closeQuietly(conn);
		}
	}
	
	//判断文章类型是否存在
	public boolean exists(String title) {
		boolean isExists = false;
		Connection conn=DBUtils.getConnection();
		try {
			PreparedStatement stat = conn.prepareStatement("select * from category where title = ?");
			stat.setString(1, title);
			ResultSet rs=stat.executeQuery();
			if(rs.next()) {
				isExists = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.closeQuietly(conn);
		}
		
		return isExists;
	}
	
	//获得category表里所有数据
	public List<Category> getAll(){
		List<Category> categories = new ArrayList<Category>();
		Connection conn=DBUtils.getConnection();
		try {
			PreparedStatement stat = conn.prepareStatement("select * from category");
			ResultSet rs=stat.executeQuery();
			while(rs.next()) {
				Category category = new Category();
				category.setId(rs.getInt("id"));
				category.setTitle(rs.getString("title"));
				category.setCreated_at(rs.getTimestamp("created_at"));
				categories.add(category);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.closeQuietly(conn);
		}
		
		return categories;
	}
	
	//根据id获取分类信息
	public Category getCategory(int id) {
		Category category = new Category();
		Connection conn = DBUtils.getConnection();
		try {
			PreparedStatement stat = conn.prepareStatement("select * from category where id=?");
			stat.setInt(1, id);
			ResultSet rs = stat.executeQuery();
			if(rs.next()) {
				category.setId(rs.getInt("id"));
				category.setTitle(rs.getString("title"));
				category.setCreated_at(rs.getTimestamp("created_at"));
			}									
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.closeQuietly(conn);
		}
		
		return category;
	}
	
	//修改分类信息
	public void editCategory(int id,String title) {
		Connection conn = DBUtils.getConnection();
		try {
			PreparedStatement stat = conn.prepareStatement("update category set title=? where id=?");
			stat.setString(1, title);
			stat.setInt(2, id);
			stat.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.closeQuietly(conn);
		}		
	}
	
	//根据id删除指定的category
	public void deleteCategory(int id) {
		Connection conn = DBUtils.getConnection();
		try {
			PreparedStatement stat = conn.prepareStatement("delete from category where id=?");
			stat.setInt(1, id);
			stat.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.closeQuietly(conn);
		}
	}
	
	//计数功能：根据category类型获得该类型的文章数量，该类型文章浏览总次数，该类型浏览数最多的文章
	public String[] getCount(String title) {
		Connection conn = DBUtils.getConnection();
		String[] statisticsCount = new String[3];
	    try {
			PreparedStatement stat = conn.prepareStatement("select count(*),sum(view_count) from post join category on post.category_title=category.title where post.category_title=?");
			stat.setString(1, title);
			ResultSet rs = stat.executeQuery();
			if (rs.next()) {
				statisticsCount[0] = rs.getString("count(*)");
				statisticsCount[1] = rs.getString("sum(view_count)");				
			}
			
			stat = conn.prepareStatement("select title as mytitle from post where view_count=(select max(view_count) from post join category on post.category_title=category.title where post.category_title=?)");
			stat.setString(1, title);
			rs = stat.executeQuery();
			if(rs.next()) statisticsCount[2] = rs.getString("mytitle");
			
	    } catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.closeQuietly(conn);
		}
		
	    return statisticsCount;
	}
	
}
