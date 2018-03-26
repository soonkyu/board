package com.spring.myapp.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spring.myapp.dao.BoardDao;
import com.spring.myapp.domain.Board;
import com.spring.myapp.domain.BoardReply;
import com.spring.myapp.service.BoardService;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Resource(name="boardDao")
	private BoardDao boardDao;

	@Override
	public int regContent(Board board) {
		return boardDao.regContent(board);
	}

	@Override
	public int getContentCnt(Map<String, Object> paramMap) {
		return boardDao.getContentCnt(paramMap);
	}

	@Override
	public List<Board> getContentList(int start,int end) {
		return boardDao.getContentList(start,end);
	}

	@Override
	public Board getContentView(int idx) {
		return boardDao.getContentView(idx);
	}

	@Override
	public int regReply(Map<String, Object> paramMap) {
		return boardDao.regReply(paramMap);
	}

	@Override
	public int delReply(Map<String, Object> paramMap) {
		return boardDao.delReply(paramMap);
	}

	@Override
	public int getBoardCnt() {
		return boardDao.getBoardCnt();
	}

	@Override
	public int delBoard(Map<String, Object> paramMap) {
		return boardDao.delBoard(paramMap);
	}

	@Override
	public int test() {
		return 10;
	}

	@Override
	public int getBoardCheck(Map<String, Object> paramMap) {
		return boardDao.getBoardCheck(paramMap);
	}

	@Override
	public int updateContent(Board board) {
		return boardDao.updateContent(board);
	}

	@Override
	public int MaxCommentIdx() {
		
		return boardDao.MaxCommentIdx();
	}

	@Override
	public List<BoardReply> selectComment(int commentBrdNum) {
		return boardDao.selectComment(commentBrdNum);
	}

}
