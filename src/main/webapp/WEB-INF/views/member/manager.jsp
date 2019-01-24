<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<c:import url="${pageContext.request.contextPath}/layout/head" />
</head>

<script type="text/javascript">
$(function() {
	url = "";
	reload = "${param.reload}";
	if(reload != ""){
		url = "${pageContext.request.contextPath}/" + reload + "/list";
		listLoad(1);
	}
	$(".list-view-btn").click(function() { 
		url = "${pageContext.request.contextPath}/" + $(this).attr("data-list") + "/list";
		listLoad(1);
	})
	function listLoad(dataCurPage) {
		$.ajax({
			url : url,
			data : {
				curPage : dataCurPage
			},
			success : function(result) {
				$(".list-area").html(result);
			}
		})
	}
	
	$(".list-area").on("click",".page-link", function() {
		dataCurPage = $(this).attr("data-curPage");
		listLoad(dataCurPage);
		$('body,html').animate({ scrollTop: 0 }, 0);
	});
})
</script>
<body>
	<!-- ##### Main Content Wrapper Start ##### -->
	<div class="main-content-wrapper d-flex clearfix">
		<c:import url="${pageContext.request.contextPath}/layout/header" />
		<div class="amado_manager_area section-padding-100">
			<div class="container-fluid">
				<div class="mt-50 clearfix">
					<div>
						<h2>관리자 페이지</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-12 col-sm-6 col-md-12 col-xl-6 mb-15">
						<button type="button" class="btn amado-btn list-view-btn"
							data-list="member">회원리스트</button>
					</div>
					<div class="col-12 col-sm-6 col-md-12 col-xl-6 mb-15">
						<button type="button" class="btn amado-btn list-view-btn"
							data-list="product">상품리스트</button>
					</div>
				</div>
				<div class="row">
					<div class="list-area" style="width: 100%"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- ##### Main Content Wrapper End ##### -->


	<c:import url="${pageContext.request.contextPath}/layout/footer" />
</body>
</html>