<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<c:import url="${pageContext.request.contextPath}/layout/head" />
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
								<h2>로그인</h2>
							</div>

							<form class="frm-login" action="./login" method="post">
								<div class="row">
									<div class="col-12 mb-3">
										<input type="text" class="form-control" id="login-id"
											name="id" placeholder="이메일(ID)"
											data-parsley-message="이메일 형태로 입력해주세요."
											data-parsley-pattern="^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$">
										<p class="message"></p>
									</div>
									<div class="col-12 mb-3">
										<input type="password" class="form-control"
											id="login-password" name="password" placeholder="비밀번호"
											data-parsley-message="영문/숫자/특수문자 조합 8~16자 조합으로 입력해주세요."
											data-parsley-pattern="^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{8,16}$">
										<p class="message"></p>
									</div>
								</div>
								<button type="button"
									class="btn amado-btn form-login-btn col-12">로그인</button>
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

</html>