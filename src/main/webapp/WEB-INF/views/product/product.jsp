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
		<!-- Product Details Area Start -->
		<div class="single-product-area section-padding-100 clearfix">
			<div class="container-fluid">

				<div class="row">
					<div class="col-12">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb mt-50">
								<li class="breadcrumb-item"><a href="/">Home</a></li>
								<li class="breadcrumb-item"><a href="./shop">Shop</a></li>
								<li class="breadcrumb-item"><a href="./shop">${productDTO.kind}</a></li>
								<li class="breadcrumb-item active" aria-current="page">${productDTO.productName}</li>
							</ol>
						</nav>
					</div>
				</div>

				<div class="row">
					<div class="col-12 col-lg-7">
						<div class="single_product_thumb">
							<div id="product_details_slider" class="carousel slide"
								data-ride="carousel">
								<ol class="carousel-indicators">
									<li class="active" data-target="#product_details_slider"
										data-slide-to="0"
										style="background-image: url(${pageContext.request.contextPath}/resources/img/product-img/pro-big-1.jpg);">
									</li>
									<li data-target="#product_details_slider" data-slide-to="1"
										style="background-image: url(${pageContext.request.contextPath}/resources/img/product-img/pro-big-2.jpg);">
									</li>
									<li data-target="#product_details_slider" data-slide-to="2"
										style="background-image: url(${pageContext.request.contextPath}/resources/img/product-img/pro-big-3.jpg);">
									</li>
									<li data-target="#product_details_slider" data-slide-to="3"
										style="background-image: url(${pageContext.request.contextPath}/resources/img/product-img/pro-big-4.jpg);">
									</li>
								</ol>
								<div class="carousel-inner">
									<div class="carousel-item active">
										<a class="gallery_img"
											href="${pageContext.request.contextPath}/resources/img/product-img/pro-big-1.jpg">
											<img class="d-block w-100"
											src="${pageContext.request.contextPath}/resources/img/product-img/pro-big-1.jpg"
											alt="First slide">
										</a>
									</div>
									<div class="carousel-item">
										<a class="gallery_img"
											href="${pageContext.request.contextPath}/resources/img/product-img/pro-big-2.jpg">
											<img class="d-block w-100"
											src="${pageContext.request.contextPath}/resources/img/product-img/pro-big-2.jpg"
											alt="Second slide">
										</a>
									</div>
									<div class="carousel-item">
										<a class="gallery_img"
											href="${pageContext.request.contextPath}/resources/img/product-img/pro-big-3.jpg">
											<img class="d-block w-100"
											src="${pageContext.request.contextPath}/resources/img/product-img/pro-big-3.jpg"
											alt="Third slide">
										</a>
									</div>
									<div class="carousel-item">
										<a class="gallery_img"
											href="${pageContext.request.contextPath}/resources/img/product-img/pro-big-4.jpg">
											<img class="d-block w-100"
											src="${pageContext.request.contextPath}/resources/img/product-img/pro-big-4.jpg"
											alt="Fourth slide">
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-12 col-lg-5">
						<div class="single_product_desc">
							<!-- Product Meta Data -->
							<div class="product-meta-data mb-50">
								<div class="line"></div>
								<p class="product-price">${productDTO.price}원</p>
								<h4>${productDTO.productName}</h4>
								<!-- Ratings & Review -->
								<div class="ratings-review">
									<div class="ratings"></div>
									<div class="ratings-active" style="width: ${productDTO.score}%"></div>
								</div>
								<!-- Avaiable -->
								<p class="avaibility">
									<c:if test="${productDTO.stock gt 0}">
										<i class="fa fa-circle stock"></i> 재고있음
									</c:if>
									<c:if test="${productDTO.stock le 0}">
										<i class="fa fa-circle none-stock"></i> 재고없음
									</c:if>
								</p>
							</div>

							<div class="short_overview my-5">
								<p>${productDTO.contents}</p>
							</div>

							<!-- Add to Cart Form -->
							<form class="cart clearfix mb-50" method="post">
								<div class="cart-btn d-flex mb-50">
									<p>수량</p>
									<div class="quantity">
										<span class="qty-minus"
											onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty ) &amp;&amp; qty &gt; 1 ) effect.value--;return false;"><i
											class="fa fa-caret-down" aria-hidden="true"></i></span> <input
											type="number" class="qty-text" id="qty" step="1" min="1"
											max="300" name="quantity" value="1"> <span
											class="qty-plus"
											onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty )) effect.value++;return false;"><i
											class="fa fa-caret-up" aria-hidden="true"></i></span>
									</div>
								</div>
								<button type="button" class="btn amado-btn cart-btn mt-15">장바구니 담기</button>
								<button type="button" class="btn amado-btn checkout-btn mt-15">구매하기</button>
							</form>
						</div>
					</div>
				</div>
				<div class="row mt-50">
					<div class="col-12">
						<h4>리뷰</h4>
						<div class="form-review col-12">
							<input type="hidden" id="writer" value="${member.id}">
							<div class="col-12 mt-3">
								<div class="rating-star" id="score">
									<div data-value="1" data-message="별로에요."
										class="icon-star active"></div>
									<div data-value="2" data-message="그저 그래요."
										class="icon-star active"></div>
									<div data-value="3" data-message="나쁘지 않아요."
										class="icon-star active"></div>
									<div data-value="4" data-message="마음에 들어요."
										class="icon-star active"></div>
									<div data-value="5" data-message="좋아요!"
										class="icon-star active"></div>
								</div>
								<p class="rating-description">좋아요!</p>
							</div>
							<div class="col-12 mb-3 tool-message">
								<input type="text" class="form-control" id="title" placeholder="제목">
  								<span class="tooltiptext">제목을 입력해주세요.</span>
							</div>
							<div class="col-12 mb-3 tool-message">
								<textarea class="form-control" id="contents" placeholder="내용" 
								cols="100" rows="10" onkeyup="autoSize(this)"></textarea>
								<span class="tooltiptext">내용을 입력해주세요.</span>
							</div>
							<div class="col-12 mb-3">
								<a class="review-write">리뷰 작성</a>
							</div>
						</div>
						<div class="review-view col-12"></div>
					</div>
				</div>
			</div>
		</div>
		<!-- Product Details Area End -->
	</div>
	<!-- ##### Main Content Wrapper End ##### -->

	<c:import url="${pageContext.request.contextPath}/layout/footer" />
