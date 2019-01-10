<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<c:import url="${pageContext.request.contextPath}/layout/head" />
<script type="text/javascript">
	function product_list() {
			jQuery.ajaxSettings.traditional = true;

		$.ajax({
			url : "./product_area",
			data : {
				curPage : dataCurPage,
				perPage : dataView,
				sort : dataSort,
				kind : dataCategorie,
				search : dataSearch,
				brand : dataBrand
			}, 
			success : function(data) {
				$(".product-area").html(data);
			}
		})
	}
	$(function() {
		dataCurPage = 1;
		dataView = 8;
		dataSort = "";
		dataCategorie = "";
		dataSearch = "";
		dataBrand = [];
		
		product_list();
		
		$(".product-area").on("click",".page-link", function() {
			dataCurPage = $(this).attr("data-curPage");
			product_list();
			$('body,html').animate({ scrollTop: 0 }, 0);
		})
		
		$("#viewProduct + .nice-select .list .option").click(function() {
			dataView = $(this).attr("data-value");
			product_list();
		})
		
		$("#sortBydate + .nice-select .list .option").click(function() {
			dataSort = $(this).attr("data-value");
			console.log(dataSort)
			product_list();
		})

		$(".categorie").click(function() {
			dataCategorie = $(this).attr("data-categorie");
			product_list();
			$(".categories-menu .active").attr("class","");
			$(this).parent().attr("class","active");
		})
		
		$("#BrandAll").click(function() {
			if($("#BrandAll").prop("checked")){
				$(".form-check-input").prop("checked", true);
			}else{
				$(".form-check-input").prop("checked", false);
			}
		})
		
		$(".form-check-input").click(function() {
				var check = true;
				$("#BrandAll").prop("checked", true);
			$(".form-check-input").each(function() {
				if(!$(this).prop("checked")){
					check = false;
				}
				if(!check){
					$("#BrandAll").prop("checked", false);
					return false;
				}
			})
		})
		
		$(".form-check").click(function() {
			dataBrand = [];
			$(".form-check-input").each(function() {
				if($(this).prop("checked")){
					dataBrand.push($(this).attr("id"));
				}
			})
			console.log(dataBrand);
			product_list();
		}) 
		
	})
</script>
</head>

<body>

	<!-- ##### Main Content Wrapper Start ##### -->
	<div class="main-content-wrapper d-flex clearfix">

		<c:import url="${pageContext.request.contextPath}/layout/header" />
		<div class="shop_sidebar_area">

			<!-- ##### Single Widget ##### -->
			<div class="widget category mb-30">
				<!-- Widget Title -->
				<h6 class="widget-title mb-15">카테고리</h6>

				<!--  categories  -->
				<div class="categories-menu">
					<ul>
						<li class="active"><a class="categorie">ALL</a></li>
						<li><a class="categorie" data-categorie="chair">의자</a></li>
						<li><a class="categorie" data-categorie="beds">침대</a></li>
						<li><a class="categorie" data-categorie="accesories">엑세서리</a></li>
						<li><a class="categorie" data-categorie="furniture">가구</a></li>
						<li><a class="categorie" data-categorie="homeDeco">홈 데코</a></li>
						<li><a class="categorie" data-categorie="table">테이블</a></li>
						<li><a class="categorie" data-categorie="kid">아동</a></li>
					</ul>
				</div>
			</div>

			<!-- ##### Single Widget ##### -->
			<div class="widget brands mb-50">
				<!-- Widget Title -->
				<h6 class="widget-title mb-30">브랜드</h6>

				<div class="widget-desc">
					<!-- Single Form Check -->
					<div class="form-check mb-15">
						<input class="form-check-input" type="checkbox" id="BrandAll">
						<label class="form-check-label" for="BrandAll">ALL</label>
					</div>
					<!-- Single Form Check -->
					<div class="form-check mb-15">
						<input class="form-check-input" type="checkbox" id="Amado">
						<label class="form-check-label" for="Amado">Amado</label>
					</div>
					<!-- Single Form Check -->
					<div class="form-check mb-15">
						<input class="form-check-input" type="checkbox" id="Ikea">
						<label class="form-check-label" for="Ikea">Ikea</label>
					</div>
					<!-- Single Form Check -->
					<div class="form-check mb-15">
						<input class="form-check-input" type="checkbox" id="Furniture Inc">
						<label class="form-check-label" for="Furniture Inc">Furniture Inc</label>
					</div>
					<!-- Single Form Check -->
					<div class="form-check mb-15">
						<input class="form-check-input" type="checkbox" id="The factory" checked="checked">
						<label class="form-check-label" for="The factory">The factory</label>
					</div>
					<!-- Single Form Check -->
					<div class="form-check mb-15">
						<input class="form-check-input" type="checkbox" id="Artdeco" checked="checked">
						<label class="form-check-label" for="Artdeco">Artdeco</label>
					</div>
				</div>
			</div>

			<!-- ##### Single Widget ##### -->
			<div class="widget price mb-50">
				<!-- Widget Title -->
				<h6 class="widget-title mb-30">가격</h6>

				<div class="widget-desc">
					<div class="slider-range">
						<div data-min="10" data-max="1000" data-unit="$"
							class="slider-range-price ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all"
							data-value-min="10" data-value-max="1000" data-label-result="">
							<div class="ui-slider-range ui-widget-header ui-corner-all"></div>
							<span class="ui-slider-handle ui-state-default ui-corner-all"
								tabindex="0"></span> <span
								class="ui-slider-handle ui-state-default ui-corner-all"
								tabindex="0"></span>
						</div>
						<div class="range-price">$10 - $1000</div>
					</div>
				</div>
			</div>
		</div>

		<div class="amado_product_area section-padding-100">
			<div class="container-fluid">

				<div class="row">
					<div class="col-12">
						<div
							class="product-topbar d-xl-flex align-items-end justify-content-between">
							<!-- Total Products -->
							<div class="total-products">
								<p>Showing 1-8 0f 25</p>
								<div class="view d-flex">
									<a href="#"><i class="fa fa-th-large" aria-hidden="true"></i></a>
									<a href="#"><i class="fa fa-bars" aria-hidden="true"></i></a>
								</div>
							</div>
							<!-- Sorting -->
							<div class="product-sorting d-flex">
								<div class="sort-by-date d-flex align-items-center mr-15">
									<p>Sort by</p>
										<select id="sortBydate">
											<option value="default">최신순</option>
											<option value="priceAsc">낮은 가격순</option>
											<option value="priceDesc">높은 가격순</option>
											<option value="good">추천순</option>
										</select>
								</div>
								<div class="view-product d-flex align-items-center">
									<p>View</p>
										<select id="viewProduct">
											<option value="8">8</option>
											<option value="12">12</option>
											<option value="20">20</option>
											<option value="30">30</option>
										</select>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="row product-area"></div>

			</div>
		</div>
	</div>
	<!-- ##### Main Content Wrapper End ##### -->

	<c:import url="${pageContext.request.contextPath}/layout/footer" />
</body>

</html>