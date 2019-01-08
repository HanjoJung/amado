<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
        <!-- Mobile Nav (max width 767px)-->
        <div class="mobile-nav">
            <!-- Navbar Brand -->
            <div class="amado-navbar-brand">
                <a href="/"><img src="${pageContext.request.contextPath}/resources/img/core-img/logo.png" alt=""></a>
            </div>
            <!-- Navbar Toggler -->
            <div class="amado-navbar-toggler">
                <span></span><span></span><span></span>
            </div>
        </div>

        <!-- Header Area Start -->
        <header class="header-area clearfix">
            <!-- Close Icon -->
            <div class="nav-close">
                <i class="fa fa-close" aria-hidden="true"></i>
            </div>
            <!-- Logo -->
            <div class="logo">
                <a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/resources/img/core-img/logo.png" alt=""></a>
            </div>
            <!-- Amado Nav -->
            <nav class="amado-nav">
                <ul>
                    <li class="active"><a href="${pageContext.request.contextPath}">Home</a></li>
                    <li><a href="${pageContext.request.contextPath}/product/shop">Shop</a></li>
                    <li><a href="${pageContext.request.contextPath}/product/product">Product</a></li>
                    <li><a href="${pageContext.request.contextPath}/product/cart">Cart</a></li>
                    <li><a href="${pageContext.request.contextPath}/product/checkout">Checkout</a></li>
                </ul>
            </nav>
            <!-- Cart Menu -->
            <div class="cart-fav-search mb-70">
                <a href="${pageContext.request.contextPath}/product/cart" class="cart-nav"><img src="${pageContext.request.contextPath}/resources/img/core-img/cart.png" alt=""> 장바구니 <span>(0)</span></a>
                <a href="${pageContext.request.contextPath}/product/wishList" class="fav-nav"><img src="${pageContext.request.contextPath}/resources/img/core-img/favorites.png" alt=""> 위시리스트</a>
                <%-- <a href="#" class="search-nav"><img src="${pageContext.request.contextPath}/resources/img/core-img/search.png" alt=""> 검색</a> --%>
            </div>
            
            <!-- Button Group -->
            <div class="amado-btn-group mt-50 mb-100">
                    <div class="search-content mb-15">
                        <form action="#" method="get">
                            <input type="search" name="search" id="search" placeholder="검색">
                            <button type="submit"><img src="${pageContext.request.contextPath}/resources/img/core-img/search.png" alt=""></button>
                        </form>
                    </div>
                <a href="${pageContext.request.contextPath}/member/login" class="btn amado-btn mb-15">로그인</a>
                <a href="${pageContext.request.contextPath}/member/join" class="btn amado-btn mb-15">회원가입</a>
                <a href="${pageContext.request.contextPath}/member/myInfo" class="btn amado-btn ">내 정보</a>
            </div>
            <!-- Social Button -->
            <div class="social-info d-flex justify-content-between">
                <a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
            </div>
        </header>
        <!-- Header Area End -->
