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
								<h2>
									<c:choose>
										<c:when test="${param.action eq 'password'}">
											비밀번호 변경하기
										</c:when>
										<c:when test="${param.action eq 'update'}">
											회원정보수정
										</c:when>
										<c:otherwise>
											회원탈퇴
										</c:otherwise>
									</c:choose>
								</h2>
							</div>

                        <form class="frm" action="#" method="post">
						<input type="hidden" id="rsaPublicKeyModulus" value="${publicKeyModulus}">
						<input type="hidden" id="rsaPublicKeyExponent" value="${publicKeyExponent}">
						<input type="hidden" id="securedPassword">
						<input type="hidden" id="action" value="${param.action}">
							<div class="row">
								<div class="col-12 mb-3">
									<input type="password"
										class="form-control password-form-control" id="curPassword"
										placeholder="현재 비밀번호"
										data-parsley-message="영문/숫자/특수문자 조합 8~16자 조합으로 입력해주세요."
										data-parsley-pattern="^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{8,16}$">
									<p class="message"></p>
								</div>
								<c:if test="${param.action eq 'password'}">
									<div class="col-12 mb-3">
										<input type="password"
											class="form-control password-form-control" id="password1"
											placeholder="변경할 비밀번호"
											data-parsley-message="영문/숫자/특수문자 조합 8~16자 조합으로 입력해주세요."
											data-parsley-pattern="^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{8,16}$">
										<p class="message"></p>
									</div>
									<div class="col-12 mb-3">
										<input type="password"
											class="form-control password-form-control" id="password"
											placeholder="변경할 비밀번호 확인" data-form="reword-password"
											data-parsley-message="영문/숫자/특수문자 조합 8~16자 조합으로 입력해주세요."
											data-parsley-pattern="^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{8,16}$">
										<p class="message"></p>
									</div>
								</c:if>
							</div>
							<div class="login">
							<c:choose>
								<c:when test="${param.action eq 'password'}">
									<button type="button" class="btn amado-btn myInfo-btn col-12 mb-15">비밀번호 변경하기</button>
								</c:when>
								<c:when test="${param.action eq 'update'}">
									<button type="button" class="btn amado-btn myInfo-btn col-12 mb-15">수정하기</button>
								</c:when>
								<c:otherwise>
									<button type="button" class="btn amado-btn myInfo-btn col-12 mb-15">탈퇴하기</button>
								</c:otherwise>
							</c:choose>
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