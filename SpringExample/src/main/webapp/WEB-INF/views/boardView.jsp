<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ taglib prefix='layout' tagdir="/WEB-INF/tags/layout" %>
<layout:main_layout>
	
	<div class='w3-container' >	
    	
    	<input type="hidden" id="idx" name="idx" value="${boardView.idx}" />
   		
   		<table class='w3-table-all'>

<!--   권한 설정시 나이외이는 안보이도록 할거임
    				<tr>
   					<td colspan="2" align="right">
   						<input type="password" id="pwd" name="pwd" style="width:200px;" maxlength="10" placeholder="패스워드"/>
   						<button id="modify" name="modify">글 수정</button>
   						<button id="delete" name="delete">글 삭제</button>
   					</td>
   				</tr>
 -->
   			<tr>
   				<td width="900px">
					제목: ${boardView.title}
				</td>
				<td>
					작성자: ${boardView.name}
				</td>
   			</tr>
   			<tr height="500px">
   				<td colspan="2" valign="top">
   					${boardView.contents}
   				</td>
   			</tr>
   		</table>
   			
		<table class='w3-table w3-border w3-bordered' border="1" id="reply_area">
		<tbody>
   			<c:forEach var="replyList" items="${replyList}" varStatus="status">
				<tr reply_type="<c:if test="${replyList.commentDepth == '0'}">main</c:if><c:if test="${replyList.commentDepth== '1'}">sub</c:if>"><!-- 댓글의 depth 표시 -->
		    		<td width="870px">
		    			<c:if test="${replyList.commentDepth == '1'}"> → </c:if>${replyList.commentContents}
		    		</td>
		    		<td width="100px">
		    			${replyList.commentId}
		    		</td>
		    		<td width="100px">
		    			<input type="password" id="reply_password_${replyList.commentNum}" style="width:100px;" maxlength="10" placeholder="패스워드"/>
		    		</td>
		    		<td>
		    			<button name="reply_del" reply_id = "${replyList.commentNum}" onclick="reply_del(this)">삭제</button>
		    			<c:if test="${replyList.commentDepth != '1'}">
		    				<button name="reply_reply" reply_id = "${replyList.commentNum}">댓글</button><!-- 첫 댓글에만 댓글이 추가 대댓글 불가 -->
		    			</c:if>
		    		</td>
		    	</tr>
		    </c:forEach>
		    </tbody>
   		</table>
		
		<table class='w3-table-all'>
			<tr>
				<td width="500px">
		이름: <input type="text" id="commentId" name="commentId" style="width:170px;" maxlength="10" placeholder="작성자"/>
		패스워드: <input type="password" id="commentPwd" name="commentPwd" style="width:170px;" maxlength="10" placeholder="패스워드"/>
		<button id="reply_save" name="reply_save">댓글 등록</button>
				</td>
			</tr>
			<tr>
				<td>
					<textarea id="commentContents" name="commentContents" rows="4" cols="50" placeholder="댓글을 입력하세요."></textarea>
				</td>
			</tr>
		</table>
    </div>
<script src="/resources/js/view.js"></script>    	
</layout:main_layout>