</body>

<script type="text/javascript">

	var page = 3;
	
	function review() {
		$.ajax({
			url : "../review/list",
			data : {
				productCode : "${productDTO.productCode}",
				perPage : page
			},
			success : function(review) {
				$(".review-view").html(review);
			}
		})
	}
	
	review()
	
	$(".review-view").on("click",".btn-more-review",function() {
		page += 3;
		review();
	})
	$(".icon-star").click(function() {
		$(this).nextAll().attr("class", "icon-star");
		$(this).prevAll().attr("class", "icon-star active");
		$(this).attr("class", "icon-star active");
		$(".rating-description").html($(this).attr("data-message"));
	})
	
	$(".review-write").click(function() {
		console.log($("#title").val());
		console.log($("#title").val().length);
		console.log($("#contents").val());
		console.log($("#contents").val().length);
		checkNull = true;
		$(".form-control").each(function() {
			if($(this).val().length == 0){
				$(this).focus();
				$(this).next(".tooltiptext").css({
					visibility: "visible",
			  		opacity: 1});
				checkNull = false;
				return checkNull;
			}
		})
		if(checkNull){
			$.ajax({
				url : "../review/insert",
				type : "POST",
				data : {
					productCode : "${productDTO.productCode}",
					writer : $("#writer").val(),
					title : $("#title").val(),
					contents : $("#contents").val(),
					score : $(".icon-star.active:last").attr("data-value")
				},
				success : function(result) {
					alert(result);
					review();
				}
			})
		}
		$("#title").val("");
		$("#contents").val("");
	})
	$(".form-control").keydown(function() {
		$(".tooltiptext").css({
			visibility: "hidden",
		  	opacity: 0});
	})
	

function autoSize(obj) {
	obj.style.height = "1px";
	obj.style.height = (12+obj.scrollHeight)+"px";
}

$(".cart-btn").click(function() {
	console.log("cart-btn");
	
})
</script>
</html>