<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<c:import url="${pageContext.request.contextPath}/layout/head" />
<script type="text/javascript">
	$(function() {
		$(".form-btn-delete").click(function() {
			deletePassword = prompt("비밀번호를 입력하세요.");
			if (deletePassword != "" && deletePassword != null) {
				$.ajax({
					url : "./delete",
					type : "POST",
					data : {
						id : "${member.id}",
						password : deletePassword
					},
					success : function(data) {
						data = data.trim();
						alert(data);
						if(data == "탈퇴 되었습니다."){
							location.href = "${pageContext.request.contextPath}/"
						}
					}
				})
			}
		})
	})
</script>
</head>

<body>

	<!-- ##### Main Content Wrapper Start ##### -->
	<div class="main-content-wrapper d-flex clearfix">

		<c:import url="${pageContext.request.contextPath}/layout/header" />

		<div class="cart-table-area section-padding-100">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="checkout_details_area mt-50 clearfix">

							<div class="cart-title">
								<h2>내 정보</h2>
							</div>

							<form class="frm" action="./update" method="post">
								<div class="row">
									<div class="col-12 mb-3">
										<input type="email" class="form-control" name="id"
											placeholder="이메일(ID)" data-parsley-message="이메일 형태로 입력해주세요."
											data-parsley-pattern="^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$"
											value="${member.id}" readonly="readonly">
										<p class="message"></p>
									</div>
									<div class="col-12 mb-3">
										<input type="text" class="form-control" name="name"
											placeholder="이름" data-parsley-pattern="^[가-힣|a-z|A-Z].{1,}$"
											data-parsley-message="한글과 영문만 입력 가능합니다."
											value="${member.name}">
										<p class="message"></p>
									</div>
									<div class="col-12 mb-3">
										<input type="text" class="form-control" name="phone"
											placeholder="전화번호 ( - 없이)" draggable="false"
											data-parsley-pattern="^(01[0|1|6|7|8|9])?([0-9]{3,4})?([0-9]{4})$"
											data-parsley-message="-없이 번호로만 전부 입력해주세요."
											value="${member.phone}">
										<p class="message"></p>
									</div>
									<div class="col-12 mb-15">
										<input type="text" class="form-control" name="address"
											placeholder="주소" data-parsley-pattern="^[]*.{10,}$"
											data-parsley-message="너무 짧습니다." value="${member.address}">
										<p class="message"></p>
									</div>
								</div>
							</form>
							<form action="./delete" method="post" id="frm-delete">
								<input type="hidden" name="id" value="${member.id}"> 
								<input type="hidden" name="password">
							</form>
							<div style="text-align: right;">
								<a href="./" class="btn amado-btn mb-3">비밀번호 변경</a>
								<button type="button" class="btn amado-btn mb-3 form-btn">정보수정</button>
								<button type="button" class="btn amado-btn mb-3 form-btn-delete">회원탈퇴</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ##### Main Content Wrapper End ##### -->

	<c:import url="${pageContext.request.contextPath}/layout/footer" />
</body>

</html>