<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>list</title>
</head>
<script type="text/javascript">

	$j(document).ready(function()
	{	
		var totLength = $j('input[class="typeCk"]').length;
		var chkLength = $j('input[class="typeCk"]:checked').length;
		

		$j("#allCheck").click(function() 
		{
			if($j("#allCheck").prop("checked"))
			{
				$j(".typeCk").prop("checked", true);
			}
			else
			{
				$j(".typeCk").prop('checked',false);
			}

		});
		
		 
		$j(".typeCk").click(function() 
		{
			if(totLength > 0 && totLength == chkLength)
			{
				$j("#allCheck").prop("checked", true);
			}
			else
			{
				$j("#allCheck").prop("checked", false);
			}
			
		})
		/*
		$j("input[name='codeId']:checked").each(function() 
		{
  			var test = $j(this).val(); 

  			alert("벨류값확인 : " + test);


		})
		*/
		
		$j("#btnSearch").click(function()
		{

			$j('#selectType').submit();
		
		});
	
		
		
	});

</script>
<body>
<table  align="center">
	<tr>
		<td align="left">
			<c:if test="${empty sessionId }">
			<a href ="/user/join.do">JOIN</a>		
			<a href ="/user/login.do">LOGIN</a>
			</c:if>
			<c:if test="${!empty sessionId }">
			<a>${userName}님 환영~!</a>
			</c:if>
		</td>

		<td align="right">
			total : ${totalCnt}
		</td>
	</tr>
	<tr>
		<td>
			<table id="boardTable" border = "1">
				<tr>
					<td width="80" align="center">
						Type
					</td>
					<td width="40" align="center">
						No
					</td>
					<td width="300" align="center">
						Title
					</td>
					<td width="70" align="center">
						Count
					</td>
				</tr>
				<c:forEach items="${boardList}" var="list">
					<tr>
						<td align="center">
							${list.codeName}
						</td>
						<td align="center">
							${list.boardNum}
						</td>
						<td>
							<a href = "/board/${list.boardType}/${list.boardNum}/boardView.do?pageNo1=${pageNo1}">${list.boardTitle}</a>
						</td>
						<td align="center">
							${list.readCount }
						</td>
					</tr>	
				</c:forEach>
			</table>
		</td>
	</tr>
	<tr>
		
		<td align="right">
			<c:if test="${!empty sessionId }">
			<a href ="/board/boardWrite.do">글쓰기</a>
			<a href ="/board/logout.do">로그아웃</a>
			</c:if>
		</td>
	</tr> 	
</table>
	<form id="selectType" class="selectType" method="get" action="/board/boardList.do" style="text-align: center;">	
		<input type="checkbox" id="allCheck" value="all">전체
		<c:forEach items="${codeList}" var="a">
		<input type="checkbox" class="typeCk" name="codeId" value="${a.codeId }">${a.codeName }
		</c:forEach>
		<button type="button" id="btnSearch">조회</button>
	</form>
	
	<div class="paginate" style="text-align: center;">
    <a href="/board/boardList.do?pageNo1=${paging.firstPageNo}" class="first">처음</a>
    <a href="/board/boardList.do?pageNo1=${paging.prevPageNo}" class="prev">이전</a></a>
    <span>
        <c:forEach var="i" begin="${paging.startPageNo}" end="${paging.endPageNo}" step="1">
            <c:choose>
                <c:when test="${i eq paging.pageNo1}"><a href="/board/boardList.do?pageNo1=${i}" class="choice">${i}</a></c:when>
                <c:otherwise><a href="/board/boardList.do?pageNo1=${i}">${i}</a></c:otherwise>
            </c:choose>
        </c:forEach>
    </span>
    <a href="/board/boardList.do?pageNo1=${paging.nextPageNo}" class="next">다음</a>
    <a href="/board/boardList.do?pageNo1=${paging.finalPageNo}" class="last">마지막</a>
</div>

	
</body>
</html>