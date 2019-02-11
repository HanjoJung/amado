<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<body>

	<!-- ##### Main Content Wrapper Start ##### -->
	<div class="main-content-wrapper d-flex clearfix">
		<div class="cart-table-area" id="manager-list">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="cart-title mt-50">
							<h2>상품 리스트(${count})</h2>
							<a href="${pageContext.request.contextPath}/product/insert"
								class="btn amado-btn" style="width: 160px;">상품추가</a>
						</div>

						<div class="cart-table clearfix">
							<table class="table table-list-product">
								<tbody>
									<c:forEach items="${list}" var="product">
										<tr>
											<td class="list-product-img" style="width: auto;">
												<a href="../product/select?productNum=${product.productNum}">
													<img style="width: 130px;" 
													src="${pageContext.request.contextPath}/resources/img/product-img/${product.file.get(0).fname}">
												</a>
											</td>
											<td class="list-product-info">
											<a class="title" href="../product/select?productNum=${product.productNum}">
													${product.productNum}-${product.productName}(${product.productCode})
											</a>
												<div>
													<span class="price">${product.price}원</span>
													<span>조회수 : ${product.hit}</span>
													<span>판매수 : ${product.sale}</span> 
												</div>
												<a class="btn amado-btn col-12"
												href="../product/update?productNum=${product.productNum}">수정</a>
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
											data-curPage="${pager.startNum-1}">◀</a></li>
									</c:if>
									<c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
										var="i">
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
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ##### Main Content Wrapper End ##### -->

</body>
<script type="text/javascript">
	$(".product-btn").click(function() {
		$.ajax({
			url : "../product/delete",
			type : "POST",
			data : {
				productNum : $(this).attr("data-productNum")
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
