<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>boardView</title>
<script type="text/javascript">

$j(document).ready(function(){
	
	$j("#deleteBtn").on("click",function(e){
		
		var $frm = $j('.boardDelete');
		/* var param = $frm.serialize(); */
		
		e.preventDefault();
		
		var creator = $j("#creator").text();
		var sessionName = $j("#sessionUserName").val().trim();
		
		
		if(creator != sessionName)
		{
			alert("접근 권한이 없습니다.");
		}
		else
		{
			$j.ajax({
			    url : "/board/boardDelete.do",
			    dataType: "json",
			    type: "POST",
			    data : 
		    	{
			    	"boardTitle" : $j("#boardTitle").val(),
			    	"boardComment" : $j("#boardComment").val(),
			    	"boardNum" : $j("#boardNum").val(),
			    	"boardType" : $j("#boardType").val(),
		    	},
			    success: function(data, textStatus, jqXHR)
			    {
					alert("삭제완료");
					
					location.href = "/board/boardList.do";
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("삭제실패");
			    }
			});
		}
		
		
	});
	
	$j("#confrim").click(function() {
		
		var creator = $j("#creator").text();
		var sessionName = $j("#sessionUserName").val().trim();
		
		
		if(creator != sessionName)
		{
			alert("접근 권한이 없습니다.");
		}
		else
		{
			location.href ="/board/boardUpdateForm.do?boardNum=${board.boardNum}&boardType=${board.boardType }";	
		}
	})

});



</script>
</head>
<body>
<form class="boardDelete">
<input type="hidden" id="boardNum" name="boardNum" value="${board.boardNum }">
<input type="hidden" id="boardType" name="boardType" value="${board.boardType }">
	<input type="hidden" id="sessionUserName" name="sessionUserName" value="${userName }">
 <table align="center">
	<tr>
		<td>
			<table border ="1">
				<tr>
					<td width="120" align="center">
					Type
					</td>
					<td width="400">
					${board.codeName}
					</td>
				</tr>
				<tr>
					<td width="120" align="center">
					Title
					</td>
					<td width="400">
					${board.boardTitle}
					</td>
				</tr>
				<tr>
					<td height="300" align="center">
					Comment
					</td>
					<td>
					${board.boardComment}
					</td>
				</tr>
				<tr>
					<td align="center">
					Writer
					</td>
					
					<td>
						<span id="creator">${name }</span>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="right">
			<a href="/board/boardList.do">List</a>
			<a id="confrim">수정</a>
			<a id="deleteBtn">삭제</a>
		</td>

	
	</tr>
</table>
</form>	
</body>
</html>