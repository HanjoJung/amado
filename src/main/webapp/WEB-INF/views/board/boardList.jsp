<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var msg = '${param.msg}';
	if(msg != ''){
		alert(msg);
	}
</script>
</head>
<body>
	<h1>${board} List</h1>
	
	<table>
		<tr>
			<td>NUM</td><td>TITLE</td><td>WRITER</td><td>DATE</td><td>HIT</td>
		</tr>
		<c:forEach items="${list}" var="dto">
		<tr>
			<td>${dto.num}</td>
			<td><a href="${board}Select?num=${dto.num}">
			<c:catch>
				<c:forEach begin="1" end="${dto.depth}" >--</c:forEach>
			</c:catch>			
			${dto.title}
			</a></td>
			<td>${dto.writer}</td>
			<td>${dto.reg_date}</td>
			<td>${dto.hit}</td>
		</tr>		
		</c:forEach>
	</table>
	<c:if test="${pager.curBlock>1}">
		<a href="./${board}List?curPage=${pager.startNum-1}">[이전]</a>
	</c:if>
	<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
		<a href="./${board}List?curPage=${i}">${i}</a>
	</c:forEach>
	<c:if test="${pager.curBlock<pager.totalBlock}">
		<a href="./${board}List?curPage=${pager.lastNum+1}">[다음]</a>
	</c:if>
	<a href="../">HOME</a>
	<a href="./${board}Write">Write</a>
</body>
</html>