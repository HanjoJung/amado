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
                                <c:forEach items="${list}" var="product">
                                    <tr>
                                        <td class="cart_product_img">
                                            <a href="../product/select?productNum=${product.productNum}">
                                            <img src="${pageContext.request.contextPath}/resources/img/product-img/${product.file.get(0).fname}"></a>
                                        </td>
                                        <td class="cart_product_desc">
                                            <h5>${product.productName}</h5>
                                        </td>
                                        <td class="price">
                                            <span class="price">${product.price}원</span>
                                        </td>
                                        <td class="qty">
                                            <div class="qty-btn d-flex">
                                                <div class="quantity">
                                                    <span class="qty-minus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty ) &amp;&amp; qty &gt; 1 ) effect.value--;return false;"><i class="fa fa-minus" aria-hidden="true"></i></span>
                                                    <input type="number" class="qty-text" id="qty" step="1" min="1" max="300" name="quantity" value="1">
                                                    <span class="qty-plus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty )) effect.value++;return false;"><i class="fa fa-plus" aria-hidden="true"></i></span>
                                                </div>
                                            </div>
                                   	    	<button class="cart-delete-btn btn" data-num="${product.num}">삭제</button>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <button class="cart-delete-btn btn" data-id="${product.id}">전체 삭제</button>
                        </div>
                    </div>
                    <div class="col-12 col-lg-4">
                        <div class="cart-summary">
                            <h5>총 금액</h5>
                            <ul class="summary-table">
                                <li><span>제품가 : </span> <span>$140.00</span></li>
                                <li><span>할인액 : </span> <span>0원</span></li>
                                <li><span>배송비 : </span> <span>무료</span></li>
                                <li><span>총금액 : </span> <span>$140.00</span></li>
                            </ul>
                            <div class="cart-btn mt-100">
                                <a href="cart.html" class="btn amado-btn w-100">결제</a>
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
<script src="${pageContext.request.contextPath}/resources/js/cart.js"></script>
</html>