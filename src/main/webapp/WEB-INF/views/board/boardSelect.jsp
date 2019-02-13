<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="${pageContext.request.contextPath}/layout/head" />
<body>
	<!-- ##### Main Content Wrapper Start ##### -->
	<div class="main-content-wrapper d-flex clearfix">

		<c:import url="${pageContext.request.contextPath}/layout/header" />

		<div class="cart-table-area" id="manager-list">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="cart-title mt-50">
							<h2>${board}-${dto.title} (${dto.num})</h2>
						</div>

						<div class="cart-table clearfix">
							<table class="table table-striped">
								<thead class="mb-15 pc-table">
									<tr style="height: 100%;">
										<td style="width: 100%;">${dto.writer}</td>
										<td style="position: absolute; right: 140px;">${dto.reg_date}</td>
										<td
											style="float: left; min-width: 130px; position: absolute; right: 15px;">
											조회수 : ${dto.hit}</td>
									</tr>
									<tr style="height: 100%; max-width: 100%;">
										<th style="width: 100%; max-width: 100%">${dto.contents}</th>
									</tr>
								</thead>
								<thead class="mb-15 mobile-table">
									<tr class="h-100">
										<th class="w-100">${dto.writer}<input class="check-m"
											type="checkbox" style="float: right;" data-id="${dto.num}"></th>
									</tr>
									<tr class="h-100">
										<th class="w-30">작성날짜</th>
										<th class="w-70">${dto.reg_date}</th>
									</tr>
									<tr class="h-100">
										<th class="w-30">조회수</th>
										<th class="w-70">${dto.hit}</th>
									</tr>
									<tr class="h-100">
										<th style="width: 100%; max-width: 100%;">${dto.contents}</th>
									</tr>
								</thead>
							</table>
						</div>
						<a class="btn amado-btn mb-15 fr" href="./${board}List">글목록</a>
						<c:if test="${board ne 'notice'}">
							<a class="btn amado-btn mb-15 fr"
								href="./${board}Reply?num=${dto.num}">답글쓰기</a>
						</c:if>
						<c:if test="${member.id eq dto.writer}">
							<a class="btn amado-btn mb-15 fr"
								href="./${board}Update?num=${dto.num}&writer=${dto.writer}">수정</a>
							<span class="btn amado-btn mb-15 fr" id="del">삭제</span>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ##### Main Content Wrapper End ##### -->

	<c:import url="${pageContext.request.contextPath}/layout/footer" />
</body>
<script type="text/javascript">
	var temp = '${dto.contents}';
	var curFiles = new Array();
	
	while(temp.indexOf('src="../resources/notice/') > 0){
		var first = temp.indexOf('src="../resources/notice/')+25;
		var last = temp.indexOf('&#13;&#10;');
		var middel = temp.substring(first, last);
		curFiles.push(middel);
		temp = temp.replace('src="../resources/notice/' + middel + '&#13;&#10;', "");
	}
	
	function checkFile() {
		$.each(curFiles, function(index, item) {
			$.ajax({
				url : "file/delete",
				type : "POST",
				data : {
					fname : item
				}
			});
		})
	}

	$("#del").click(function() {
		$.ajax({
			url : "./${board}Delete",
			type : "POST",
			data : {
				num : "${dto.num}",
				writer : "${dto.writer}"
			},
			success : function(result) {
				if (result > 0) {
					checkFile();
					alert("삭제하였습니다.");
					location.href = "./${board}List";
				} else {
					alert("삭제하지 못하였습니다.");
				}
			},
			error : function(err) {
				alert(arr);
			}
		});
	});
</script>
</html>