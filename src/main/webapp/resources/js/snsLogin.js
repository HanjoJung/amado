// kakao
$(".kakao-btn").click(loginWithKakao)
// 사용할 앱의 JavaScript 키를 설정해 주세요.
function loginWithKakao() {
	Kakao.init('8416a80649dbb8e8550db5abd37833cd');
	// 로그인 창을 띄웁니다.
	Kakao.Auth.login({
		success : function(authObj) {
			console.log(JSON.stringify(authObj));
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
			console.log(JSON.stringify(err));
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
					console.log(response);
					console.log(response.id);
					console.log(response.name);
					console.log(response.email);
					snsLogin(response.email, response.id, response.name, "facebook");
				}
			});
		});
	})
})

// 소셜로그인
function snsLogin(id, snsid, name, sns) {
	console.log("s : " + id);
	console.log("s : " + snsid);
	console.log("s : " + name);
	console.log("s : " + sns);
	var params = {
		url : "${pageContext.request.contextPath}/member/checkId",
		type : "POST",
		success : function(data) {
			data = data.trim();
			if (data.length > 0) {
				$.ajax({
					url : "${pageContext.request.contextPath}/member/login",
					type : "POST",
					data : {
						id : id,
						name : name,
						kakao : snsid
					},
					success : function(data) {
						alert(data);
					}
				})
			} else {
				if (confirm("연동된 계정이 없습니다.\n새로 가입하시겠습니까?")) {
					url = "${pageContext.request.contextPath}/member/join?"
							+ "id=" + id + "&name=" + name + "&kakao=" + snsid;
					location.href = url;
				}
			}
		},
		error : function() {
			console.log("error 발생");
		}
	};
	if (sns == "kakao") {
		params.data = {
			id : id,
			kakao : snsid
		}
	} else if (sns == "facebook") {
		params.data = {
			id : id,
			facebook : snsid
		}
	}
	$.ajax(params);
}