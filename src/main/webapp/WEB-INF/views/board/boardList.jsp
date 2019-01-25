<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<c:import url="${pageContext.request.contextPath}/layout/head" />
</head>
<body>
	<!-- ##### Main Content Wrapper Start ##### -->
	<div class="main-content-wrapper d-flex clearfix">

    <c:import url="${pageContext.request.contextPath}/layout/header"/>
	
		<div class="cart-table-area" id="manager-list">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="cart-title mt-50">
							<h2>${board} 게시판</h2>
						</div>

						<div class="cart-table clearfix">
							<table class="table table-striped">
								<thead class="mb-15 pc-table">
									<tr style="height: 100%;">
										<th style="width: 5%;"><input class="check-all-pc" type="checkbox"></th>
										<th style="width: 10%;">글번호</th>
										<th style="width: 45%;">제목</th>
										<th style="width: 20%;">작성자</th>
										<th style="width: 15%;">작성날짜</th>
										<th style="width: 10%;">조회수</th>
									</tr>
								</thead>
								<c:forEach items="${list}" var="board" varStatus="i">
									<thead class="mb-15 pc-table">
										<tr style="height: 100%;">
											<th style="width: 5%;"><input class="check-pc" type="checkbox"></th>
											<th style="width: 10%;">${board.num}</th>
											<th style="width: 45%;">${board.title}</th>
											<th style="width: 20%;">${board.writer}</th>
											<th style="width: 15%;">${board.reg_date}</th>
											<th style="width: 10%;">${board.hit}</th>
										</tr>
									</thead>
									<thead class="mb-15 mobile-table">
										<tr class="h-100">
											<th class="w-20">글번호</th>
											<th class="w-80">${board.num}<input class="check-m"
												type="checkbox" style="float: right;" data-id="${dto.id}"></th>
										</tr>
										<tr class="h-100">
											<th class="w-20">제목</th>
											<th class="w-80">${board.num}</th>
										</tr>
										<tr class="h-100">
											<th class="w-20">작성자</th>
											<th class="w-80">${board.num}</th>
										</tr>
										<tr class="h-100">
											<th class="w-20">작성날짜</th>
											<th class="w-80">${board.num}</th>
										</tr>
										<tr class="h-100">
											<th class="w-20">조회수</th>
											<th class="w-80">${board.num}</th>
										</tr>
									</thead>
								</c:forEach>
							</table>
						</div>
					</div>
					<a class="btn amado-btn" href="./${board}Write">글쓰기</a>
					<c:if test="${member.name eq 'manager'}">
						<button class="btn amado-btn pc-table del-btn" style="width: 160px;">삭제</button>
						<button class="btn amado-btn mobile-table del-btn">삭제</button>
					</c:if>

					<c:if test="${not empty list}">
						<div class="col-12">
							<!-- Pagination -->
							<nav aria-label="navigation">
								<ul class="pagination justify-content-end mt-50">
									<c:if test="${pager.curBlock > 1}">
										<li class="page-item"><a class="page-link"
											data-curPage="${pager.startNum-1}">◀</a></li>
									</c:if>
									<c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
										var="i">
										<c:if test="${pager.curPage eq i}">
											<li class="page-item active"><a class="page-link"
												data-curPage="${i}">${i}</a></li>
										</c:if>
										<c:if test="${pager.curPage ne i}">
											<li class="page-item"><a class="page-link"
												data-curPage="${i}">${i}</a></li>
										</c:if>
									</c:forEach>
									<c:if test="${pager.curBlock<pager.totalBlock}">
										<li class="page-item"><a class="page-link"
											data-curPage="${pager.lastNum+1}">▶</a></li>
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

	<c:import url="${pageContext.request.contextPath}/layout/footer"/>
</body>
</html>