<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/SE2/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	var oEditors = [];
	$(function() {

		setCount(${dto.files.size()+0});
		
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "contents",
			// SmartEditor2Skin.html 파일이 존재하는 경로
			sSkinURI : "/s6/resources/SE2/SmartEditor2Skin.html",
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

		// 저장버튼 클릭시 form 전송
		$("#save").click(function() {
			oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
			$("#frm").submit();
		});
	});
</script>
</head>
<body>
	<h1>${board}Update</h1>

	<form id="frm" action="./${board}Update" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="num" value="${dto.num}"> <input
			type="text" name="title" value="${dto.title}"> <input
			type="text" name="writer" value="${dto.writer}">
		<textarea id="contents" name="contents" rows="20" cols="100">${dto.contents}</textarea>
		<div id="addFile"></div>
		<div>
			<c:forEach items="${dto.files}" var="file" varStatus="i">
				<c:if test="${file.fnum ne 0}">
					<div id="f${i.index}">
						<span> ${file.oname} </span> <span title="f${i.index}"
							class="files" id="${file.fnum}">X</span>
					</div>
				</c:if>
			</c:forEach>
		</div>
		<input id="btn" type="button" value="ADD">
		<button type="button" id="save">Update</button>
	</form>
	<script type="text/javascript" src="../resources/js/fileAdd.js"></script>
</body>
</html>