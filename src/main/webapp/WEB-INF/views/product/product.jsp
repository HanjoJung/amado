<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<c:import url="${pageContext.request.contextPath}/layout/head"/>
</head>

<body>

    <!-- ##### Main Content Wrapper Start ##### -->
    <div class="main-content-wrapper d-flex clearfix">

    <c:import url="${pageContext.request.contextPath}/layout/header"/>
        <!-- Product Details Area Start -->
        <div class="single-product-area section-padding-100 clearfix">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-12">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb mt-50">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item"><a href="#">Furniture</a></li>
                                <li class="breadcrumb-item"><a href="#">Chairs</a></li>
                                <li class="breadcrumb-item active" aria-current="page">white modern chair</li>
                            </ol>
                        </nav>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12 col-lg-7">
                        <div class="single_product_thumb">
                            <div id="product_details_slider" class="carousel slide" data-ride="carousel">
                                <ol class="carousel-indicators">
                                    <li class="active" data-target="#product_details_slider" data-slide-to="0" style="background-image: url(${pageContext.request.contextPath}/resources/img/product-img/pro-big-1.jpg);">
                                    </li>
                                    <li data-target="#product_details_slider" data-slide-to="1" style="background-image: url(${pageContext.request.contextPath}/resources/img/product-img/pro-big-2.jpg);">
                                    </li>
                                    <li data-target="#product_details_slider" data-slide-to="2" style="background-image: url(${pageContext.request.contextPath}/resources/img/product-img/pro-big-3.jpg);">
                                    </li>
                                    <li data-target="#product_details_slider" data-slide-to="3" style="background-image: url(${pageContext.request.contextPath}/resources/img/product-img/pro-big-4.jpg);">
                                    </li>
                                </ol>
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <a class="gallery_img" href="${pageContext.request.contextPath}/resources/img/product-img/pro-big-1.jpg">
                                            <img class="d-block w-100" src="${pageContext.request.contextPath}/resources/img/product-img/pro-big-1.jpg" alt="First slide">
                                        </a>
                                    </div>
                                    <div class="carousel-item">
                                        <a class="gallery_img" href="${pageContext.request.contextPath}/resources/img/product-img/pro-big-2.jpg">
                                            <img class="d-block w-100" src="${pageContext.request.contextPath}/resources/img/product-img/pro-big-2.jpg" alt="Second slide">
                                        </a>
                                    </div>
                                    <div class="carousel-item">
                                        <a class="gallery_img" href="${pageContext.request.contextPath}/resources/img/product-img/pro-big-3.jpg">
                                            <img class="d-block w-100" src="${pageContext.request.contextPath}/resources/img/product-img/pro-big-3.jpg" alt="Third slide">
                                        </a>
                                    </div>
                                    <div class="carousel-item">
                                        <a class="gallery_img" href="${pageContext.request.contextPath}/resources/img/product-img/pro-big-4.jpg">
                                            <img class="d-block w-100" src="${pageContext.request.contextPath}/resources/img/product-img/pro-big-4.jpg" alt="Fourth slide">
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
								<p class="product-price">$180</p>
								<h4>White Modern Chair</h4>
								<!-- Ratings & Review -->
								<div class="ratings-review">
									<div class="ratings"></div>
									<div class="ratings-active"></div>
								</div>
								<!-- Avaiable -->
								<p class="avaibility">
									<i class="fa fa-circle"></i> 재고있음
								</p>
							</div>

							<div class="short_overview my-5">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Aliquid quae eveniet culpa officia quidem mollitia impedit iste
									asperiores nisi reprehenderit consequatur, autem, nostrum
									pariatur enim?</p>
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
								<button type="submit" name="addtocart" value="5"
									class="btn amado-btn">장바구니 담기</button>
							</form>
						</div>
					</div>
				</div>
				<div class="row mt-50">
				<div class="col-12">
				<h4>리뷰</h4>
					<form method="post" class="form-review col-12 mb-3">
						<input type="hidden" class="form-control" id="writer" name="writer" value="${member.name}">
						<div class="col-12 mt-3">
							<div class="rating-star" id="score">
								<div data-value="1" data-message="별로에요." class="icon-star"></div>
								<div data-value="2" data-message="그저 그래요." class="icon-star"></div>
								<div data-value="3" data-message="나쁘지 않아요." class="icon-star"></div>
								<div data-value="4" data-message="마음에 들어요." class="icon-star"></div>
								<div data-value="5" data-message="좋아요!" class="icon-star"></div>
							</div>
							<p class="rating-description"></p>
						</div>
						<div class="col-12 mb-3">
							<input type="text" class="form-control" id="title" name="title"
								placeholder="제목">
						</div>
						<div class="col-12 mb-3">
							<textarea name="contents" class="form-control" id="contents"
								cols="100" rows="10" placeholder="내용"></textarea>
						</div>

						<div class="review">
							<a href="#">리뷰 작성</a>
						</div>
					</form>
					<c:import url="${pageContext.request.contextPath}/../product/review" />
				</div>
				</div>
			</div>
        </div>
        <!-- Product Details Area End -->
    </div>
    <!-- ##### Main Content Wrapper End ##### -->

<c:import url="${pageContext.request.contextPath}/layout/footer"/>
</body>

</html>