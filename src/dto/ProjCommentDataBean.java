package dto;

import java.sql.Date;

public class ProjCommentDataBean implements java.io.Serializable{
	private int num;
	private String writer;
	private Date date;
	private String content;
	private int pid;
	
	public ProjCommentDataBean() {
		this(0, null, null, null, 0);
	}
	
	public ProjCommentDataBean(int num, String writer, Date date, String content, int pid) {
		super();
		this.num = num;
		this.writer = writer;
		this.date = date;
		this.content = content;
		this.pid = pid;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	@Override
	public String toString() {
		return "ProjCommentDataBean [num=" + num + ", writer=" + writer + ", date=" + date + ", content=" + content
				+ ", pid=" + pid + "]";
	}
	
	
	
}
