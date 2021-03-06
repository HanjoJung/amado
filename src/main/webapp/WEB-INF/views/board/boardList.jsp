<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="${pageContext.request.contextPath}/layout/head" />
</head>
<body>
	<!-- ##### Main Content Wrapper Start ##### -->
	<div class="main-content-wrapper d-flex clearfix">

		<c:import url="${pageContext.request.contextPath}/layout/header" />

		<div class="cart-table-area" id="manager-list">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="cart-title mt-50">
							<h2>${board}게시판</h2>
						</div>

						<div class="board-table clearfix">
							<table class="table table-striped">
								<thead class="mb-15 pc-table">
									<tr style="height: 100%;">
										<th class="col-lg-1 col-xl-1"><input class="check-all-pc" type="checkbox"></th>
										<th class="col-lg-2 col-xl-1">글번호</th>
										<th class="col-lg-3 col-xl-5">제목</th>
										<th class="col-lg-2 col-xl-2">작성자</th>
										<th class="col-lg-2 col-xl-2">작성날짜</th>
										<th class="col-lg-2 col-xl-1">조회수</th>
									</tr>
								</thead>
								<c:forEach items="${list}" var="dto" varStatus="i">
									<thead class="mb-15 pc-table">
										<tr style="height: 100%;">
											<th class="col-lg-1 col-xl-1">
												<input class="check-pc" type="checkbox" data-num="${dto.num}">
											</th>
											<th class="col-lg-2 col-xl-1">${dto.num}</th>
											<th class="col-lg-3 col-xl-5" style="word-break: break-word;"><a
												href="./${board}Select?num=${dto.num}">
												<c:if test="${board ne 'notice'}">
													<c:forEach begin="1" end="${dto.depth}">
														<img src="${pageContext.request.contextPath}/resources/img/core-img/reply.png">
													</c:forEach>
												</c:if>
												${dto.title}</a></th>
											<th class="col-lg-2 col-xl-2" style="word-break: break-word;">${dto.writer}</th>
											<th class="col-lg-2 col-xl-2">${dto.reg_date}</th>
											<th class="col-lg-2 col-xl-1">${dto.hit}</th>
										</tr>
									</thead>
									<thead class="mb-15 mobile-table">
										<tr class="h-100">
											<th class="w-30">글번호</th>
											<th class="w-70">${dto.num}<input class="check-m"
												type="checkbox" style="float: right;" data-num="${dto.num}"></th>
										</tr>
										<tr class="h-100">
											<th class="w-30">제목</th>
											<th class="w-70"><a
												href="./${board}select?num=${dto.num}">${dto.title}</a></th>
										</tr>
										<tr class="h-100">
											<th class="w-30">작성자</th>
											<th class="w-70">${dto.writer}</th>
										</tr>
										<tr class="h-100">
											<th class="w-30">작성날짜</th>
											<th class="w-70">${dto.reg_date}</th>
										</tr>
										<tr class="h-100">
											<th class="w-30">조회수</th>
											<th class="w-70">${dto.hit}</th>
										</tr>
									</thead>
								</c:forEach>
							</table>
						</div>
						<a class="btn amado-btn mb-15" href="./${board}Write">글쓰기</a>
						<c:if test="${member.name eq 'manager'}">
							<button class="btn amado-btn pc-table del-btn mb-15"
								style="width: 160px;">삭제</button>
							<button class="btn amado-btn mobile-table del-btn mb-15">삭제</button>
						</c:if>
					</div>

					<c:if test="${not empty list}">
						<div class="col-12">
							<!-- Pagination -->
							<nav aria-label="navigation">
								<ul class="pagination justify-content-end mt-50">
									<c:if test="${pager.curBlock > 1}">
										<li class="page-item">
											<a class="page-link" 
											href="./${board}List?curPage=${pager.startNum-1}">◀</a>
										</li>
									</c:if>
									<c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
										var="i">
										<c:if test="${pager.curPage eq i}">
											<li class="page-item active">
												<a class="page-link" 
												href="./${board}List?curPage=${i}">${i}</a>
											</li>
										</c:if>
										<c:if test="${pager.curPage ne i}">
											<li class="page-item">
												<a class="page-link" 
												href="./${board}List?curPage=${i}">${i}</a>
											</li>
										</c:if>
									</c:forEach>
									<c:if test="${pager.curBlock<pager.totalBlock}">
										<li class="page-item">
											<a class="page-link" 
											href="./${board}List?curPage=${pager.lastNum+1}">▶</a>
										</li>
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

<script type="text/javascript">
	$(function() {

		/* 
		var email = $(this).attr("data-writer");
		var userId = email.substring(0, email.indexOf("@"));
		var blind = "*";
		for(i = 4; i < userId.length; i++){
			blind += "*";
		}
		var domain = email.substring(email.indexOf("@"), email.length);
		$(this).children().text(email.substring(0, 3) + blind + domain); */
		
		
		$(".check-all-pc").click(function() {
			$(".check-pc").each(function() {
				$(this).prop("checked", $(".check-all-pc").prop("checked"));
			})
		})
		$(".check-pc").click(function() {
			$(".check-pc").each(function() {
				$(".check-all-pc").prop("checked", $(this).prop("checked"));
				return $(this).prop("checked");
			})
		})

		$(".del-btn").click(function() {
			var screen = "";
			if($(this).attr("class").search("pc") != -1){
				screen = ".check-pc";
			} else if ($(this).attr("class").search("mobile") != -1) {
				screen = ".check-m";
			}
			if (confirm("선택하신 게시글들을 삭제하시겠습니까?")) {
				$(screen).each(function() {
					if ($(this).prop("checked")) {
						$.ajax({
							url : "./${board}Delete",
							type : "POST",
							data : {
								num : $(this).attr("data-num"),
								writer : "${member.id}"
							}
						})
					}
					location.reload();
				})
			}
		})
	})
</script>
</html>