<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
    <head>
        <title>게시판</title>

        <!-- include libraries(jQuery, bootstrap) -->
		<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
		<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
		
		<!-- include summernote css/js -->
		<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
		<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
            	
            	 $('#summernote').summernote({

            		  height : 300, // 에디터의 높이 
            		  minHeight : null,
            		  maxHeight : null,
            		  focus : true,
            		  lang : 'ko-KR' // 기본 메뉴언어 US->KR로 변경
            	 });
            	
            	$('#list').click(function(){
            		location.href='list';
            	});
            	
				$("#save").click(function(){
            		
            		//널 검사
                    if($("#title").val().trim() == ""){
                    	alert("제목을 입력하세요.");
                    	$("#title").focus();
                    	return false;
                    }
            		
                    if($("#name").val().trim() == ""){
                    	alert("작성자를 입력하세요.");
                    	$("#name").focus();
                    	return false;
                    }
                    
                    if($("#pwd").val().trim() == ""){
                    	alert("비밀번호를 입력하세요.");
                    	$("#pwd").focus();
                    	return false;
                    }
                    
                    $('boardEdit').onsumbit();
                    
				});
            	
            });
        </script>
    </head>
    <body>
    	<form action='<c:out value="save"/>' id="boardEdit" name="boardEdit" method="post"  style="position:relative; top: 10%;">
    	<input type="hidden" id="idx" name="idx" value="${boardView.idx}" />
    	<div align="center">
   			<table style="width:1200px;">
   				<tr>
   					<td>
   						제목: <input type="text" id="title" name="title" style="width:600px;" placeholder="제목" value="${boardView.title}"/>
   						작성자: <input type="text" id="name" name="name" style="width:170px;" maxlength="10" placeholder="작성자" value="${boardView.name}"/>
   						비밀번호: <input type="password" id="pwd" name="pwd" style="width:170px;" maxlength="10" placeholder="패스워드"/>
   						<button id="save" name="save">저장</button>   						
   					</td>
   				</tr>
   				<tr>
   					<td style="padding-top: 20px;">
   						<textarea name="contents" id="summernote" rows="10" cols="80">${boardView.contents}</textarea>
   					</td>
   				</tr>
   				<tr>
   					<td align="right">
   						<button id="list" name="list">게시판</button>
   					</td>
   				</tr>
   			</table>
    	</div>
    	</form>
    </body>
</html>