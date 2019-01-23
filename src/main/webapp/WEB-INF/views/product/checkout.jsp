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
						<div class="checkout_details_area mt-50 clearfix">

							<div class="cart-title">
								<h2>구매하기</h2>
							</div>

							<form id="checkout-frm" action="./checkout" method="post">
								<div class="row">
									<div class="col-12 mb-3">
										<input type="email" class="form-control" id="id"
											name="email" placeholder="이메일(ID)" required="required"
											value="${member.id}">
									</div>
									<div class="col-12 mb-3">
										<input type="text" class="form-control" id="name" name="name"
											placeholder="이름" required="required" value="${member.name}">
									</div>
									<div class="col-12 mb-3">
										<input type="text" class="form-control" id="phone"
											name="phone" placeholder="전화번호 ( - 없이)" required="required"
											value="${member.phone}">
									</div>
									<div class="col-12 mb-3">
										<input type="text" class="form-control mb-3" id="address"
											placeholder="주소" required="required"
											value="${member.address}">
									</div>
									<div class="col-12 mb-3">
										<textarea name="comment" class="form-control" id="comment"
											cols="30" rows="10" placeholder="배송시 참고사항"></textarea>
									</div>
									<input type="hidden" class="total-price" name="price">
								</div>
							</form>
						</div>
					</div>
					<div class="col-12 col-lg-4">
						<div class="cart-summary">
							<h5>총금액</h5>
							<ul class="summary-table">
								<li><span>제품가 : </span> <span id="product-price"></span></li>
								<li><span>할인액 : </span> <span id="discount-price"></span></li>
								<li><span>배송비 : </span> <span id="delivery-price"></span></li>
								<li><span>총금액 : </span> <span id="total-price"></span></li>
							</ul>

							<div class="payment-method">
								<!-- Cash on delivery -->
								<div class="custom-control custom-checkbox mr-sm-2">
									<input type="checkbox" class="custom-control-input" id="cod"
										checked> <label class="custom-control-label" for="cod">착불</label>
								</div>
								<!-- Paypal -->
								<div class="custom-control custom-checkbox mr-sm-2">
									<input type="checkbox" class="custom-control-input" id="paypal">
									<label class="custom-control-label" for="paypal">헨드폰 결제
										<img class="ml-15"
										src="${pageContext.request.contextPath}/resources/img/core-img/paypal.png">
									</label>
								</div>
							</div>

							<div class="cart-btn mt-100">
								<button type="button"
									class="btn amado-btn checkout-submit-btn w-100">결제</button>
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
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
	$(function() {

		var price = ${param.price};
		var code = "${param.code}";
		var discount = 0;
		var delivery = 0;
		var total = 0;
		function qtyPrice(price) {

			$("#product-price").text(priceFormat(price));

			$("#discount-price").text(priceFormat(discount));

			if (price < 100000) {
				delivery = 50000;
				$("#delivery-price").text(priceFormat(delivery));
			} else {
				$("#delivery-price").text("무료");
			}

			total = price - discount + delivery;
			$("#total-price").text(priceFormat(total));
			$(".total-price").val(total);
		}

		qtyPrice(price);

		$(".qty-text").change(function() {
			qtyPrice(price);
		})
		$(".qty-minus,.qty-plus").click(function() {
			qtyPrice(price);
		})

		function priceFormat(price) {
			price = String(price);
			thousand = price.substring(price.length - 3, price.length);
			million = price.substring(price.length - 6, price.length - 3);
			billion = price.substring(price.length - 9, price.length - 6);

			result = thousand + "원";

			if (billion != "") {
				result = billion + "," + million + "," + thousand + "원";
			} else if (million != "") {
				result = million + "," + thousand + "원";
			}
			;
			return result;
		}

		var IMP = window.IMP; // 생략가능
		IMP.init('imp27429041'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		
		$(".checkout-submit-btn").click(function() {
			IMP.request_pay({
				pg : 'inicis', // version 1.1.0부터 지원.
				pay_method : 'card',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : code + ':결제테스트',
				amount : 100,
				buyer_email : $("#id").val(),
				buyer_name : $("#name").val(),
				buyer_tel : $("#phone").val(),
				buyer_addr : $("#address").val(),
				buyer_postcode : '123-456',
				m_redirect_url : 'https://www.yourdomain.com/payments/complete'
			}, function(rsp) {
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
				}
				console.log(rsp);
			});
		})
	})
</script>
</html>