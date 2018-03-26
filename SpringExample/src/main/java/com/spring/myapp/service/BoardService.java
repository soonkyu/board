package com.spring.myapp.service;

import java.util.List;
import java.util.Map;

import com.spring.myapp.domain.Board;
import com.spring.myapp.domain.BoardReply;

public interface BoardService {
	
	int regContent(Board board);
	
	int updateContent(Board board);
	
	int getContentCnt(Map<String, Object> paramMap);
	
	List<Board> getContentList(int start,int end);
	
	Board getContentView(int idx);
	
	int regReply(Map<String, Object> paramMap);
	
	int delReply(Map<String, Object> paramMap);
	
	int getBoardCnt();
	
	int getBoardCheck(Map<String, Object> paramMap);
	
	int delBoard(Map<String, Object> paramMap);
	
	int test();
	
	int MaxCommentIdx();
	
	List<BoardReply> selectComment(int commentBrdNum);
}
