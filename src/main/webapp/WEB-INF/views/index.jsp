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

		<!-- Product categories Area Start -->
		<div class="products-categories-area clearfix">
			<div class="amado-pro-category clearfix">

				<!-- Single category -->
				<div class="single-products-category clearfix">
					<a href="product/shop">
						<img src="${pageContext.request.contextPath}/resources/img/bg-img/1.jpg">
						<div class="hover-content">
							<div class="line"></div>
							<p>From 59,000원</p>
							<h4>Modern Chair</h4>
						</div>
					</a>
				</div>

				<!-- Single category -->
				<div class="single-products-category clearfix">
					<a href="product/shop"> 
						<img src="${pageContext.request.contextPath}/resources/img/bg-img/2.jpg">
						<div class="hover-content">
							<div class="line"></div>
							<p>From 39,000원</p>
							<h4>Minimalistic Plant Pot</h4>
						</div>
					</a>
				</div>

				<!-- Single category -->
				<div class="single-products-category clearfix">
					<a href="product/shop"> 
						<img src="${pageContext.request.contextPath}/resources/img/bg-img/3.jpg"> 
						<div class="hover-content">
							<div class="line"></div>
							<p>From 49,000원</p>
							<h4>Modern Chair</h4>
						</div>
					</a>
				</div>

				<!-- Single category -->
				<div class="single-products-category clearfix">
					<a href="product/shop"> 
						<img src="${pageContext.request.contextPath}/resources/img/bg-img/4.jpg"> 
						<div class="hover-content">
							<div class="line"></div>
							<p>From 25,000원</p>
							<h4>Night Stand</h4>
						</div>
					</a>
				</div>

				<!-- Single category -->
				<div class="single-products-category clearfix">
					<a href="product/shop"> 
						<img src="${pageContext.request.contextPath}/resources/img/bg-img/5.jpg"> 
						<div class="hover-content">
							<div class="line"></div>
							<p>From 25,000원</p>
							<h4>Plant Pot</h4>
						</div>
					</a>
				</div>

				<!-- Single category -->
				<div class="single-products-category clearfix">
					<a href="product/shop"> 
						<img src="${pageContext.request.contextPath}/resources/img/bg-img/6.jpg">
						<div class="hover-content">
							<div class="line"></div>
							<p>From 139,000원</p>
							<h4>Small Table</h4>
						</div>
					</a>
				</div>

				<!-- Single category -->
				<div class="single-products-category clearfix">
					<a href="product/shop"> 
						<img src="${pageContext.request.contextPath}/resources/img/bg-img/7.jpg"> 
						<div class="hover-content">
							<div class="line"></div>
							<p>From 99,000원</p>
							<h4>Metallic Chair</h4>
						</div>
					</a>
				</div>

				<!-- Single category -->
				<div class="single-products-category clearfix">
					<a href="product/shop"> 
						<img src="${pageContext.request.contextPath}/resources/img/bg-img/8.jpg">
						<div class="hover-content">
							<div class="line"></div>
							<p>From 119,000원</p>
							<h4>Modern Rocking Chair</h4>
						</div>
					</a>
				</div>

				<!-- Single category -->
				<div class="single-products-category clearfix">
					<a href="product/shop"> 
						<img src="${pageContext.request.contextPath}/resources/img/bg-img/9.jpg"> 
						<div class="hover-content">
							<div class="line"></div>
							<p>From 20,000원</p>
							<h4>Home Deco</h4>
						</div>
					</a>
				</div>
			</div>
		</div>

		<!-- Product categories Area End -->
	</div>
	<!-- ##### Main Content Wrapper End ##### -->
	<c:import url="${pageContext.request.contextPath}/layout/footer" />
</body>

</html>