<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<c:import url="${pageContext.request.contextPath}/layout/head" />
</head>
<body>
	<!-- ##### Main Content Wrapper Start ##### -->
	<div class="main-content-wrapper d-flex clearfix">

		<c:import url="${pageContext.request.contextPath}/layout/header" />

		<div class="cart-table-area" id="manager-list">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="cart-title mt-50">
							<h2>${board}글쓰기</h2>
						</div>

						<div class="cart-table clearfix">
							<form action="./${board}Write" method="post" id="frm"
								enctype="multipart/form-data">
								<input type="email" class="form-control mb-15" id="id"
									name="title" placeholder="제목"> <input type="hidden"
									name="writer">
								<textarea id="contents" name="contents"></textarea>
								
								<button class="btn amado-btn mt-15 mb-15">작성</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ##### Main Content Wrapper End ##### -->
	
  <script type="text/javascript">
      	$(function() {

			$('#contents').summernote({
				placeholder : '내용',
				tabsize : 2,
				height : 400,
				minHeight : 200,
				maxHeight : 600
			});
		});
      </script>

	<c:import url="${pageContext.request.contextPath}/layout/footer" />
</body>
</html>
