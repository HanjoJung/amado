<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<c:import url="${pageContext.request.contextPath}/layout/head" />
<script type="text/javascript">
	function product_list(dataCurPage) {
		jQuery.ajaxSettings.traditional = true;
		$.ajax({
			url : "./product_area",
			data : {
				curPage : dataCurPage,
				perPage : dataView,
				sort : dataSort,
				kind : dataCategorie,
				search : dataSearch,
				brand : dataBrand,
				minPrice : dataMinPrice,
				maxPrice : dataMaxPrice
			}, 
			success : function(data) {
				$(".product-area").html(data);
			}
		})
	};
	
	$(function() {
		dataView = 8;
		dataSort = "";
		dataCategorie = "";
		dataSearch = "${param.search}";
		dataBrand = [];
		dataMinPrice = 10000;
		dataMaxPrice = 1000000;
		
		product_list(1);
		
		$(".product-area").on("click",".page-link", function() {
			dataCurPage = $(this).attr("data-curPage");
			product_list(dataCurPage);
			$('body,html').animate({ scrollTop: 0 }, 0);
		});
		
		$("#viewProduct + .nice-select .list .option").click(function() {
			dataView = $(this).attr("data-value");
			product_list(1);
		});
		
		$("#sortBydate + .nice-select .list .option").click(function() {
			dataSort = $(this).attr("data-value");
			product_list(1);
		});

		$(".categorie").click(function() {
			dataCategorie = $(this).attr("data-categorie");
			product_list(1);
			$(".categories-menu .active").attr("class","");
			$(this).parent().attr("class","active");
		});
		
		$("#BrandAll").click(function() {
			if($("#BrandAll").prop("checked")){
				$(".form-check-input").prop("checked", true);
			}else{
				$(".form-check-input").prop("checked", false);
			}
		});
		
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
		});
		
		$(".form-check").click(function() {
			dataBrand = [];
			$(".form-check-input").each(function() {
				if($(this).prop("checked")){
					dataBrand.push($(this).attr("id"));
				}
			})
			product_list(1);
		});
		
	
    // :: 11.0 Slider Range Price Active Code
    $('.slider-range-price').each(function () {
        var min = $(this).data('min');
        var max = $(this).data('max');
        var unit = $(this).data('unit');
        var value_min = $(this).data('value-min');
        var value_max = $(this).data('value-max');
        var label_result = $(this).data('label-result');
        var t = $(this);
        $(this).slider({
            range: true,
            min: min,
            max: max,
            values: [value_min, value_max],
            slide: function (event, ui) {
                var result = label_result + " "+ ui.values[0]  + unit + ' - ' + ui.values[1] + unit;
        		dataMinPrice = ui.values[0]*10000;
        		dataMaxPrice = ui.values[1]*10000;
                t.closest('.slider-range').find('.range-price').html(result);
                t.closest('.slider-range').find('.range-price-value').val(result);
            }
        });
    });
    
     $(".price").mouseleave(function() {
    	product_list(1);
	}) 
     $(".ui-slider-handle").mouseup(function() {
    	product_list(1);
	}) 
		
	});
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
						<c:forEach items="${category}" var="category">
						<li><a class="categorie" data-categorie="${category}">${category}</a></li>
						</c:forEach>
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
					<c:forEach items="${brand}" var="brand">
						<div class="form-check mb-15">
							<input class="form-check-input" type="checkbox" id="${brand}">
							<label class="form-check-label" for="${brand}">${brand}</label>
						</div>
					</c:forEach>
				</div>
			</div>

			<!-- ##### Single Widget ##### -->
			<div class="widget price mb-50">
				<!-- Widget Title -->
				<h6 class="widget-title mb-30">가격</h6>
				<div class="widget-desc">
					<div class="slider-range">
						<div 
						class="slider-range-price ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all"
						data-min="1" 
						data-max="100" 
						data-unit="만원"
						data-value-min="1" 
						data-value-max="100" 
						data-label-result="">
							<div class="ui-slider-range ui-widget-header ui-corner-all"></div>
							<span class="ui-slider-handle ui-state-default ui-corner-all"
								tabindex="0"></span> <span
								class="ui-slider-handle ui-state-default ui-corner-all"
								tabindex="0"></span>
						</div>
						<div class="range-price">1만원 - 100만원</div>
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
							</div>
							<!-- Sorting -->
							<div class="product-sorting d-flex">
								<div class="sort-by-date d-flex align-items-center mr-15">
									<p>Sort by</p>
										<select id="sortBydate">
											<option value="default">최신순</option>
											<option value="priceAsc">낮은 가격순</option>
											<option value="priceDesc">높은 가격순</option>
											<option value="score">높은 점수순</option>
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