<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>boardWrite</title>
</head>
<script type="text/javascript">

	$j(document).ready(function(){
		
		$j("#submit").on("click",function(){
			var $frm = $j('.boardWrite :input');
			var param = $frm.serialize();
			
			$j.ajax({
			    url : "/board/boardWriteAction.do",
			    dataType: "json",
			    type: "POST",
			    data : param
		    	/* {
			    	
			    	 "boardTitle" : $j("#boardTitle").val(),
			    	"boardComment" : $j("#boardComment").val(),
			    	"boardType" : $j("#boardType").val(),
			    	"creator" : $j("#creator").val(),
			    	"userId" : $j("#userId").val(), 
		    	} */,
			    success: function(data, textStatus, jqXHR)
			    {
					alert("작성완료");
					
						
					location.href = "/board/boardList.do?pageNo1=" + data.pageNo1;
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("실패");
			    }
			});
		});
		
		$j("#addBtn").on("click", function() 
		{
			var addCount = $j("#countNum").val();
			var num = parseInt(addCount) + 1;

			var row = "";
			
			$j("#countNum").attr("value",num);
			
			/* console.log(addCount); */
			
			row += "<tr id='addWrite" + num + "'>";
			row += "<td>";
			row += "<table border ='1'>";
			row += "<tr>";
			row += "<td width='120' align='center'> Type </td>";
			row += "<td width='400'>";
			row += "<select name='boardVoList[" + num + "].boardType' id='boardType'>";
			row += "<c:forEach items='${codeList }' var='list'>";
			row += "<option value='${list.codeId }'>${list.codeName }</option>";
			row += "</c:forEach></select></td>"
			row += "<tr>";
			row += "<td width='120' align='center'>Title</td>"
			row += "<td width='400'>"
			row += "<input name='boardVoList[" + num + "].boardTitle' id='boardTitle' type='text' size='50' value='${board.boardTitle}'></td></tr>"
			row += "<tr><td height='300' align='center'>Comment</td>";
			row += "<td valign='top'>";
			row += "<textarea name='boardVoList[" + num + "].boardComment' id='boardComment' rows='20' cols='55'>${board.boardComment}</textarea>";
			row += "</td></tr>";
			row += "<tr><td align='center'>Writer</td>";
			row += "<td><input type='hidden' value='${userId }' id='creator' name='boardVoList[" + num + "].creator'>${userName }</td>";
			row += "</tr>";	
			row += "</table>";
			row += "</tr>";
			row += "</td>";
			row += "<tr>";
			row += "<td align='right'>";
			row += "<input id='delBtn" + num + "' type='button' value='행삭제' onclick='fnDelRow(" + num + ")'></td>";
			row += "</tr>";
			row += "</td>";
			
			
			$j("#addTable").append(row);
			
			
				
		});	

	
	});
	
	function fnDelRow(val){
		//라인 삭제
		$j("#addWrite" + val).remove();
		$j("#delBtn" + val).remove();
	}
</script>
<body>
<form class="boardWrite">
<input type="hidden" name="boardNum" id="boardNum" value="">
<input type="hidden" name="userId" id="userId" value="${userId }">
<input type="hidden" name="countNum" id="countNum" value="0">
<input type="hidden" value="${userId }" id="creator" name="boardVoList[0].creator">

	<table align="center" class="mainTable">
		<tr>
			<td align="right">
			<input id="submit" type="button" value="작성">
			<input id="addBtn" type="button" value="행추가">
			</td>
		</tr>
		<tr>
			<td>
				<table border ="1" class="subTable1" id="subTable1"> 
					<tr>
						<td width="120" align="center">
						Type
						</td>
						
						<td width="400">
						
						
							<select name="boardVoList[0].boardType" id="boardType">
							<c:forEach items="${codeList }" var="list">
								<option value="${list.codeId }">${list.codeName }</option>
							</c:forEach>
							</select>
						
						
						</td>
					
					</tr>
					<tr>
						<td width="120" align="center">
						Title
						</td>
						<td width="400">
						<input name="boardVoList[0].boardTitle" id="boardTitle" type="text" size="50" value="${board.boardTitle}"> 
						</td>
					</tr>
					<tr>
						<td height="300" align="center">
						Comment
						</td>
						<td valign="top">
						<textarea name="boardVoList[0].boardComment" id="boardComment" rows="20" cols="55">${board.boardComment}</textarea>
						</td>
					</tr>
			
					
					<tr>
						<td align="center">
						Writer
						</td>
						<td>
							${userName }
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td align="right">
				<a onclick="history.go(-1)">List</a>
			</td>
			
		</tr>
	</table>
	
	<table align="center" id="addTable">
		
	</table>
	
</form>	
</body>
</html>