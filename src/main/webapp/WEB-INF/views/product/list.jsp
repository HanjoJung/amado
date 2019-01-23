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
					<div class="col-12 col-sm-6 col-md-12 col-xl-6">
						<div class="cart-title mt-50">
							<h2>상품 리스트</h2>
						</div>

						<div class="cart-table clearfix">
							<table class="table table-list-product">
								<tbody>
									<c:forEach items="${list}" var="product">
										<tr>
											<td class="list-product-img">
											<a href="../product/select?productNum=${product.productNum}">
												<img src="${pageContext.request.contextPath}/resources/img/product-img/${product.file.get(0).fname}">
											</a>
											</td>
											<td class="list-product-info">
											<a class="title" href="./select?productNum=${product.productNum}">
													${product.productNum}-${product.productName}<br>(${product.productCode})
											</a>
											<p class="price">${product.price}원</p>
												<p>조회수 : ${product.hit}</p>
												<p>판매수 : ${product.sale}</p>
											<a class="btn amado-btn col-12"
												href="./update?productNum=${product.productNum}">수정</a>
											<button class="product-btn btn amado-btn col-12"
												data-productNum="${product.productNum}">삭제</button></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<c:if test="${empty list}">
								<div class="col-12" style="text-align: center;">
									<h4 style="line-height: 10;">상품이 없습니다</h4>
								</div>
							</c:if>

							<c:if test="${not empty list}">
								<div class="col-12">
									<!-- Pagination -->
									<nav aria-label="navigation">
										<ul class="pagination justify-content-end mt-50">

											<c:if test="${pager.curBlock > 1}">
												<li class="page-item"><a class="page-link"
													href="./list?curPage=${pager.lastNum-1}">◀</a></li>
											</c:if>
											<c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
												var="i">
												<c:if test="${pager.curPage eq i}">
													<li class="page-item active"><a class="page-link"
														href="./list?curPage=${i}">${i}</a></li>
												</c:if>
												<c:if test="${pager.curPage ne i}">
													<li class="page-item"><a class="page-link"
														href="./list?curPage=${i}">${i}</a></li>
												</c:if>
											</c:forEach>
											<c:if test="${pager.curBlock<pager.totalBlock}">
												<li class="page-item"><a class="page-link"
													href="./list?curPage=${pager.lastNum+1}">▶</a></li>
											</c:if>
										</ul>
									</nav>
								</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ##### Main Content Wrapper End ##### -->

	<c:import url="${pageContext.request.contextPath}/layout/footer" />
</body>
<script type="text/javascript">
	$(".product-btn").click(function() {
		dataProductNum = $(this).attr("data-productNum");
		$.ajax({
			url : "./delete",
			type : "POST",
			data : {
				productNum : dataProductNum
			},
			success : function(data) {
				alert(data);
				location.reload();
			},
			error : function() {
				alert("삭제하지 못하였습니다.")
			}
		})
	})
</script>
</html>