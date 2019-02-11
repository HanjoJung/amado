$(function() {
	function fn_GetContextRoot() {
		var offset=location.href.indexOf(location.host)+location.host.length;
		var UniPath=location.href.substring(offset,location.href.indexOf('/',offset+1));
		return UniPath;
	};

	// password를 암호화하기 위해 데이터를 불러들임
	if(!!document.getElementById("rsaPublicKeyModulus")){
		var rsaPublicKeyModulus = document.getElementById("rsaPublicKeyModulus").value;
		var rsaPublicKeyExponent = document.getElementById("rsaPublicKeyExponent").value;
	}

	//암호화
	function submitEncryptedForm(password, rsaPublicKeyModulus, rsaPublicKeyExponent) {
	    var rsa = new RSAKey();
	    rsa.setPublic(rsaPublicKeyModulus, rsaPublicKeyExponent);

	    // 사용자ID와 비밀번호를 RSA로 암호화한다.
	    var securedPassword = rsa.encrypt(password);

	    // POST 폼에 값을 설정
	    $("#securedPassword").val(securedPassword);
	}
	
// 피드백 메세지
	function check(data, comparison, message) {
		if(comparison){
			data.next(".message").css({display : "none"});	
			data.next(".message").attr("class", "message");
			return true;
		}else{
			data.next(".message").css({display : "block"});
			data.next(".message").attr("class", "message focus");
			data.next(".message").text(message);
			return false;
		}
	};
// id 중복검사
	resultCheckId = false;
	function checkId() {
		data = $("#id");
		$.ajax({
			url : "./checkId",
			data : {
				id : data.val() 
			},
			success : function(result) {
				result = result.trim();
				resultCheckId = check(data, result.length == 0, result);
			}
		})
	};

// 패턴 검사
	function checkPattern(data) {
		pat = (RegExp)(data.attr("data-parsley-pattern"));
		text = data.val();
		return check(data, pat.test(text), data.attr("data-parsley-message"));
	};

// null 검사
	function checkNull(data) {
		return check(data, data.val().length > 0, "필수 입력사항입니다");
	};

// 비밀번호 일치여부 검사
	function checkPassword() {
		data = $("#password");
		return check(data, data.val() == $("#password1").val(), "비밀번호가 일치하지 않습니다");
	};
	
// 약관동의 체크박스
	function checkClause() {
		clause1 = $("#customCheck1");
		clause2 = $("#customCheck2");
		data = $(".custom-checkbox:last");
		return check(data, clause1.prop("checked") && clause2.prop("checked"), "약관에 동의해주세요");
	}
	
// 가입 폼 검사 후 submit()
	function submitJoinForm() {
		var checkForm = true;
		$(".form-control").each(function() {
			if(!checkNull($(this))){
				checkForm = false;
			}else if(!checkPattern($(this))){
				checkForm = false;
			}
		})
		if(!checkPassword()){
			checkForm = false;
		}
		if($(".frm").attr("data-form") == "join" && checkForm){
			if(!checkClause() || !resultCheckId){
				checkForm = false;
				checkId();
			}
		}
		if(checkForm){
		    var password = document.getElementById("password").value;
			submitEncryptedForm(password, rsaPublicKeyModulus, rsaPublicKeyExponent);
			$(".frm").submit();
		}else{
			$(".focus:first").prev().focus();
		}
	}
	
	$(".form-btn").click(submitJoinForm);
	
// 로그인 폼 검사 후 세션활성화
	function login() {
		$.ajax({
			url : fn_GetContextRoot() + "/member/login",
			type : "POST",
			data : {
				id : $("#login-id").val(),
				password : $("#securedPassword").val(),
				kakao : $("#login-kakao").val(),
				facebook : $("#login-facebook").val()
			},
			success : function(result) {
				alert(result);
				location.reload();
			},
			error : function() {
				$(".message:last").css({
					display : "block"
				});
				$(".message:last").text("아이디 혹은 비밀번호가 맞지 않습니다");
				$(".form-control:last").focus();
			}
		})
	}
	
	function checkLoginForm() {
		var checkForm = true;
		$(".login-form-control").each(function() {
			if(!checkNull($(this))){
				checkForm = false;
			}
		})
		if(checkForm){
		    var password = document.getElementById("password").value;
			submitEncryptedForm(password, rsaPublicKeyModulus, rsaPublicKeyExponent);
			login();
		}
	}
	
	$(".form-login-btn").click(checkLoginForm);
	
// 패스워드 폼 검사 후 수정, 탈퇴
function checkPasswordFrom() {
	action = $("#action").val();

    var password = document.getElementById("curPassword").value;
	submitEncryptedForm(password, rsaPublicKeyModulus, rsaPublicKeyExponent);
	$.ajax({
		url : "./password",
		type : "POST",
		data : {
			id : $("#id").val(),
			password : $("#securedPassword").val()
		},
		success : function(result) {
			rsaPublicKeyModulus = result.publicKeyModulus.toString();
			rsaPublicKeyExponent = result.publicKeyExponent.toString();
			checkResult = check($("#curPassword"), result.result != 0, "비밀번호가 맞지 않습니다.");
			if(checkResult){
				if(checkPassword()){
					if(action == 'password'){
					    var password = $("#password").val();
						submitEncryptedForm(password, rsaPublicKeyModulus, rsaPublicKeyExponent);
						ajax = {
								url : "./update",
								type : "POST",
								data : {
									id : $("#id").val(),
									password : $("#securedPassword").val()
								},
								success : function(result) {
									alert("비밀번호가 " + result)
									location.reload();
								}
						}
					} else if(action == 'update'){
						ajax = {
								url : "./update",
								type : "POST",
								data : {
									id : $("#id").val(),
									name : $("#name").val(),
									phone : $("#phone").val(),
									address : $("#address").val()
								},
								success : function(result) {
									alert("회원정보가 " + result)
									location.reload();
								}
						}
					} else if(action == 'delete'){
						ajax = {
								url : "./delete",
								type : "POST",
								data : {
									id : $("#id").val()
								},
								success : function(result) {
									alert(result)
									location.href="/amado/";
								}
						}
					} 
					
					$.ajax(ajax);
				}
			}
		}
	})
}
	function infoUpdate() {
		checkForm = true;
		$(".password-form-control").each(function() {
			if(!checkNull($(this))){
				checkForm = false;
			}else if(!checkPattern($(this))){
				checkForm = false;
			}
		})
		if(checkForm){
			checkPasswordFrom();
		}
	}
	
$(".myInfo-btn").click(infoUpdate);

$(".form-btn-update").click(function infoUpdate() {
	checkForm = true;
	$(".form-control").each(function() {
		if(!checkNull($(this))){
			checkForm = false;
		}else if(!checkPattern($(this))){
			checkForm = false;
		}
	})
	if(checkForm){
		$.ajax({
			url : "./update",
			type : "POST",
			data : {
				id : $("#id").val(),
				name : $("#name").val(),
				phone : $("#phone").val(),
				address : $("#address").val()
			},
			success : function(date) {
				alert(data);
				location.reload();
			}
		})
	}
});


// 상품 추가
$(".porduct-insert-form-btn").click(porductForm);
function porductForm() {
	checkForm = true;
	$(".porduct-insert-form").each(function() {
		if(!checkNull($(this))){
			checkForm = false;
		}
	})
	if(checkForm){
		$(".frm").submit();
	}
}

// 폼에서 엔터키 누르면 실행
	$('.form-control').keyup(function(e){
		if(e.keyCode == 13){
			if($(this).attr("id") == $(".form-control:last").attr("id")){
				if($(this).attr("data-form") == "join"){
					submitJoinForm();
				}else if($(this).attr("data-form") == "login-password"){
					checkLoginForm();
				}else if($(this).attr("data-form") == "reword-password"){
					infoUpdate();
				}
			}else{
				$(this).parent().next().find(".form-control").focus();
			}
		}
	});

//	폼 값변동시 검사
	$(".form-control").change(function() {
		if($(this).attr("id") == "id"){
				checkId();
		}
		checkNull($(this));
		checkPattern($(this));
	});

})