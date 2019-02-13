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
					<div class="col-12 col-lg-8">
						<div class="cart-title mt-50">
							<h2>장바구니</h2>
						</div>

						<div class="cart-table clearfix">
							<table class="table table-responsive">
								<thead>
									<tr>
										<th></th>
										<th>상품명</th>
										<th>가격</th>
										<th>수량</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list}" var="product" varStatus="i">
										<tr>
											<td class="cart_product_img"><a
												href="../product/select?productNum=${product.productNum}">
													<img
													src="${pageContext.request.contextPath}/resources/img/product-img/${product.file.get(0).fname}">
											</a></td>
											<td class="cart_product_desc">
												<h5>${product.productName}</h5>
											</td>
											<td><span class="price">${product.price}원</span>
											</td>
											<td class="qty">
												<div class="qty-btn d-flex">
													<div class="quantity">
														<span class="qty-minus"
															onclick="var effect = document.getElementById('qty${i.index}'); var qty${i.index} = effect.value; if( !isNaN( qty${i.index} ) &amp;&amp; qty${i.index} &gt; 1 ) effect.value--;return false;"><i
															class="fa fa-minus" aria-hidden="true"></i></span> <input
															type="number" class="qty-text" id="qty${i.index}"
															step="1" min="1" max="300" name="quantity" value="1"
															data-price="${product.price}" data-product-code="${product.productCode}">
														<span class="qty-plus"
															onclick="var effect = document.getElementById('qty${i.index}'); var qty${i.index} = effect.value; if( !isNaN( qty${i.index} )) effect.value++;return false;"><i
															class="fa fa-plus" aria-hidden="true"></i></span>
													</div>
												</div>
												<button class="cart-delete-btn btn"
													data-num="${product.num}">삭제</button>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<button class="cart-delete-btn btn" data-id="${product.id}">전체
								삭제</button>
						</div>
					</div>
					<div class="col-12 col-lg-4">
						<div class="cart-summary">
							<h5>총 금액</h5>
							<ul class="summary-table">
								<li><span>제품가 : </span> <span id="product-price"></span></li>
								<li><span>할인액 : </span> <span id="discount-price"></span></li>
								<li><span>배송비 : </span> <span id="delivery-price"></span></li>
								<li><span>총금액 : </span> <span id="total-price"></span></li>
							</ul>
							<div class="cart-btn mt-100">
							<form id="checkout-frm" action="../product/checkout">
								<input type="hidden" class="product-code" name="code">
								<input type="hidden" class="product-price" name="price">
							</form>
								<button type="button" class="btn checkout-submit-btn amado-btn w-100">결제</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ##### Main Content Wrapper End ##### -->

	<c:import url="${pageContext.request.contextPath}/layout/footer" />
</body>
<script src="${pageContext.request.contextPath}/resources/js/cart.js"></script>
<script type="text/javascript">
$(function() {

	var price = 0;
	var code = "";
	var discount = 0;
	var delivery = 0;
	var total = 0;
	function qtyPrice() {
		price = 0;
		$(".qty-text").each(function() {
			price += $(this).attr("data-price")*$(this).val();
			code += $(this).attr("data-product-code")+",";
		})
		code = code.substring(0,code.length-1);
		
		$("#product-price").text(priceFormat(price));
		$(".product-price").val(price);
		$(".product-code").val(code);
		
		$("#discount-price").text(priceFormat(discount));
		
		if(price < 100000){
			delivery = 50000;
			$("#delivery-price").text(priceFormat(delivery));
		}else{
			$("#delivery-price").text("무료");
		}
		
		total = price - discount + delivery;
		$("#total-price").text(priceFormat(total));
	}
	
	qtyPrice();
	
	$(".qty-text").change(function() {
		qtyPrice();
	})
	$(".qty-minus,.qty-plus").click(function() {
		qtyPrice();
	})
	
	function priceFormat(price) {
		price = String(price);
		thousand = price.substring(price.length-3, price.length);
		million = price.substring(price.length-6, price.length-3);
		billion = price.substring(price.length-9, price.length-6);
		
		result = thousand + "원";
		
		if (billion != ""){
			result = billion + "," + million + "," + thousand + "원";
		} else if (million != ""){
			result = million + "," + thousand + "원";
		};
		return result;
	}
	
	$(".checkout-submit-btn").click(function() {
		$("#checkout-frm").submit();
	})
})

$(".cart-delete-btn").click(function() {
	$.ajax({
		url : "./delete",
		type : "POST",
		data : {
			num : $(this).attr("data-num"),
			id : $(this).attr("data-id")
		},
		success : function() {
			location.reload();
		}
	})
})
</script>
</html>