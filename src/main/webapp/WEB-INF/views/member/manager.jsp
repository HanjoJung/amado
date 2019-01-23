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
					<div class="checkout_details_area mt-50 clearfix">

						<div class="cart-title">
							<h2>관리자</h2>
						</div>
						<div class="col-12 col-sm-6 col-md-12 col-xl-6">
							<a href="${pageContext.request.contextPath}/member/list"
								class="btn amado-btn">회원리스트</a>
						</div>
						<div class="col-12 col-sm-6 col-md-12 col-xl-6">
							<a href="${pageContext.request.contextPath}/product/list"
								class="btn amado-btn">상품리스트</a>
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