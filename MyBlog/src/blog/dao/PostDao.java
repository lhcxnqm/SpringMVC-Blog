package blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import blog.bean.Post;
import blog.utils.DBUtils;

public class PostDao {

	//添加文章
	public void addPost(String title,String content,String category_title) {
		Connection conn = DBUtils.getConnection();
		try {
			PreparedStatement stat = conn.prepareStatement("insert into post(title,content,category_title) values(?,?,?)");
			stat.setString(1, title);
			stat.setString(2, content);
			stat.setString(3, category_title);
			stat.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.closeQuietly(conn);
		}
	}
	
	//根据id删除指定的文章
	public void deletePost(int id) {
		Connection conn = DBUtils.getConnection();
		try {
			PreparedStatement stat = conn.prepareStatement("delete from post where id=?");
			stat.setInt(1, id);
			stat.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.closeQuietly(conn);
		}
	}
	
	//获得Post表里所有数据
	public List<Post> getAll(){
		List<Post> Posts= new ArrayList<Post>();
		Connection conn = DBUtils.getConnection();
		try {
			PreparedStatement stat = conn.prepareStatement("select * from post");
			ResultSet rs = stat.executeQuery();
			while(rs.next()) {
				Post post= new Post();
				post.setId(rs.getInt("id"));
				post.setTitle(rs.getString("title"));
				post.setContent(rs.getString("content"));
				post.setCategory_title(rs.getString("category_title"));
				post.setView_count(rs.getInt("view_count"));
				post.setCreated_at(rs.getTimestamp("created_at"));
				Posts.add(post);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.closeQuietly(conn);
		}
		
		return Posts;
	}
	
	//根据id获取文章信息
	public Post getPost(int id) {
		Post post= new Post();
		Connection conn = DBUtils.getConnection();
		try {
			PreparedStatement stat = conn.prepareStatement("select * from post where id=?");
			stat.setInt(1, id);
			ResultSet rs= stat.executeQuery();
			if(rs.next()) {
				post.setId(rs.getInt("id"));
				post.setTitle(rs.getString("title"));
				post.setContent(rs.getString("content"));
				post.setCategory_title(rs.getString("category_title"));
				post.setView_count(rs.getInt("view_count"));
				post.setCreated_at(rs.getTimestamp("created_at"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.closeQuietly(conn);
		}
		
		return post;
	}
	
	//修改文章信息
	public void editPost(int id,String title,String content) {
		Connection conn = DBUtils.getConnection();
		try {
			PreparedStatement stat = conn.prepareStatement("update post set title=?,content=? where id=?");
			stat.setString(1, title);
			stat.setString(2, content);
			stat.setInt(3, id);
			stat.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.closeQuietly(conn);
		}		
	}
	
	//浏览次数加1功能
	public void addViewCount(int id) {
		Connection conn = DBUtils.getConnection();
		try {
			PreparedStatement stat = conn.prepareStatement("update post set view_count=view_count+1 where id=?");
			stat.setInt(1, id);
			stat.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.closeQuietly(conn);
		}
	}
	
	//获取所有文章的数量
	public String getPostCount() {
		String count = null;
		Connection conn = DBUtils.getConnection();
		try {
			PreparedStatement stat = conn.prepareStatement("select count(*) from post");
			ResultSet rs = stat.executeQuery();
			if(rs.next())
				count = rs.getString("count(*)");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.closeQuietly(conn);
		}
		
		return count;
	}
	
	//搜寻文章，模糊查找
	public List<Post> searchPost(String title) {
		List<Post> Posts = new ArrayList<Post>();
		Connection conn = DBUtils.getConnection();
		try {
			PreparedStatement stat = conn.prepareStatement("select * from post where title like ? ");
			stat.setString(1, "%"+title+"%");
			ResultSet rs = stat.executeQuery();
			while(rs.next()) {
				Post post = new Post();
				post.setId(rs.getInt("id"));
				post.setTitle(rs.getString("title"));
				post.setContent(rs.getString("content"));
				post.setCategory_title(rs.getString("category_title"));
				post.setView_count(rs.getInt("view_count"));
				post.setCreated_at(rs.getTimestamp("created_at"));
				Posts.add(post);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.closeQuietly(conn);
		}
		
		return Posts;
	}
	
	//获得文章对应的评论数
	public int getReplyCount(String title) {
		int count = 0;
		Connection conn = DBUtils.getConnection();
		try {
			PreparedStatement stat = conn.prepareStatement("select count(*) from reply join post on reply.title=post.title where reply.title=?");
			stat.setString(1, title);
			ResultSet rs = stat.executeQuery();
			if(rs.next()) {
				count = rs.getInt("count(*)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.closeQuietly(conn);
		}
		
		return count;
	}
	
}
