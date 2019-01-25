<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- ##### Footer Area Start ##### -->
<footer class="footer_area clearfix">
	<div class="container">
		<div class="row align-items-center">
			<!-- Single Widget Area -->
			<div class="col-12 col-lg-4">
				<div class="single_widget_area">
					<!-- Logo -->
					<div class="footer-logo mr-50">
						<a href="index.html">
						<img src="${pageContext.request.contextPath}/resources/img/core-img/logo2.png">
						</a>
					</div>
					<!-- Copywrite Text -->
					<p class="copywrite">
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This template is made with <i
							class="fa fa-heart-o" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
			<!-- Single Widget Area -->
			<div class="col-12 col-lg-8">
				<div class="single_widget_area">
					<!-- Footer Menu -->
					<div class="footer_menu">
						<nav class="navbar navbar-expand-lg justify-content-end">
							<button class="navbar-toggler" type="button"
								data-toggle="collapse" data-target="#footerNavContent"
								aria-controls="footerNavContent" aria-expanded="false"
								aria-label="Toggle navigation">
								<i class="fa fa-bars"></i>
							</button>
							<div class="collapse navbar-collapse" id="footerNavContent">
								<ul class="navbar-nav ml-auto">
									<li class="nav-item active"><a class="nav-link"
										href="${pageContext.request.contextPath}">Home</a></li>
									<li class="nav-item"><a class="nav-link"
										href="${pageContext.request.contextPath}/product/shop">Shop</a>
									</li>
									<li class="nav-item"><a class="nav-link"
										href="{pageContext.request.contextPath}/product/product">Product</a>
									</li>
									<li class="nav-item"><a class="nav-link"
										href="{pageContext.request.contextPath}/product/cart">Cart</a>
									</li>
									<li class="nav-item"><a class="nav-link"
										href="{pageContext.request.contextPath}/product/checkout">Checkout</a>
									</li>
								</ul>
							</div>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
</footer>
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content" style="padding: 10px;"></div>
	</div>
</div>
<!-- ##### Footer Area End ##### -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery/jquery-2.2.4.min.js"></script>
	<!-- Popper js -->
	<script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
	<!-- Bootstrap js -->
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<!-- Plugins js -->
	<script src="${pageContext.request.contextPath}/resources/js/plugins.js"></script>
	
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
    
	<!-- Active js -->
	<script src="${pageContext.request.contextPath}/resources/js/active.js"></script>
	
	<script src="${pageContext.request.contextPath}/resources/js/frmCheck.js"></script>
	<script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/cookie.js"></script>
<script type="text/javascript">
	$(function() {
		message = "${param.msg}";
		if (message != "") {
			alert(message);
		}
	})
</script>