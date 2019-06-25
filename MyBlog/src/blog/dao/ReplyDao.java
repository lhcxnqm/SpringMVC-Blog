package blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import blog.bean.Reply;
import blog.utils.DBUtils;

public class ReplyDao {
	
	//获取所有的评论
	public List<Reply> getAll(){
		List<Reply> Replys = new ArrayList<Reply>();
		Connection conn = DBUtils.getConnection();
		try {
			PreparedStatement stat = conn.prepareStatement("select * from reply");
			ResultSet rs = stat.executeQuery();
			while(rs.next()) {
				Reply reply = new Reply();
				reply.setId(rs.getInt("id"));
				reply.setContent(rs.getString("content"));
				reply.setUsername(rs.getString("username"));
				reply.setTitle(rs.getString("title"));
				reply.setCreated_at(rs.getTimestamp("created_at"));
				Replys.add(reply);			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.closeQuietly(conn);
		}
		
		return Replys;
	}
	
	//根据文章标题模糊查找该文章的所有评论
	public List<Reply> getReply(String title){
		List<Reply> replys = new ArrayList<Reply>();
		Connection conn = DBUtils.getConnection();
		try {
			PreparedStatement stat = conn.prepareStatement("select * from reply join post on reply.title=post.title where reply.title like ?");
			stat.setString(1, "%"+title+"%");
			ResultSet rs = stat.executeQuery();
			while(rs.next()) {
				Reply reply = new Reply();
				reply.setId(rs.getInt("id"));
				reply.setContent(rs.getString("content"));
				reply.setUsername(rs.getNString("username"));
				reply.setTitle(rs.getNString("title"));
				reply.setCreated_at(rs.getTimestamp("created_at"));
				replys.add(reply);			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.closeQuietly(conn);
		}
		
		return replys;
	}
	
	//根据id删除对应的评论
	public void deleteReply(int id) {
		Connection conn = DBUtils.getConnection();
		try {
			PreparedStatement stat = conn.prepareStatement("delete from reply where id=?");
			stat.setInt(1, id);
			stat.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.closeQuietly(conn);
		}
	}
	
	//根据文章id获取对应的评论
	public List<Reply> getReplyById(int id){
		List<Reply> replys = new ArrayList<Reply>();
		Connection conn = DBUtils.getConnection();
		try {
			PreparedStatement stat = conn.prepareStatement("select * from reply join post on reply.title=post.title where post.id=?");
			stat.setInt(1, id);
			ResultSet rs = stat.executeQuery();
			while(rs.next()) {
				Reply reply = new Reply();
				reply.setId(rs.getInt("id"));
				reply.setContent(rs.getString("content"));
				reply.setUsername(rs.getNString("username"));
				reply.setTitle(rs.getNString("title"));
				reply.setCreated_at(rs.getTimestamp("created_at"));
				replys.add(reply);			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.closeQuietly(conn);
		}
		
		return replys;
	}
	
	//添加评论
	public void addReply(String content,String username,String title) {
		Connection conn = DBUtils.getConnection();
		try {
			PreparedStatement stat = conn.prepareStatement("insert into reply(content,username,title) values(?,?,?)");
			stat.setString(1, content);
			stat.setString(2, username);
			stat.setNString(3, title);
			stat.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.closeQuietly(conn);
		}
		
	}
	
}
