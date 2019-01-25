<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
img {
	width: 250px;
	height: 250px;
}

.files, .del {
	color: red;
	cursor: pointer;
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
<script type="text/javascript">
var oEditors = [];
	$(function() {
		nhn.husky.EZCreator
				.createInIFrame({
					oAppRef : oEditors,
					elPlaceHolder : "contents",
					//SmartEditor2Skin.html 파일이 존재하는 경로
					sSkinURI : "${pageContext.request.contextPath}/resources/SE2/SmartEditor2Skin.html",
					htParams : {
						// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
						bUseToolbar : true,
						// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
						bUseVerticalResizer : true,
						// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
						bUseModeChanger : true,
						fOnBeforeUnload : function() {
						}
					}
				});

		//저장버튼 클릭시 form 전송
		$("#save").click(function() {
			oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
			$("#frm").submit();
		});
	});
</script>
<script type="text/javascript">
	$(function() {
		var file = '<div><input type="file" name="f1"><span class="files">X</span></div>';
		var count = 0;
		$("#fileAdd").click(function() {
			if (count < 5) {
				$("#files").append(file);
				count++;
			} else {
				alert("파일은 5개까지만 등록가능합니다");
			}
		})
		
		$("#files").on("click", ".files", function() {
			$(this).parent().remove();
			count--;
		})

	})
</script>
</head>
<body>
	<h1>${board} Reply</h1>

	<form action="./${board}Reply" method="post" id="frm"
		enctype="multipart/form-data">
		<input type="hidden" name="num" value="${num}">
		<input type="text" name="title"> <input type="text"
			name="writer">
		<textarea id="contents" name="contents" rows="20" cols="100"></textarea>
		<div id="files"></div>
		<input id="fileAdd" type="button" value="ADD">
		<button id="save">Reply</button>
	</form>
</body>
</html>