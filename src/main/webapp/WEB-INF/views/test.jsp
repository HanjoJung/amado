<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="${pageContext.request.contextPath}/layout/head" />
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/rsa/jsbn.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/rsa/rsa.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/rsa/prng4.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/rsa/rng.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/rsa/login.js"></script>
</head>
<body>
	<div>
		<label for="username">사용자ID : <input type="text" id="username" size="16" /></label> 
		<label for="password">비밀번호 : <input type="password" id="password" size="16" /></label> 
		<input type="text" id="rsaPublicKeyModulus" value="${publicKeyModulus}" /> 
		<input type="text" id="rsaPublicKeyExponent" value="${publicKeyExponent}" />
		<a href="<%=request.getContextPath()%>/loginFailure.jsp"
			onclick="validateEncryptedForm(); return false;">로그인</a>
	</div>
	<form id="securedLoginForm" name="securedLoginForm"
		action="<%=request.getContextPath()%>/test" method="post" style="display: none;">
		<input type="text" name="securedUsername" id="securedUsername"/> 
		<input type="text" name="securedPassword" id="securedPassword"/>
	</form>
</body>
</html>
