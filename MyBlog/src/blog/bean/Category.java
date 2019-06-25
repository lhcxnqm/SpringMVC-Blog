package blog.bean;

import java.util.Date;

public class Category {
	private int id;
	private String title;
	private Date created_at;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
	//这是用来表示每种类型对应文章的数量
	private String category_count;
	public String getCategory_count() {
		return category_count;
	}
	public void setCategory_count(String category_count) {
		this.category_count = category_count;
	}
	
	//用来表示该类型文章浏览的总次数
	private String view_count;
	public String getView_count() {
		if (view_count != null)
			return view_count;
		return "0";
	}
	public void setView_count(String view_count) {
		this.view_count = view_count;
	}
	
	//用来表示该类型浏览最多的文章
	private String popularPost;
	public String getPopularPost() {
		return popularPost;
	}
	public void setPopularPost(String popularPost) {
		this.popularPost = popularPost;
	}
	
}
