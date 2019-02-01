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

			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="checkout_details_area mt-50 clearfix">

							<div class="cart-title">
								<h2>로그인</h2>
							</div>

							<form class="frm-login" id="rsa-frm" action="./login" method="post">
								<input type="hidden" id="rsaPublicKeyModulus" value="${publicKeyModulus}"> 
								<input type="hidden" id="rsaPublicKeyExponent" value="${publicKeyExponent}">
                                <input type="hidden" name="password" id="securedPassword">
								<div class="row">
									<div class="col-12 mb-3">
										<input type="text" class="form-control login-form-control" id="login-id"
											name="id" placeholder="이메일(ID)"
											data-parsley-message="이메일 형태로 입력해주세요."
											data-parsley-pattern="^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$"
											value="${param.id}">
										<p class="message"></p>
									</div>
									<div class="col-12 mb-3">
										<input type="password" class="form-control login-form-control"
											id="password" placeholder="비밀번호" data-form="login-password"
											data-parsley-message="영문/숫자/특수문자 조합 8~16자 조합으로 입력해주세요."
											data-parsley-pattern="^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{8,16}$">
										<p class="message"></p>
									</div>
								</div>
								<input type="hidden" id="login-kakao" name="kakao" value="${param.kakao}">
								<input type="hidden" id="login-facebook" name="facebook" value="${param.facebook}">
								<div class="login">
									<button type="button" class="btn amado-btn form-login-btn col-12 mb-15">로그인</button>
									<c:if test="${empty param.kakao and empty param.facebook}">
										<button type="button" class="btn kakao-btn col-12 mb-15">
										<img class="kakao-img" src="${pageContext.request.contextPath}/resources/img/core-img/kakao.jpg">
										카카오로 로그인</button>
										<button type="button" class="btn facebook-btn col-12 mb-15">
										<img class="facebook-img" src="${pageContext.request.contextPath}/resources/img/core-img/facebook.png">
										페이스북으로 로그인</button>
									</c:if>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	<!-- ##### Main Content Wrapper End ##### -->
</body>	
    <script src="${pageContext.request.contextPath}/resources/js/frmCheck.js"></script>
<script type="text/javascript">
//kakao
$(".kakao-btn").click(loginWithKakao)
// 사용할 앱의 JavaScript 키를 설정해 주세요.
Kakao.init('8416a80649dbb8e8550db5abd37833cd');
function loginWithKakao() {
	// 로그인 창을 띄웁니다.
	Kakao.Auth.login({
		success : function(authObj) {
			Kakao.API.request({
				url : '/v2/user/me',
				success : function(res) {
					var userID = res.id; // 유저의 카카오톡 고유 id
					if (res.kakao_account.has_email) {
						var userEmail = res.kakao_account.email; // 유저의 이메일
					}
					var userName = res.properties.nickname; // 유저가 등록한 별명

					snsLogin(userEmail, userID, userName, "kakao");
				},
				fail : function(error) {
					alert("사용자 정보를 불러들이는데 실패하였습니다");
					console.log(error);
				}
			});
		},
		fail : function(err) {
			alert("로그인에 실패하였습니다");
		}
	});
};

// facebook
window.fbAsyncInit = function() {
	FB.init({
		appId : '258476371506098',
		xfbml : true,
		version : 'v3.2'
	});
	FB.AppEvents.logPageView();
};

(function(d, s, id) {
	var js, fjs = d.getElementsByTagName(s)[0];
	if (d.getElementById(id)) {
		return;
	}
	js = d.createElement(s);
	js.id = id;
	js.src = "https://connect.facebook.net/ko_KR/sdk.js";
	fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

$(function() {
	$(".facebook-btn").click(function facebookLogin() {
		FB.login(function(response) {
		}, {
			scope : 'email',
			auth_type : 'rerequest'
		});
			FB.getLoginStatus(function(response) {
			FB.api("/me?fields=id,name,email", function(response) {
				if (response && !response.error) {
					snsLogin(response.email, response.id, response.name, "facebook");
				}
			});
		});
	})
})

// 소셜로그인
function snsLogin(id, snsid, name, sns) {
	if (sns == "kakao") {
		params = {
			id : id,
			name : name,
			kakao : snsid
		}
	} else if (sns == "facebook") {
		params = {
			id : id,
			name : name,
			facebook : snsid
		}
	}
	
	$.ajax({
		url : "${pageContext.request.contextPath}/member/login",
		type : "POST",
		data : params,
		success : function(data) {
			alert(data);
			location.reload();
		},
		error : function() {
			$.ajax({
				url : "${pageContext.request.contextPath}/member/checkId",
				type : "POST",
				data : {
					id : id
				},
				success : function(data) {
					data = data.trim();
					if (data.length > 0) {
						alert("같은 아이디가 존제합니다.\n로그인하시면 자동으로 연동됩니다.");
						location.href = "${pageContext.request.contextPath}/member/login?"
								+ sns + "=" + snsid + "&id=" + id; 
					} else {
						if (confirm("연동된 계정이 없습니다.\n가입하시겠습니까?")) {
							location.href = "${pageContext.request.contextPath}/member/join?"
								+ sns + "=" + snsid
								+ "&id=" + id
								+ "&name=" + name;
						}
					}
				},
				error : function(error) {
					alert("Error가 발생했습니다.");
					console.log(error);
				}
			});
		}
	})
}
</script>

</html>