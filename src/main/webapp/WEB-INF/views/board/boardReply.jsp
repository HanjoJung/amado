<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="${pageContext.request.contextPath}/layout/head" />
</head>
<body id="board" data-board="${board}">
	<!-- ##### Main Content Wrapper Start ##### -->
	<div class="main-content-wrapper d-flex clearfix">

		<c:import url="${pageContext.request.contextPath}/layout/header" />

		<div class="cart-table-area" id="manager-list">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="cart-title mt-50">
							<h2>${board} 답글쓰기</h2>
						</div>
						<div class="cart-table clearfix">
							<form action="./${board}Reply" method="post" id="frm" enctype="multipart/form-data">
								<input type="hidden" id="num" value="${num}">
								<div  class="tool-message">
									<span class="tooltiptext">제목을 입력해주세요.</span>
									<input type="text" class="form-control form-value mb-15" id="title"
										placeholder="제목">
									<textarea id="contents" class="form-control form-value"></textarea>
								</div>
								<input type="hidden" id="writer" value="${member.id}">
								<button type="button" class="btn amado-btn board-btn mb-15 mt-15" data-action="Reply">작성</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ##### Main Content Wrapper End ##### -->
	<c:import url="${pageContext.request.contextPath}/layout/footer" />
</body>

<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<script src="${pageContext.request.contextPath}/resources/summernote/summernote-ko-KR.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/boradFileRollback.js"></script>
</html>


