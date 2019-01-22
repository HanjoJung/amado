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
					<div class="cart-title">
						<h2>상품 리스트</h2>
					</div>
					<c:forEach items="${list}" var="dto">
						<!-- Single Product Area -->
						<div class="col-12">
							<div class="list-product-wrapper mt-15">
								<!-- Product Image -->
								<div class="product-img">
									<a href="./select?productNum=${dto.productNum}"> <img
										src="${pageContext.request.contextPath}/resources/img/product-img/${dto.file.get(0).fname}">
									</a>
								</div>

								<!-- Product Description -->
								<div class="product-description ">
									<a href="./select?productNum=${dto.productNum}">
										<h5>${dto.productNum}-
											${dto.productName}(${dto.productCode})</h5>
										<h6>조회수 : ${dto.hit} 판매수 : ${dto.sale}</h6>
										<h6>${dto.price}원</h6>
									</a>
									<!-- Ratings & Cart -->
									<div class="ratings-review">
										<div class="ratings"></div>
										<div class="ratings-active" style="width: ${dto.score}%"></div>
									</div>
									<a class="btn amado-btn"  href="./update?productNum=${dto.productNum}">수정</a>
									<button class="product-btn btn amado-btn"
										data-productNum="${dto.productNum}">삭제</button>
								</div>
							</div>
						</div>
						<!-- Single Product Area End -->
					</c:forEach>
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