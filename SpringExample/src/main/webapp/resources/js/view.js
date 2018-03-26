$("#list").click(function(){
	location.href = "list";
});

//댓글 저장
$("#reply_save").click(function(){
	
	//널 검사
    if($("#commentId").val().trim() == ""){
    	alert("이름을 입력하세요.");
    	$("#commentId").focus();
    	return false;
    }
	
    if($("#commentPwd").val().trim() == ""){
    	alert("패스워드를 입력하세요.");
    	$("#commentPwd").focus();
    	return false;
    }
    
    if($("#commentContents").val().trim() == ""){
    	alert("내용을 입력하세요.");
    	$("#commentContents").focus();
    	return false;
    }
    
    var commentContents = $("#commentContents").val().replace("\n", "<br>"); //개행처리
	
	//값 셋팅
	var objParams = {
			commentBrdNum		: $("#idx").val(),	
			commentDepth		: "0",
			commentOrder        : "1",
			commentId			: $("#commentId").val(),
			commentPwd			: $("#commentPwd").val(),
			commentContents		: commentContents
	};
	
	var reply_id=0;
	console.log('1:'+reply_id);
	
	//ajax 호출
	$.ajax({
		url			:	"reply/save",
		dataType	:	"json",
		contentType :	"application/x-www-form-urlencoded; charset=UTF-8",
		type 		:	"post",
		async		: 	false, //동기: false, 비동기: ture
		data		:	objParams,
		success 	:	function(retVal){

			if(retVal.code != "OK") {
				alert(retVal.message);
			}else{
				reply_id = retVal.commentNum;
				console.log('2:'+reply_id);
// 								window.location.reload();
			}
			
		},
		error		:	function(request, status, error){
			console.log("AJAX_ERROR");
		}
	});
	
	var reply_area = $("#reply_area");
	console.log('3:'+reply_id);
	
	var reply = 
		'<tr reply_type="main">'+
		'	<td width="870px">'+
		commentContents+
		'	</td>'+
		'	<td width="100px">'+
		$("#commentId").val()+
		'	</td>'+
		'	<td width="100px">'+
		'		<input type="password" id="reply_password_'+reply_id+'" style="width:100px;" maxlength="10" placeholder="패스워드"/>'+
		'	</td>'+
		'	<td>'+
		'		<button name="reply_del" reply_id = "'+reply_id+'" onclick="reply_del(this)">삭제</button>		'+
		'		<button name="reply_reply" reply_id = "'+reply_id+'">댓글</button>'+
		'	</td>'+
		'</tr>';
		
	 if($('#reply_area')[0].childNodes[1].innerText==''){
         $('#reply_area').append(reply);
     }else{
         $('#reply_area tr:first').before(reply);
     }

	//댓글 초기화
	$("#commentId").val("");
	$("#commentPwd").val("");
	$("#commentContents").val("");
	
});

//댓글 삭제

/*             	$('button[name="reply_del"]').click(function(){
            		alert('댓글 삭제');
            		var check = false;
            		var reply_id = $(this).attr("reply_id");
            		var reply_password = "reply_password_"+reply_id;
            		
            		if($("#"+reply_password).val().trim() == ""){
                    	alert("패스워드을 입력하세요.");
                    	$("#"+reply_password).focus();
                    	return false;
                    }
            		
            		//패스워드와 아이디를 넘겨 삭제를 한다.
            		//값 셋팅
            		var objParams = {
            				commentPwd	: $("#"+reply_password).val(),
            				commentNum		: reply_id
    				};
            		
            		//ajax 호출
            		$.ajax({
            			url			:	"reply/del",
            			dataType	:	"json",
            			contentType :	"application/x-www-form-urlencoded; charset=UTF-8",
            			type 		:	"post",
            			async		: 	false, //동기: false, 비동기: ture
            			data		:	objParams,
            			success 	:	function(retVal){

            				if(retVal.code != "OK") {
            					alert(retVal.message);
            				}else{
            					
            					check = true;
            					            					
            				}
            				
            			},
            			error		:	function(request, status, error){
            				console.log("AJAX_ERROR");
            			}
            		});
            		
            		if(check){
            			//삭제하면서 하위 댓글도 삭제
    					var prevTr = $(this).parent().parent().next(); //댓글의 다음
                		
                		while(prevTr.attr("reply_type")=="sub"){//댓글의 다음이 sub면 계속 넘어감
                            prevTr = prevTr.next();
                            prevTr.prev().remove();
                        }
                		
                		//마지막 리플 처리
                		if(prevTr.attr("reply_type") == undefined){
                			prevTr = $(this).parent().parent();
                			prevTr.remove();
                		}
                		
                		$(this).parent().parent().remove();	
            		}
            		
            	}); */

//대댓글 입력창
$(document).on("click","button[name='reply_reply']",function(){ //동적 이벤트
	
	$("#reply_add").remove();
	
	var reply_id = $(this).attr("reply_id");
	console.log(reply_id);
	var last_check = false;//마지막 tr 체크
	
	//입력받는 창 등록
	 var replyEditor = 
		'<tr id="reply_add" class="reply_reply">'+
		'	<td width="870px">'+
		'		<textarea name="reply_reply_content" rows="3" cols="50"></textarea>'+
		'	</td>'+
		'	<td width="100px">'+
		'		<input type="text" name="reply_reply_writer" style="width:100%;" maxlength="10" placeholder="작성자"/>'+
		'	</td>'+
		'	<td width="100px">'+
		'		<input type="password" name="reply_reply_password" style="width:100%;" maxlength="10" placeholder="패스워드"/>'+
		'	</td>'+
		'	<td>'+
		'		<button name="reply_reply_save" reply_id="'+reply_id+'">등록</button>'+
		'		<button name="reply_reply_cancel">취소</button>'+
		'	</td>'+
		'</tr>';
		
	var prevTr = $(this).parent().parent().next();
	
	//부모의 부모 다음이 sub이면 마지막 sub 뒤에 붙인다.
	//마지막 리플 처리
	if(prevTr.attr("reply_type") == undefined){
		prevTr = $(this).parent().parent();
	}else{
		while(prevTr.attr("reply_type")=="sub"){//댓글의 다음이 sub면 계속 넘어감
            prevTr = prevTr.next();
        }
		
		if(prevTr.attr("reply_type") == undefined){//next뒤에 tr이 없다면 마지막이라는 표시를 해주자
			last_check = true;
		}else{
			prevTr = prevTr.prev();
		}
		
	}
	
	if(last_check){//마지막이라면 제일 마지막 tr 뒤에 댓글 입력을 붙인다.
		$('#reply_area tr:last').after(replyEditor);	
	}else{
		prevTr.after(replyEditor);
	}
	
});

