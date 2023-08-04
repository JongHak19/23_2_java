<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>

<link rel="stylesheet" type="text/css" href="css/style.css"/>
<link rel="stylesheet" type="text/css" href="css/created.css"/>

<script type="text/javascript">
	function sendIt(){
		var f = document.myForm;
		
		str=f.subject.value;
		str=str.trim();
		if(!str){
			alert("\n제목을 입력하세요.");
			f.subject.focus();
			return;
		}
	
	
		f.subject.value=str;
		
		str=f.content.value;
		str=str.trim();
		if(!str){
			alert("\n내용을 입력하세요.");
			f.content.focus();
			return;
		}
	
		f.content.value = str;
		
		f.action="create_ok.jsp";
		f.submit();
	}
</script>

	
</head>
<body>

	<div id="bbs">
		<div id="bbs_title">
			게시판
		</div>
	
		<form action="" method="post" name="myForm">
			<div id="bbsCreated">
				<div class="bbsCreated_bottomLine">
					<dl>
						<dt>제&nbsp;&nbsp;&nbsp;&nbsp;목</dt>
						<dd>
							<input type="text" name="subject" size="60"
							maxlength="100" class="boxTF"/>
						</dd>
					</dl>
				</div>						
				
				<div id="bbsCreated_content">
					<dl>
						<dt>내&nbsp;&nbsp;&nbsp;&nbsp;용</dt>
						<dd>
							<textarea rows="12" cols="58" name="content"
							class="boxTA"></textarea>
						</dd>
					</dl>
				</div>
			</div>
			
			<div id="bbsCreated_footer">
				<input type="button" value="등록하기" class="btn2" onclick="sendIt();"/>
				<input type="reset" value="다시입력" class="btn2"
				onclick="document.myForm.subject.focus();"/>
				<input type="button" value="작성취소" class="btn2"
				onclick="javascript:location.href='/';"/>
			</div>
		</form>
	</div>
</body>
</html>