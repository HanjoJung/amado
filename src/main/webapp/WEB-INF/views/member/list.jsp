<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<script type="text/javascript">
	$(function() {
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
			if (confirm("선택하신 계정들을 삭제하시겠습니까?")) {
				$(screen).each(function() {
					if ($(this).prop("checked")) {
						$.ajax({
							url : "./delete",
							type : "POST",
							data : {
								id : $(this).attr("data-id")
							}
						})
					}
					location.reload();
				})
			}
		})
	})
</script>

<body>

	<!-- ##### Main Content Wrapper Start ##### -->
	<div class="main-content-wrapper d-flex clearfix">
		<div class="cart-table-area" id="manager-list">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="cart-title mt-50">
							<h2>회원 리스트(${count})</h2>
						</div>

						<div class="cart-table clearfix">
							<table class="table table-striped">
								<thead class="mb-15 pc-table">
									<tr style="height: 100%;">
										<th style="width: 5%;"><input class="check-all-pc"
											type="checkbox"></th>
										<th style="width: 15%;">ID</th>
										<th style="width: 10%">이름</th>
										<th style="width: 12%">연락처</th>
										<th style="width: 23%; max-width: none;">주소</th>
										<th style="width: 13%">가입 날짜</th>
										<th style="width: 11%">카카오</th>
										<th style="width: 11%">페이스북</th>
									</tr>
								</thead>
								<c:forEach items="${list}" var="dto" varStatus="i">
									<thead class="mb-15 pc-table">
										<tr style="height: 100%;">
											<th style="width: 5%;"><input class="check-pc"
												type="checkbox" data-id="${dto.id}"></th>
											<th style="width: 15%; word-break: break-word;">${dto.id}</th>
											<th style="width: 10%; word-break: break-word;">${dto.name}</th>
											<th style="width: 12%; word-break: break-word;">${dto.phone}</th>
											<th style="width: 23%; max-width: none;">${dto.address}</th>
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
											<th class="w-80">${dto.id}<input class="check-m"
												type="checkbox" style="float: right;" data-id="${dto.id}"></th>
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
											<th class="w-80">${dto.address}</th>
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
					<button class="btn amado-btn pc-table del-btn" style="width: 160px;">삭제</button>
					<button class="btn amado-btn mobile-table del-btn">삭제</button>

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

</body>

