package com.spring.myapp.domain;

public class BoardReply {
	
	private String commentNum;
	private String commentBrdNum;
	private String commentId;
	private String commentPwd;
	private String commentContents;
	private String commentDate;
	private String commentDepth;
	private String commentOrder;
	private String commentParent;
	
	public BoardReply() { }
	
	
	public BoardReply(String commentNum, String commentBrdNum, String commentId, String commentPwd,
			String commentContents, String commentDate, String commentDepth, String commentOrder,
			String commentParent) {
		super();
		this.commentNum = commentNum;
		this.commentBrdNum = commentBrdNum;
		this.commentId = commentId;
		this.commentPwd = commentPwd;
		this.commentContents = commentContents;
		this.commentDate = commentDate;
		this.commentDepth = commentDepth;
		this.commentOrder = commentOrder;
		this.commentParent = commentParent;
	}
	public String getCommentNum() {
		return commentNum;
	}
	public void setCommentNum(String commentNum) {
		this.commentNum = commentNum;
	}
	public String getCommentBrdNum() {
		return commentBrdNum;
	}
	public void setCommentBrdNum(String commentBrdNum) {
		this.commentBrdNum = commentBrdNum;
	}
	public String getCommentId() {
		return commentId;
	}
	public void setCommentId(String commentId) {
		this.commentId = commentId;
	}
	public String getCommentPwd() {
		return commentPwd;
	}
	public void setCommentPwd(String commentPwd) {
		this.commentPwd = commentPwd;
	}
	public String getCommentContents() {
		return commentContents;
	}
	public void setCommentContents(String commentContents) {
		this.commentContents = commentContents;
	}
	public String getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}
	public String getCommentDepth() {
		return commentDepth;
	}
	public void setCommentDepth(String commentDepth) {
		this.commentDepth = commentDepth;
	}
	public String getCommentOrder() {
		return commentOrder;
	}
	public void setCommentOrder(String commentOrder) {
		this.commentOrder = commentOrder;
	}
	public String getCommentParent() {
		return commentParent;
	}
	public void setCommentParent(String commentParent) {
		this.commentParent = commentParent;
	}
	
	
	
}
