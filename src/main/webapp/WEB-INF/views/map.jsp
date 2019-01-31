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

		<!-- Product categories Area Start -->

		<div class="cart-table-area section-padding-100">
			<div id="map" style="width: 102%; height: 500px;"></div>
			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8416a80649dbb8e8550db5abd37833cd"></script>
			<script type="text/javascript">
				var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
				var options = { //지도를 생성할 때 필요한 기본 옵션
					center : new daum.maps.LatLng(37.569088, 126.984539), //지도의 중심좌표.
					level : 3
				//지도의 레벨(확대, 축소 정도)
				};

				var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴

				// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
				var mapTypeControl = new daum.maps.MapTypeControl();

				// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
				// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
				map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

				// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
				var zoomControl = new daum.maps.ZoomControl();
				map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

				// 마커가 표시될 위치입니다 
				var markerPosition  = new daum.maps.LatLng(37.569088, 126.984539); 

				// 마커를 생성합니다
				var marker = new daum.maps.Marker({
				    position: markerPosition
				});

				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);

				// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
				var iwContent = '<div style="padding:5px;"><a href="http://map.daum.net/link/map/더 조은 it아카데미,33.450701,126.570667">더 조은 it아카데미 </a>', 
				    iwPosition = new daum.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다

				// 인포윈도우를 생성합니다
				var infowindow = new daum.maps.InfoWindow({
				    position : iwPosition, 
				    content : iwContent 
				});
				  
				// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
				infowindow.open(map, marker); 
			</script>
		</div>
	</div>
	<!-- ##### Main Content Wrapper End ##### -->
	<c:import url="${pageContext.request.contextPath}/layout/footer" />
</body>

</html>