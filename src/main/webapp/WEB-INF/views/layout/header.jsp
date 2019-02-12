<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	$.ajax({
		url:"${pageContext.request.contextPath}/cart/count",
		data: {
			id : "${member.id}"
		},
		success : function(result) {
			$(".cart-count").text("("+result+")");
		}
	})
})
</script>
        <!-- Mobile Nav (max width 767px)-->
        <div class="mobile-nav">
            <!-- Navbar Brand -->
            <div class="amado-navbar-brand">
                <a href="/"><img src="${pageContext.request.contextPath}/resources/img/core-img/logo.png"></a>
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
                <a class="logo" href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/resources/img/core-img/logo.png" alt=""></a>
            <!-- Amado Nav -->
            <nav class="amado-nav">
                <ul>
                    <li class="active"><a href="${pageContext.request.contextPath}">Home</a></li>
                    <li><a href="${pageContext.request.contextPath}/product/shop">Shop</a></li>
                    <li><a href="${pageContext.request.contextPath}/map">map</a></li>
                    <li><a href="${pageContext.request.contextPath}/notice/noticeList">notice</a></li>
                    <li><a href="${pageContext.request.contextPath}/qna/qnaList">QnA</a></li>
                </ul>
            </nav>
            <!-- Cart Menu -->
            <div class="cart-fav-search mb-70">
                <a href="${pageContext.request.contextPath}/cart/cartList" class="cart-nav">
                <img src="${pageContext.request.contextPath}/resources/img/core-img/cart.png"> 장바구니 <span class="cart-count"></span></a>
                <a href="${pageContext.request.contextPath}/product/latest" class="fav-nav">
                <img src="${pageContext.request.contextPath}/resources/img/core-img/favorites.png">최근 본 상품</a>
                <%-- <a href="#" class="search-nav"><img src="${pageContext.request.contextPath}/resources/img/core-img/search.png" alt=""> 검색</a> --%>
            </div>
            
            <!-- Button Group -->
            <div class="amado-btn-group mt-50 mb-100">
                    <div class="search-content mb-15">
                        <form action="${pageContext.request.contextPath}/product/shop">
                            <input type="search" name="search" id="search" placeholder="검색">
                            <button type="submit"><img src="${pageContext.request.contextPath}/resources/img/core-img/search.png" alt=""></button>
                        </form>
                    </div>
                <c:choose>
                	<c:when test="${empty member}">
		            	<a data-toggle="modal" data-target="#myModal" 
		            	href="${pageContext.request.contextPath}/member/loginForm" class="btn amado-btn mb-15">로그인</a>
        		        <a href="${pageContext.request.contextPath}/member/join" class="btn amado-btn mb-15">회원가입</a>
                	</c:when>
                	<c:otherwise>
               			<a href="${pageContext.request.contextPath}/member/myInfo" class="btn amado-btn mb-15">내 정보</a>
               			<a href="${pageContext.request.contextPath}/member/logout" class="btn amado-btn mb-15">로그아웃</a>
                	</c:otherwise>
                </c:choose>
                <c:if test="${member.name eq 'manager'}">
           			<a href="${pageContext.request.contextPath}/member/manager" class="btn amado-btn">관리자</a>
              	</c:if>
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
</html>