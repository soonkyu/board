package com.spring.myapp.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.myapp.dao.BoardDao;
import com.spring.myapp.domain.Board;
import com.spring.myapp.domain.BoardReply;

@Repository("boardDao")
public class BoardDaoImpl implements BoardDao{
	
	@Autowired
    private SqlSession sqlSession;
 
    public void setSqlSession(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    }
    
	@Override
	public int regContent(Board board) {
		int maxIdx=sqlSession.selectOne("maxIdx");
		board.setIdx(maxIdx+1+"");
		return sqlSession.insert("insertContent", board);
	}

	@Override
	public int getContentCnt(Map<String, Object> paramMap) {
		return sqlSession.selectOne("selectContentCnt", paramMap);
	}
	
	@Override
	public List<Board> getContentList(int start,int end) {
		Map<String,Integer> map=new HashMap<>();
		map.put("start", start);
		map.put("end",end);
		return sqlSession.selectList("selectContent", map);
	}

	@Override
	public Board getContentView(int idx) {
		return sqlSession.selectOne("selectContentView", idx);
	}

	@Override
	public int regReply(Map<String, Object> paramMap) {
		return sqlSession.insert("insertBoardReply", paramMap);
	}

	@Override
	public List<BoardReply> getReplyList(Map<String, Object> paramMap) {
		return sqlSession.selectList("selectBoardReplyList", paramMap);
	}

	@Override
	public int delReply(Map<String, Object> paramMap) {
		return sqlSession.delete("deleteBoardReply", paramMap);
	}

	@Override
	public int getBoardCnt() {
		return sqlSession.selectOne("selectBoardCnt");
	}

	@Override
	public int delBoard(Map<String, Object> paramMap) {
		return sqlSession.delete("deleteBoard", paramMap);
	}

	@Override
	public int getBoardCheck(Map<String, Object> paramMap) {
		return sqlSession.selectOne("boardCheck", paramMap);
	}

	@Override
	public int updateContent(Board board) {
		return sqlSession.update("updateBoard", board);
	}

	@Override
	public int MaxCommentIdx() {
		
		return sqlSession.selectOne("MaxCommentIdx");
		
	}

	@Override
	public List<BoardReply> selectComment(int commentBrdNum) {
		return sqlSession.selectList("selectComment", commentBrdNum);
	}

}
