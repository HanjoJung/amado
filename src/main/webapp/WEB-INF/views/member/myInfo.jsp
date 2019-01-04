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
                    <div class="col-12">
                        <div class="checkout_details_area mt-50 clearfix">

                            <div class="cart-title">
                                <h2>내 정보</h2>
                            </div>

                            <form action="${pageContext.request.contextPath}/member/update" method="post">
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
                                </div>
                				<button type="button" id="submit" class="btn amado-btn col-12 mb-3">수정</button>
                            </form>
                        </div>
                		<button type="button" id="delete" class="btn amado-btn col-12 mb-3">회원탈퇴</button>
                		<%-- <a href="${pageContext.request.contextPath}/member/delete" class="btn amado-btn col-12">회원탈퇴</a> --%>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Main Content Wrapper End ##### -->

	<c:import url="${pageContext.request.contextPath}/layout/footer"/>
</body>

</html>