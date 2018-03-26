function w3_open() {
    document.getElementById("mySidebar").style.display = "block";
    document.getElementById("myOverlay").style.display = "block";
}
 
function w3_close() {
    document.getElementById("mySidebar").style.display = "none";
    document.getElementById("myOverlay").style.display = "none";
}
function ajax_board(index) {
	    	location.href='/board/list?title='+index;
	}
function myFunction() {
    var x = document.getElementById("mobilebar");
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
    } else { 
        x.className = x.className.replace(" w3-show", "");
    }
}

function brdTypeView(index){
	switch (index) {
	case 'java':
        console.log('j');
        ajax_board(index);
        break;
    case 'network':
    	console.log('n');
    	ajax_board(index);
        break;
    case 'database':
    	console.log('d');
    	ajax_board(index);
        break;
    case 'spring':
    	console.log('s');
    	ajax_board(index);
        break;
    case 'mydiary':
    	console.log('m');
    	ajax_board(index);
        break;
	}	
}
function list(page){
	
	location.href="list?curPage="+page;
	
}

function detailView(idx){
	location.href="view?idx="+idx;
}

$('#write').click(function(){

	location.href="edit";

});

function reply_del(a){
	var check = false;
	var reply_id = a.getAttribute("reply_id");
	var reply_password = "reply_password_"+reply_id;
	console.log(reply_password);
	
	if($("#"+reply_password).val().trim() == ""){
    	alert("패스워드을 입력하세요.");
    	$("#"+reply_password).focus();
    	return false;
    }
	
	//패스워드와 아이디를 넘겨 삭제를 한다.
	//값 셋팅
	var objParams = {
			commentPwd	: $("#"+reply_password).val(),
			commentNum	: reply_id,
			reply_type  :  $(a).parent().parent().attr('reply_type')
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
			var prevTr = $(a).parent().parent().next(); //댓글의 다음
		
		while(prevTr.attr("reply_type")=="sub"){//댓글의 다음이 sub면 계속 넘어감
			prevTr.remove();
			prevTr= $(a).parent().parent().next(); 
        }
		
		$(a).parent().parent().remove();
	}
	
}

