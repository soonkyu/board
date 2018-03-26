package com.spring.myapp.domain;

public class Board {
	
	private String idx;
	private String name;
	private String pwd;
	private String title;
	private String contents;
	private String currentdate;
	private String noticeChk;
	
	public Board() {}
	
	public Board(String idx, String name, String pwd, String title, String contents, String currentdate,
			String noticeChk) {
		this.idx = idx;
		this.name = name;
		this.pwd = pwd;
		this.title = title;
		this.contents = contents;
		this.currentdate = currentdate;
		this.noticeChk = noticeChk;
	}


	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getCurrentdate() {
		return currentdate;
	}
	public void setCurrentdate(String currentdate) {
		this.currentdate = currentdate;
	}
	public String getNoticeChk() {
		return noticeChk;
	}
	public void setNoticeChk(String noticeChk) {
		this.noticeChk = noticeChk;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Board [idx=");
		builder.append(idx);
		builder.append(", name=");
		builder.append(name);
		builder.append(", pwd=");
		builder.append(pwd);
		builder.append(", title=");
		builder.append(title);
		builder.append(", contents=");
		builder.append(contents);
		builder.append(", currentdate=");
		builder.append(currentdate);
		builder.append(", noticeChk=");
		builder.append(noticeChk);
		builder.append("]");
		return builder.toString();
	}
	
	
	
}
