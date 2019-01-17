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
					<div class="col-12 col-lg-12">
						<div class="cart-title mt-50">
							<h2>회원 리스트</h2>
						</div>

						<div class="cart-table clearfix">
							<table class="table table-striped">
								<thead class="mb-15 pc-table">
									<tr style="height: 100%;">
										<th style="width: 15%;">ID</th>
										<th style="width: 10%">이름</th>
										<th style="width: 12%">연락처</th>
										<th style="width: 28%; max-width: none;">주소</th>
										<th style="width: 13%">가입날짜</th>
										<th style="width: 11%">카카오</th>
										<th style="width: 11%">페이스북</th>
									</tr>
								</thead>
								<c:forEach items="${list}" var="dto">
									<thead class="mb-15 pc-table">
										<tr style="height: 100%;">
											<th style="width: 15%; word-break: break-word;">${dto.id}</th>
											<th style="width: 10%">${dto.name}</th>
											<th style="width: 12%; word-break: break-word;">${dto.phone}</th>
											<th style="width: 28%; max-width: none;">${dto.address}</th>
											<th style="width: 13%">${dto.join_date}</th>
											<th style="width: 11%"><c:choose>
													<c:when test="${empty dto.kakao}">비연동</c:when>
													<c:otherwise>연동</c:otherwise>
												</c:choose></th>
											<th style="width: 11%"><c:choose>
													<c:when test="${empty dto.facebook}">비연동</c:when>
													<c:otherwise>연동</c:otherwise>
												</c:choose></th>
										</tr>
									</thead>
									<thead class="mb-15 mobile-table">
										<tr class="h-100">
											<th class="w-20">ID</th>
											<th class="w-80">${dto.id}</th>
										</tr>
										<tr class="h-100">
											<th class="w-20">이름</th>
											<th class="w-80">${dto.name}</th>
										</tr>
										<tr class="h-100">
											<th class="w-20">연락처</th>
											<th class="w-80">${dto.phone}</th>
										</tr>
										<tr class="h-100">
											<th class="w-20">주소</th>
											<th class="w-80"">${dto.address}</th>
										</tr>
										<tr class="h-100">
											<th class="w-20">가입날짜</th>
											<th class="w-80">${dto.join_date}</th>
										</tr>
										<tr class="h-100">
											<th class="w-20">카카오</th>
											<th class="w-80"><c:choose>
													<c:when test="${empty dto.kakao}">비연동</c:when>
													<c:otherwise>연동</c:otherwise>
												</c:choose></th>
										</tr>
										<tr class="h-100">
											<th class="w-20">페이스북</th>
											<th class="w-80"><c:choose>
													<c:when test="${empty dto.facebook}">비연동</c:when>
													<c:otherwise>연동</c:otherwise>
												</c:choose></th>
										</tr>
									</thead>
								</c:forEach>
							</table>
						</div>
					</div>

					<c:if test="${not empty list}">
						<div class="col-12">
							<!-- Pagination -->
							<nav aria-label="navigation">
								<ul class="pagination justify-content-end mt-50">

									<c:if test="${pager.curBlock > 1}">
										<li class="page-item">
										<a class="page-link" href="./list?curPage=${pager.startNum-1}">◀</a></li>
									</c:if>
									<c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
										var="i">
										<c:if test="${pager.curPage eq i}">
											<li class="page-item active">
											<a class="page-link" href="./list?curPage=${i}">${i}</a></li>
										</c:if>
										<c:if test="${pager.curPage ne i}">
											<li class="page-item">
											<a class="page-link" href="./list?curPage=${i}">${i}</a></li>
										</c:if>
									</c:forEach>
									<c:if test="${pager.curBlock<pager.totalBlock}">
										<li class="page-item">
										<a class="page-link" href="./list?curPage=${pager.lastNum+1}">▶</a></li>
									</c:if>
								</ul>
							</nav>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<!-- ##### Main Content Wrapper End ##### -->

	<c:import url="${pageContext.request.contextPath}/layout/footer" />
</body>

</html>