//대댓글 등록
$(document).on("click","button[name='reply_reply_save']",function(){
	            		
	var reply_reply_writer = $("input[name='reply_reply_writer']");
	var reply_reply_password = $("input[name='reply_reply_password']");
	var reply_reply_content = $("textarea[name='reply_reply_content']");
	var reply_reply_content_val = reply_reply_content.val().replace("\n", "<br>"); //개행처리
	
	//널 검사
    if(reply_reply_writer.val().trim() == ""){
    	alert("이름을 입력하세요.");
    	reply_reply_writer.focus();
    	return false;
    }
	
    if(reply_reply_password.val().trim() == ""){
    	alert("패스워드를 입력하세요.");
    	reply_reply_password.focus();
    	return false;
    }
    
    if(reply_reply_content.val().trim() == ""){
    	alert("내용을 입력하세요.");
    	reply_reply_content.focus();
    	return false;
    }
	
	//값 셋팅
	var objParams = {
			commentBrdNum		: $("#idx").val(),
			commentParent		: $(this).attr("reply_id"),	
			commentDepth			: "1",
			commentOrder			: "2",
			commentId	: reply_reply_writer.val(),
			commentPwd	: reply_reply_password.val(),
			commentContents	: reply_reply_content_val
	};
	
	var reply_id;
	
	//ajax 호출
	$.ajax({
		url			:	"reply/save",
		dataType	:	"json",
		contentType :	"application/x-www-form-urlencoded; charset=UTF-8",
		type 		:	"post",
		async		: 	false, //동기: false, 비동기: ture
		data		:	objParams,
		success 	:	function(retVal){

			if(retVal.code != "OK") {
				alert(retVal.message);
			}else{
				reply_id = retVal.commentNum;
			}
			
		},
		error		:	function(request, status, error){
			console.log("AJAX_ERROR");
		}
	});
	
	var reply = 
		'<tr reply_type="sub">'+
		'	<td width="870px"> → '+
		reply_reply_content_val+
		'	</td>'+
		'	<td width="100px">'+
		reply_reply_writer.val()+
		'	</td>'+
		'	<td width="100px">'+
		'		<input type="password" id="reply_password_'+reply_id+'" style="width:100px;" maxlength="10" placeholder="패스워드"/>'+
		'	</td>'+
		'	<td>'+
		'		<button name="reply_del" reply_id = "'+reply_id+'" onclick="reply_del(this)">삭제</button>'+
		'	</td>'+
		'</tr>';
		
	var prevTr = $(this).parent().parent().prev();
	
	prevTr.after(reply);
	            		
	$("#reply_add").remove();
	
});

//대댓글 입력창 취소
$(document).on("click","button[name='reply_reply_cancel']",function(){
	$("#reply_add").remove();
});

//글수정
$("#modify").click(function(){
	
	var password = $("input[name='pwd']");
	
	if(password.val().trim() == ""){
    	alert("패스워드를 입력하세요.");
    	password.focus();
    	return false;
    }
	            		
	//ajax로 패스워드 검수 후 수정 페이지로 포워딩
	//값 셋팅
	var objParams = {
			idx		 : $("#idx").val(),	
			pwd 	 : $("#pwd").val()
	};
	            		
	//ajax 호출
	$.ajax({
		url			:	"check",
		dataType	:	"json",
		contentType :	"application/x-www-form-urlencoded; charset=UTF-8",
		type 		:	"post",
		async		: 	false, //동기: false, 비동기: ture
		data		:	objParams,
		success 	:	function(retVal){

			if(retVal.code != "OK") {
				alert(retVal.message);
			}else{
				location.href = "edit?idx="+$("#idx").val();
			}
			
		},
		error		:	function(request, status, error){
			console.log("AJAX_ERROR");
		}
	});
	
});

//글 삭제
$("#delete").click(function(){
	
	var password = $("input[name='pwd']");
	
	if(password.val().trim() == ""){
    	alert("패스워드를 입력하세요.");
    	password.focus();
    	return false;
    }
	
	//ajax로 패스워드 검수 후 수정 페이지로 포워딩
	//값 셋팅
	var objParams = {
			idx		 : $("#idx").val(),	
			pwd      : $("#pwd").val()
	};
	            		
	//ajax 호출
	$.ajax({
		url			:	"del",
		dataType	:	"json",
		contentType :	"application/x-www-form-urlencoded; charset=UTF-8",
		type 		:	"post",
		async		: 	false, //동기: false, 비동기: ture
		data		:	objParams,
		success 	:	function(retVal){

			if(retVal.code != "OK") {
				alert(retVal.message);
			}else{
				alert("삭제 되었습니다.");
				location.href = "list";
			}
			
		},
		error		:	function(request, status, error){
			console.log("AJAX_ERROR");
		}
	});
	
});
