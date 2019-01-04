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

        <div class="cart-table-area section-padding-100">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12 col-lg-8">
                        <div class="checkout_details_area mt-50 clearfix">

                            <div class="cart-title">
                                <h2>구매하기</h2>
                            </div>

                            <form action="#" method="post">
                                <div class="row">
                                    <div class="col-12 mb-3">
                                        <input type="email" class="form-control" id="email" name="email" placeholder="이메일(ID)" required>
                                    </div>
                                    <div class="col-12 mb-3">
                                        <input type="password" class="form-control" id="password1" placeholder="비밀번호" required>
                                    </div>
                                    <div class="col-12 mb-3">
                                        <input type="password" class="form-control" id="password2" name="password" placeholder="비밀번호 확인" required>
                                    </div>
                                    <div class="col-12 mb-3">
                                        <input type="text" class="form-control" id="name" name="name" placeholder="이름" required>
                                    </div>
                                    <div class="col-12 mb-3">
                                        <input type="number" class="form-control" id="phone" name="phone" placeholder="전화번호 ( - 없이)" draggable="false">
                                    </div>
                                    <div class="col-12 mb-3">
                                        <input type="text" class="form-control mb-3" id="address" placeholder="주소">
                                    </div>
                                    <div class="col-12 mb-3">
                                        <textarea name="comment" class="form-control" id="comment" cols="30" rows="10" placeholder="배송시 참고사항"></textarea>
                                    </div>

                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="col-12 col-lg-4">
                        <div class="cart-summary">
                            <h5>총금액</h5>
                            <ul class="summary-table">
                                <li><span>제품가 : </span> <span>$140.00</span></li>
                                <li><span>배송비 : </span> <span>무료</span></li>
                                <li><span>총금액 : </span> <span>$140.00</span></li>
                            </ul>

                            <div class="payment-method">
                                <!-- Cash on delivery -->
                                <div class="custom-control custom-checkbox mr-sm-2">
                                    <input type="checkbox" class="custom-control-input" id="cod" checked>
                                    <label class="custom-control-label" for="cod">착불</label>
                                </div>
                                <!-- Paypal -->
                                <div class="custom-control custom-checkbox mr-sm-2">
                                    <input type="checkbox" class="custom-control-input" id="paypal">
                                    <label class="custom-control-label" for="paypal">헨드폰 결제 <img class="ml-15" src="${pageContext.request.contextPath}/resources/img/core-img/paypal.png" alt=""></label>
                                </div>
                            </div>

                            <div class="cart-btn mt-100">
                                <a href="#" class="btn amado-btn w-100">결제</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Main Content Wrapper End ##### -->

	<c:import url="${pageContext.request.contextPath}/layout/footer"/>
</body>

</html>