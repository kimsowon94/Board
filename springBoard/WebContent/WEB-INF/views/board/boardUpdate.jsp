<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>boardWrite</title>
<script type="text/javascript">

	$j(document).ready(function(){
		
		$j("#submit").on("click",function(){
			var $frm = $j('.boardUpdate :input');
			var param = $frm.serialize();
			
			$j.ajax({
			    url : "/board/boardUpdate.do",
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
					alert("수정완료");
					
					alert("메세지:"+data.success);
					
					location.href = "/board/boardList.do";
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("실패");
			    }
			});
		});
		
	
	});
	

</script>
</head>

<body>
<form class="boardUpdate">
	<table align="center">
		<tr>
			<td align="right">
			<input id="submit" type="button" value="update">
			<input type="hidden" id="boardNum" name="boardNum" value="${data.boardNum }">
			<input type="hidden" id="boardType" name="boardType" value="${data.boardType }">
		
			</td>
		</tr>
		<tr>
			<td>
				<table border ="1"> 
					<tr>
						<td width="120" align="center">
						Type
						</td>
						<td width="400">
							<select name="boardType" id="boardType">
							<c:forEach items="${codeList }" var="list">
								<option value="${list.codeId }">${list.codeName }</option>
							</c:forEach>
							</select>
					</tr>
					<tr>
						<td width="120" align="center">
						Title
						</td>
						<td width="400">
						<input name="boardTitle" id="boardTitle" type="text" size="50" value="${data.boardTitle}"> 
						</td>
					</tr>
					<tr>
						<td height="300" align="center">
						Comment
						</td>
						<td valign="top">
						<textarea name="boardComment" id="boardComment" rows="20" cols="55">${data.boardComment}</textarea>
						</td>
					</tr>
			
					<tr>
						<td align="center">
						Writer
						</td>
						<td>
							<input type="text" readonly="readonly" value="${userName }" id="creator" name="creator">
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td align="right">
				<a href="/board/boardList.do">List</a>
			</td>
			
		</tr>
	</table>
</form>	
</body>
</html>