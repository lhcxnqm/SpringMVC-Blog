package blog.bean;

public class Page {
	private int currentPage;	//当前页数
	private int totalPage;		//总页数
	private int countPost;	//总数据条数
	private int eachShow;	//每页显示的条数
	public int getEachShow() {
		return eachShow;
	}
	public void setEachShow(int eachShow) {
		this.eachShow = eachShow;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getCountPost() {
		return countPost;
	}
	public void setCountPost(int countPost) {
		this.countPost = countPost;
	}
		
	public Page(int currentPage,int totalPage,int countPost,int eachShow) {
		this.currentPage = currentPage;
		this.totalPage = totalPage;
		this.countPost = countPost;
		this.eachShow = eachShow;
	}
	
}
