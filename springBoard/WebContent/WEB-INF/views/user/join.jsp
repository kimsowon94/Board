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
		$j("#userIdConfirm").on("click", function() {
			
			var userId = $j("#userId").val();
			if(userId == "")
			{
				alert("아이디를 입력해주세요");
			}
			
			else
			{
				$j.ajax({
					async : true,
					type : "POST",
					url : "/user/checkUserId.do",
					data : {userId : userId},
					success : function(data) 
					{	
						if(data>0) 
						{
							alert("이미 사용중인 아이디입니다.");
							$j("#userId").val("");
							$j(".idConfirm").attr("id","no");
							$j("#userId").focus();

						} 
						else 
						{
							alert("사용가능한 아이디 입니다.");
							$j(".idConfirm").attr("id","yes");
							$j("#userPw").focus();
						}

						
					}
				})
			}
			

		});

	});

	$j(document).ready(function() {
		
		$j("#userAddr2").bind("keyup", function() {

			if($j("#userAddr2").val().length > 50)
			{
				alert("입력갯수 초과");
				$j(this).val($j(this).val().substr(0, 50));
			}

		});
		
		$j("#userCompany").bind("keyup", function() {
			
			if($j("#userCompany").val().length > 20)
			{
				alert("입력갯수 초과");
				$j(this).val($j(this).val().substr(0, 20));
			}

		});

		/* 비밀번호 일치 여부 알려주는 div 숨김 */
		$j("#alert-success").hide();
		$j("#alert-danger").hide();

		$j("input").keyup(function() {
			/* 패스워드 일치여부 */
			var pwd1 = $j("#userPw").val();
			var pwd2 = $j("#userPw2").val();
			
			/*전체 공백*/
			re3 = / /g;
			
			/* 한글입력 x */
			re2 = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '';
			
			/* 비밀번호 입력 시 공백 제거 */
			if (re3.test(pwd1)) {
				
				$j("#userPw").val(pwd1.replace(re3, ""));
				
			}
			if (re3.test(pwd2)) {
			
				$j("#userPw2").val(pwd2.replace(re3, ""));
			}
			
			/* 한글 입력시 제거  */
			if (re2.test(pwd1)) {
				//한글  포함되면 삭제하여 값으로 다시셋팅
				$j("#userPw").val(pwd1.replace(re2, ""));
			}
			if (re2.test(pwd2)) {
				//한글  포함되면 삭제하여 값으로 다시셋팅
				$j("#userPw2").val(pwd2.replace(re2, ""));
			}
			
			/* 길이제한 */
			if(pwd1.length > 16) 
			{
				alert("16자로 이내로 제한됩니다.");

				$j(this).val($j(this).val().substr(0, 16));

			}
			
			/* 길이제한 */
			if(pwd2.length > 16) 
			{
				alert("16자로 이내로 제한됩니다.");

				$j(this).val($j(this).val().substr(0, 16));

			}

			if (pwd1 != "" || pwd2 != "") {
				
				if (pwd1 == pwd2) {
					$j("#alert-success").show();
					$j("#alert-danger").hide();
					$j("#submit").removeAttr("disabled");
				} else {
					$j("#alert-success").hide();
					$j("#alert-danger").show();
					$j("#submit").attr("disabled", "disabled");
				}
			
			}
			
			

			/* 아이디 특수문자, 한글 입력 x */
			$j("#userId").bind("keyup", function() {

				/*특수문자 정규식*/
				re1 = /[~!@\#$%^&*\()\-=+_']/gi;

				/*한글 정규식 */
				re2 = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '';
				
				/*전체 공백*/
				re3 = / /g;

				var temp = $j("#userId").val();

				if (re1.test(temp)) {
					//특수문자가 포함되면 삭제하여 값으로 다시셋팅
					$j("#userId").val(temp.replace(re1, ""));
				}

				if (re2.test(temp)) {
					//한글  포함되면 삭제하여 값으로 다시셋팅
					$j("#userId").val(temp.replace(re2, ""));
				}
				
				if (re3.test(temp)) {
					//공백 포함되면 삭제하여 값으로 다시셋팅
					$j("#userId").val(temp.replace(re3, ""));
				}
				
				/* 길이제한 */
				if($j("#userId").val().length > 15) 
				{
					alert("15자로 이내로 제한됩니다.");
					$j(this).val($j(this).val().substr(0, 15));

				}
			});
			

			/* 이름에 영문, 숫자, 특수문자 입력 x */
			$j("#userName").bind("keyup", function() {

				/* 특수문자 정규식 */
				re1 = /[~!@\#$%^&*\()\-=+_']/gi;

				/* 영어 + 숫자 정규식 */
				re2 = /^[a-zA-Z0-9]*$/;
				
				/*전체 공백*/
				re3 = / /g;
	

				var temp = $j("#userName").val();

				if (re1.test(temp)) {
					//특수문자가 포함되면 삭제하여 값으로 다시셋팅
					$j("#userName").val(temp.replace(re1, ""));
				}

				if (re2.test(temp)) {
					//숫자가 포함되면 삭제하여 값으로 다시셋팅
					$j("#userName").val(temp.replace(re2, ""));
				}
				
				if (re3.test(temp)) {
					//공백이 포함되면 삭제하여 값으로 다시셋팅
					$j("#userName").val(temp.replace(re3, ""));
				}
				
				
				/* 길이제한 */
				if($j("#userName").val().length > 7) 
				{
					alert("7자로 이내로 제한됩니다.");
					$j(this).val($j(this).val().substr(0, 7));
				}
				
				
				
				
			})
			
			
			

			$j("#userPhone2").bind("keyup", function() {
				var regNumber = /^[0-9]*$/;
				var temp = $j("#userPhone2").val();
				
				/*전체 공백*/
				re3 = / /g;
				
				if (!regNumber.test(temp)) {
					$j("#userPhone2").val(temp.replace(/[^0-9]/g, ""));
				}
				
				if (re3.test(temp)) {
					//특수문자가 포함되면 삭제하여 값으로 다시셋팅
					$j("#userPhone2").val(temp.replace(/ /g, ""));
				}
				
				if($j("#userPhone2").val().length > 4) 
				{
					alert("4자로 이내로 제한됩니다.");
					$j(this).val($j(this).val().substr(0, 4));
				}
				
			})
			

			$j("#userPhone3").bind("keyup", function() {
				var regNumber = /^[0-9]*$/;
				var temp = $j("#userPhone3").val();

				/*전체 공백*/
				re3 = / /g;
				
				if (!regNumber.test(temp)) {
					$j("#userPhone3").val(temp.replace(/[^0-9]/g, ""));
				}
				if (re3.test(temp)) {
					//특수문자가 포함되면 삭제하여 값으로 다시셋팅
					$j("#userPhone3").val(temp.replace(/ /g, ""));
				}
				
				/* 길이제한 */
				if($j("#userPhone3").val().length > 4) 
				{
					alert("4자로 이내로 제한됩니다.");
					$j(this).val($j(this).val().substr(0, 4));
				}
			})

			$j("#userAddr1").on("keyup", function() {
				var regNumber = /^[0-9]*$/;
				var temp = $j("#userAddr1").val();
				console.log($j(this).val().length);
				
				
				/*전체 공백*/
				re3 = / /g;

				if (!regNumber.test(temp)) {
					$j("#userAddr1").val(temp.replace(/[^0-9]/g, ""));
				}
				if (re3.test(temp)) {
					//특수문자가 포함되면 삭제하여 값으로 다시셋팅
					$j("#userAddr1").val(temp.replace(/ /g, ""));
				}
				
				/* 길이제한 */
				if($j("#userAddr1").val().length >= 7) 
				{
					$j(this).val($j(this).val().substr(0, 6));					
				}

				if($j(this).val().length == 6){
					console.log("하이픈추가")
					var pre = $j("#userAddr1").val().substring(0,3);
					var su = $j("#userAddr1").val().substring(3,6);
					$j(this).val(pre+"-"+su);
				}

			})
		});

		/*회원가입 insert */
		$j("#submit").on("click", function() {
			
			var confirm = $j(".idConfirm").attr("id");
			
			if($j("#userId").val() == "")
			{
				alert("아이디를 입력해주세요.");
				$j("#userId").focus();	
				return false;
			}
			if($j("#userPw").val() == "" || $j("#userPw2").val()=="")
			{
				alert("비밀번호를 확인해주세요.");
				$j("#userPw").focus();
				return false;
			}
			
			if($j("#userName").val() == "")
			{
				alert("이름 입력해주세요.");
				$j("#userName").focus();
				return false;
			}
			
			if($j("#userPhone2").val()=="" || $j("#userPhone2").val().length != 4)
			{
				alert("핸드폰번호를 확인해주세요.");	
				$j("#userPhone2").focus();
				return false;
			}
			
			if($j("#userPhone3").val()=="" || $j("#userPhone3").val().length != 4)
			{
				alert("핸드폰번호를 확인해주세요.");	
				$j("#userPhone3").focus();
				return false;
			}
			/* if($j("#userAddr2").val() == "")
			{
				alert("주소를 입력해주세요.");
				$j("#userAddr2").focus();
				return false;
			} */
			

		
			if(confirm == "no" || confirm == "yet")
			{
				alert("아이디 중복확인이 필요합니다.");
				return false;
			}

			if(confirm == "yes")
			{		
				/* var param = $frm.serialize(); */

				$j.ajax({
					url : "/user/joinInsert.do",
					dataType : "json",
					type : "POST",
					data : {
						"userId" : $j("#userId").val(),
						"userPw" : $j("#userPw").val(),
						/* "userPw2" : $j("#userPw2").val(), */
						"userName" : $j("#userName").val(),
						"userPhone1" : $j("#userPhone1").val(),
						"userPhone2" : $j("#userPhone2").val(),
						"userPhone3" : $j("#userPhone3").val(),
						"userAddr1" : $j("#userAddr1").val(),
						"userAddr2" : $j("#userAddr2").val(),
						"userCompany" : $j("#userCompany").val(),

					},
					success : function(data, textStatus, jqXHR) {
						if (data > 0)
							alert("회원가입 완료");

						location.href = "/board/boardList.do";
					},
					error : function(jqXHR, textStatus, errorThrown) 
					{	
						
						alert("누락된 부분이 없이 작성하세요.");
					}
				});
			}
			



			
		});
	});
</script>	

</head>

<body>
	<form class="join">
	
	<!-- 아이디 중복 체크 여부 -->
	<input type="hidden" class="idConfirm"id="yet" name="idConfirm">

		<table align="center">
			<tr>
				<td align="right"><input id="submit" type="button" value="join">

				</td>
			</tr>
			<tr>
				<td>
					<table border="1">
						<tr>
							<td width="120" align="center">ID</td>

							<td width="400"><input name="userId" id="userId" type="text"
								size="20" maxlength="15">
								<button type="button" id="userIdConfirm">중복확인</button></td>
						</tr>
						
						<tr>
							<td width="120" align="center">PW</td>

							<td width="400"><input name="userPw" id="userPw" type="password"
								size="20" maxlength="16"></td>

						</tr>

						<tr>
							<td width="120" align="center">PW check</td>

							<td width="400"><input name="userPw2" id="userPw2"
								type="password" size="20">
								<div class="alert alert-success" id="alert-success">비밀번호
									일치</div>
								<div class="alert alert-danger" id="alert-danger">비밀번호 불일치</div>
							</td>

						</tr>
						<tr>
							<td width="120" align="center">NAME</td>
							<td width="400"><input name="userName" id="userName"
								type="text" size="20"></td>
						</tr>
						<tr>
							<td width="120" align="center">PHONE</td>
							<td width="400"><select name="userPhone1" id="userPhone1">
									<c:forEach items="${codeMenuList }" var="list">
										<option value="${list.codeId }">${list.codeName }</option>
									</c:forEach>
							</select> - <input name="userPhone2" id="userPhone2" type="text" size="7">
								- <input name="userPhone3" id="userPhone3" type="text" size="7">
							</td>
						</tr>

						<tr>
							<td width="120" align="center">POSTNO</td>
							<td width="400"><input name="userAddr1" id="userAddr1"
								type="text" size="20"></td>
						</tr>

						<tr>
							<td width="120" align="center">ADRESS</td>
							<td width="400"><input name="userAddr2" id="userAddr2"
								type="text" size="20"></td>
						</tr>

						<tr>
							<td width="120" align="center">COMPANY</td>
							<td width="400"><input name="userCompany" id="userCompany"
								type="text" size="20"></td>
						</tr>


					</table>
				</td>
			</tr>
			<tr>
				<td align="right"><a href="/board/boardList.do">List</a></td>

			</tr>
		</table>


	</form>
</body>
</html>