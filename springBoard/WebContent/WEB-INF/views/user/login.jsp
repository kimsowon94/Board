<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>boardWrite</title>
<script type="text/javascript">

	$j(document).ready(function() {
		$j("#loginConfirm").on("click", function() {
			
			var userId = $j("#userId").val();
			var userPw = $j("#userPw").val();
			
			
			if(userId == "")
			{
				alert("아이디를 입력해주세요");
				$j("#userId").focus();
			}
			else if(userPw == "")
			{
				alert("비밀번호를 입력해주세요");
				$j("#userPW").focus();
			}

			if(userId !="" && userPw != ""){
				$j.ajax({
					async : true,
					url : "/user/loginConfirm.do",
					dataType : "json",
					type : "POST",
					data : {
						"userId" : $j("#userId").val(),
						"userPw" : $j("#userPw").val(),
					},
					success : function(data, textStatus, jqXHR) 
					{
						if(data>0)
						{
							alert("로그인성공");
							location.href= "/board/boardList.do";
						}
						else
						{
							alert("아이디 또는 비밀번호가 맞지 않습니다.");
						}
					}
				})
			}	
			

			
		});
	});
</script>
</head>

<body>
	<form class="loginComfirm">
		<table align="center">
			
			<tr>
				<td>
					<table border="1">
					
						<tr>
							<td width="120" align="center">ID</td>
							<td width="200"><input name="userId" id="userId"
								type="text" size="20"></td>
						</tr>

						<tr>
							<td width="120" align="center">PW</td>
							<td width="200"><input name="userPw" id="userPw"
								type="password" size="20"></td>
						</tr>


					</table>
				</td>
			</tr>
			<tr>
				<td align="right"><input id="loginConfirm" type="button" value="login"></td>

			</tr>
		</table>


	</form>
</body>
</html>