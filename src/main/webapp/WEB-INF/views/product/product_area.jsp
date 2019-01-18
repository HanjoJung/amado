<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${list}" var="dto">
	<!-- Single Product Area -->
	<div class="col-12 col-sm-6 col-md-12 col-xl-6">
		<div class="single-product-wrapper">
			<!-- Product Image -->
			<div class="product-img">
				<a href="product?productCode=${dto.productCode}"> 
					<img src="${pageContext.request.contextPath}/resources/img/product-img/${dto.file.get(0).fname}"> <!-- Hover Thumb --> 
					<img class="hover-img" src="${pageContext.request.contextPath}/resources/img/product-img/${dto.file.get(1).fname}">
				</a>
			</div>

			<!-- Product Description -->
			<div
				class="product-description d-flex align-items-center justify-content-between">
				<!-- Product Meta Data -->
				<div class="product-meta-data">
					<div class="line"></div>
					<p class="product-price">${dto.price}원</p>
					<a href="product?productCode=${dto.productCode}">
						<h6>${dto.productName}</h6>
					</a>
				</div>
				<!-- Ratings & Cart -->
				<div class="ratings-cart text-right">
					<div class="ratings-review">
						<div class="ratings"></div>
						<div class="ratings-active" style="width: ${dto.score}%"></div>
					</div>
					<div class="cart">
						<a href="cart.html" data-toggle="tooltip" data-placement="left"
							title="Add to Cart"><img
							src="${pageContext.request.contextPath}/resources/img/core-img/cart.png"
							alt=""></a>
					</div>
				</div>
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
						data-curPage="${pager.startNum-1}">◀</a></li>
				</c:if>
				<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
					<c:if test="${pager.curPage eq i}">
						<li class="page-item active"><a class="page-link"
							data-curPage="${i}">${i}</a></li>
					</c:if>
					<c:if test="${pager.curPage ne i}">
						<li class="page-item"><a class="page-link"
							data-curPage="${i}">${i}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${pager.curBlock<pager.totalBlock}">
					<li class="page-item"><a class="page-link"
						data-curPage="${pager.lastNum+1}">▶</a></li>
				</c:if>
			</ul>
		</nav>
	</div>
</c:if>