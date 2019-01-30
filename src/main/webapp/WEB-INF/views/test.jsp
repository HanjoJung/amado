<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="${pageContext.request.contextPath}/layout/head" />
<script type="text/javascript">
window.onbeforeunload = function (e) {

    e = e || window.event;

    // For IE and Firefox 
    if (e) {
        e.returnValue = 'IE?';
    }

    // For Chrome..........
    return '크롬?';
};
</script>
</head>
<body >
	<table>
		<tr>
			<td bgcolor="F4ECF3">
				<div onClick="alert('그래');">이거?</div>
			</td>
		</tr>
	</table>
</body>
<c:import url="${pageContext.request.contextPath}/layout/footer" />
</body>
</html>
