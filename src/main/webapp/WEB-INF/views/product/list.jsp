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
                    <div class="col-12 col-lg-12">
                        <div class="cart-title mt-50">
                            <h2>상품 리스트</h2>
                        </div>

                        <div class="cart-table clearfix">
                            <table class="table table-striped pc-table">
                                <thead class="mb-15">
                                    <tr style=" height: 100%;">
                                        <th style="width: 15%;">ID</th>
                                        <th style="width: 10%">이름</th>
                                        <th style="width: 13%">연락처</th>
                                        <th style="width: 28%; max-width: none;">주소</th>
                                        <th style="width: 13%">가입날짜</th>
                                        <th style="width: 11%">카카오</th>
                                        <th style="width: 11%">페이스북</th>
                                    </tr>	
                                </thead>
                                <thead class="mb-15">
                                    <tr style=" height: 100%;">
                                        <th style="width: 15%; word-break:break-word;">email@gmaile.com</th>
                                        <th style="width: 10%">아무개</th>
                                        <th style="width: 13%">010-9999-9999</th>
                                        <th style="width: 28%; max-width: none;">서울특별시 종로구 999-999 상세주소를 임시로 작성하였습니다</th>
                                        <th style="width: 13%">2019-01-03</th>
                                        <th style="width: 11%">연동</th>
                                        <th style="width: 11%">비연동</th>
									</tr>
                                </thead>
                                <thead class="mb-15">
                                    <tr style=" height: 100%;">
                                        <th style="width: 15%; word-break:break-word;">email@gmaile.com</th>
                                        <th style="width: 10%">아무개</th>
                                        <th style="width: 13%">010-9999-9999</th>
                                        <th style="width: 28%; max-width: none;">서울특별시 종로구 999-999 상세주소를 임시로 작성하였습니다</th>
                                        <th style="width: 13%">2019-01-03</th>
                                        <th style="width: 11%">연동</th>
                                        <th style="width: 11%">비연동</th>
									</tr>
                                </thead>
                                <thead class="mb-15">
                                    <tr style=" height: 100%;">
                                        <th style="width: 15%; word-break:break-word;">email@gmaile.com</th>
                                        <th style="width: 10%">아무개</th>
                                        <th style="width: 13%">010-9999-9999</th>
                                        <th style="width: 28%; max-width: none;">서울특별시 종로구 999-999 상세주소를 임시로 작성하였습니다</th>
                                        <th style="width: 13%">2019-01-03</th>
                                        <th style="width: 11%">연동</th>
                                        <th style="width: 11%">비연동</th>
									</tr>
                                </thead>
                            </table>
                              <table class="table table-striped mobile-table">
                                <thead class="mb-15">
                                    <tr class="h-100">
                                        <th class="w-20">ID</th>
                                        <th class="w-80">email@gmaile.com</th>
                                    </tr><tr class="h-100">
                                        <th class="w-20">이름</th>
                                        <th class="w-80">아무개</th>
                                    </tr><tr class="h-100">
                                        <th class="w-20">연락처</th>
                                        <th class="w-80">010-9999-9999</th>
                                    </tr><tr class="h-100">
                                        <th class="w-20">주소</th>
                                        <th class="w-80"">서울특별시 종로구 999-999 상세주소도 들어가면 길이가 넘어가는데상세주소도 들어가면 길이가 넘어가는데</th>
                                    </tr><tr class="h-100">
                                        <th class="w-20">가입날짜</th>
                                        <th class="w-80">2019-01-03</th>
                                    </tr><tr class="h-100">
                                        <th class="w-20">카카오</th>
                                        <th class="w-80">연동</th>
                                    </tr><tr class="h-100">
                                        <th class="w-20">페이스북</th>
                                        <th class="w-80">비연동</th>
                                    </tr>
                                </thead>  
                                <thead class="mb-15">
                                    <tr class="h-100">
                                        <th class="w-20">ID</th>
                                        <th class="w-80">email@gmaile.com</th>
                                    </tr><tr class="h-100">
                                        <th class="w-20">이름</th>
                                        <th class="w-80">아무개</th>
                                    </tr><tr class="h-100">
                                        <th class="w-20">연락처</th>
                                        <th class="w-80">010-9999-9999</th>
                                    </tr><tr class="h-100">
                                        <th class="w-20">주소</th>
                                        <th class="w-80"">서울특별시 종로구 999-999 상세주소도 들어가면 길이가 넘어가는데상세주소도 들어가면 길이가 넘어가는데</th>
                                    </tr><tr class="h-100">
                                        <th class="w-20">가입날짜</th>
                                        <th class="w-80">2019-01-03</th>
                                    </tr><tr class="h-100">
                                        <th class="w-20">카카오</th>
                                        <th class="w-80">연동</th>
                                    </tr><tr class="h-100">
                                        <th class="w-20">페이스북</th>
                                        <th class="w-80">비연동</th>
                                    </tr>
                                </thead>  
                                <thead class="mb-15">
                                    <tr class="h-100">
                                        <th class="w-20">ID</th>
                                        <th class="w-80">email@gmaile.com</th>
                                    </tr><tr class="h-100">
                                        <th class="w-20">이름</th>
                                        <th class="w-80">아무개</th>
                                    </tr><tr class="h-100">
                                        <th class="w-20">연락처</th>
                                        <th class="w-80">010-9999-9999</th>
                                    </tr><tr class="h-100">
                                        <th class="w-20">주소</th>
                                        <th class="w-80"">서울특별시 종로구 999-999 상세주소도 들어가면 길이가 넘어가는데상세주소도 들어가면 길이가 넘어가는데</th>
                                    </tr><tr class="h-100">
                                        <th class="w-20">가입날짜</th>
                                        <th class="w-80">2019-01-03</th>
                                    </tr><tr class="h-100">
                                        <th class="w-20">카카오</th>
                                        <th class="w-80">연동</th>
                                    </tr><tr class="h-100">
                                        <th class="w-20">페이스북</th>
                                        <th class="w-80">비연동</th>
                                    </tr>
                                </thead>
                            </table>
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