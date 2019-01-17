<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<c:import url="${pageContext.request.contextPath}/layout/head" />
<script src="${pageContext.request.contextPath}/resources/js/frmCheck.js"></script>
</head>

<body>
	<!-- ##### Main Content Wrapper Start ##### -->
	<div class="main-content-wrapper d-flex clearfix">

			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="checkout_details_area mt-50 clearfix">

							<div class="cart-title">
								<h2>비밀번호 변경</h2>
							</div>

							<form class="frm-login" action="./login" method="post">
								<div class="row">
									<div class="col-12 mb-3">
										<input type="password" class="form-control"
											id="curPassword" name="password" placeholder="현재 비밀번호"
											data-parsley-message="영문/숫자/특수문자 조합 8~16자 조합으로 입력해주세요."
											data-parsley-pattern="^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{8,16}$">
										<p class="message"></p>
									</div>
									<div class="col-12 mb-3">
										<input type="password" class="form-control"
											id="password1" placeholder="변경할 비밀번호"
											data-parsley-message="영문/숫자/특수문자 조합 8~16자 조합으로 입력해주세요."
											data-parsley-pattern="^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{8,16}$">
										<p class="message"></p>
									</div>
									<div class="col-12 mb-3">
										<input type="password" class="form-control"
											id="password2" name="password" placeholder="변경할 비밀번호 확인"
											data-parsley-message="영문/숫자/특수문자 조합 8~16자 조합으로 입력해주세요."
											data-parsley-pattern="^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{8,16}$">
										<p class="message"></p>
									</div>
								</div>
								<div class="login">
									<button type="button" class="btn amado-btn password-btn col-12 mb-15">비밀번호 변경하기</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	<!-- ##### Main Content Wrapper End ##### -->
</body>	
</html>