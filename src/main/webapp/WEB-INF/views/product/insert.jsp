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
								<h2>회원가입</h2>
							</div>

							<form class="frm" action="./insert" method="post"
								id="product-insert" enctype="multipart/form-data">
								<div class="row">
									<div class="col-12 mb-3">
										<input type="text" class="form-control" name="productCode"
											placeholder="상품코드">
										<p class="message"></p>
									</div>
									<div class="col-12 mb-3">
										<select name="brand">
											<option>Amado</option>
											<option>Ikea</option>
											<option>Furniture Inc</option>
											<option>The factory</option>
											<option>Artdeco</option>
										</select>
										<div style="width: 100%; padding-left: 94.16px;">
											<input type="text" class="form-control" name="productName"
												placeholder="상품이름">
											<p class="message"></p>
										</div>
									</div>
									<div class="col-12 mb-3">
											<input type="number" class="form-control" name="price"
												placeholder="가격">
											<p class="message"></p>
									</div>
									<input type="hidden" name="kind" value="p">
									<div class="col-12 mb-3">
										<textarea type="text" class="form-control" name="contents"
											placeholder="상품설명"></textarea>
										<p class="message"></p>
									</div>
									<div class="col-12 mb-3">
										<input type="file" class="file" name="f1">
										<input type="file" class="file" name="f1">
										<input type="file" class="file" name="f1">
										<input type="file" class="file" name="f1">
									</div>
									<div class="col-12 mb-3">
										<input type="number" class="form-control" name="stock"
											placeholder="재고량">
										<p class="message"></p>
									</div>
								</div>
								<button type="button" class="btn amado-btn form-btn col-12">상품추가</button>
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