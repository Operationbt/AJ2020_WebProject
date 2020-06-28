package dto;

import java.sql.Date;
import java.sql.Timestamp;

public class ProjReviewDataBean implements java.io.Serializable{
	private int id;
	private String writer;
	private String title;
	private Timestamp date;
	private String content;
	private String imageURL;
	private boolean approval;	//기본값 허용 ture
	private int pid;
	
	public ProjReviewDataBean() {
		this(0, null, null, null, null, null, true, 0);
	}
	
	public ProjReviewDataBean(int id, String writer, String title, Timestamp date, String content, String imageURL,
			boolean approval, int pid) {
		super();
		this.id = id;
		this.writer = writer;
		this.title = title;
		this.date = date;
		this.content = content;
		this.imageURL = imageURL;
		this.approval = approval;
		this.pid = pid;
	}
	
	//후기 작성시 id, approval 필요 없음
	public ProjReviewDataBean(String writer, String title, Timestamp date, String content, String imageURL, int pid) {
		this();
		this.writer = writer;
		this.title = title;
		this.date = date;
		this.content = content;
		this.imageURL = imageURL;
		this.pid = pid;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImageURL() {
		return imageURL;
	}
	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}
	public boolean isApproval() {
		return approval;
	}
	public void setApproval(boolean approval) {
		this.approval = approval;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	@Override
	public String toString() {
		return "ProjReviewDataBean [id=" + id + ", writer=" + writer + ", title=" + title + ", date=" + date
				+ ", content=" + content + ", imageURL=" + imageURL + ", approval=" + approval + ", pid=" + pid + "]";
	}
	
	
}
