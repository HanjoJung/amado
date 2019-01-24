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

		<div class="cart-table-area section-padding-50">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="checkout_details_area mt-50 clearfix">

							<div class="cart-title">
								<h2>상품 등록</h2>
							</div>

							<form class="frm" action="./insert" method="post"
								id="product-insert" enctype="multipart/form-data">
								<div class="row">
									<div class="col-12 mb-3">
										<select name="brand" class="category">
											<option>Amado</option>
											<option>Ikea</option>
											<option>Furniture Inc</option>
											<option>The factory</option>
											<option>Artdeco</option>
										</select>
										<div class="productName">
											<input type="text" class="form-control porduct-insert-form" name="productCode"
												placeholder="상품코드">
											<p class="message"></p>
										</div>
									</div>
									<div class="col-12 mb-3">
										<select name="kind" class="category">
											<option>chair</option>
											<option>beds</option>
											<option>accesories</option>
											<option>furniture</option>
											<option>homeDeco</option>
											<option>table</option>
											<option>kid</option>
										</select>
										<div class="productName">
											<input type="text" class="form-control porduct-insert-form" name="productName"
												placeholder="상품이름">
											<p class="message"></p>
										</div>
									</div>
									<div class="col-12 mb-3">
											<input type="number" class="form-control porduct-insert-form" name="price"
												placeholder="가격 (1만원 이상 기입하세요.)">
											<p class="message"></p>
									</div>
									<div class="col-12 mb-3">
										<textarea type="text" class="form-control porduct-insert-form" name="contents"
											placeholder="상품설명"></textarea>
										<p class="message"></p>
									</div>
									<div class="col-12 mb-3 file-area">
										<div class="file file-left">
											<p>메인이미지</p>
											<input type="file" class="porduct-insert-form"
												style="padding: 5px 10px;" name="f1">
											<input type="file" class="porduct-insert-form"
												style="padding: 5px 10px;" name="f1">
											<p class="message"></p>
										</div>
										<div class="file file-left mb-3">
											<p>서브이미지</p>
											<input type="file" style="padding: 5px 10px;" name="f1">
											<input type="file" style="padding: 5px 10px;" name="f1">
										</div>
									</div>
									<div class="col-12 mb-3">
										<input type="number" class="form-control porduct-insert-form" name="stock"
											placeholder="재고량">
										<p class="message"></p>
									</div>
								<button type="button" class="btn amado-btn porduct-insert-form-btn col-12">상품추가</button>
								</div>
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