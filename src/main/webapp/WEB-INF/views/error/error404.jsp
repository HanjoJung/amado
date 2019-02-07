<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="${pageContext.request.contextPath}/layout/head"/>
</head>
<body>
	<div class="contens_wrap">
		<div class="layerwrap" id="shutdown_layer">
			<div class="logo">amado</div>
			<p class="tit">서비스 이용에 불편을 드려서 죄송합니다.</p>
			<div class="contens">
				<p>(404-NOT FOUND)</p>
				<p>현재 서비스에 일시적인 오류가 발생했습니다.</p>
				<p>요청하신 모듈을 찾을 수 없습니다. 사이트 관리자에게 모듈 점검 요청 바랍니다.</p>
				<p>이용에 불편을 드린 점 진심으로 사과 드리며, 고객 여러분의 양해 부탁 드립니다.</p>
			</div>
			<footer>
				<ul class="contect" style="margin-top: -15px">
					<li>관련문의사항은 고객센터에 문의해주시면 친절히 안내해드리겠습니다.</li>
					<li>고객상담전화 : 010-????-????</li>
					<li style="margin-top: 10px"><a href="/amado" class="btn">홈페이지</a>
					</li>
				</ul>
			</footer>
		</div>
	</div>
</body>
</html>