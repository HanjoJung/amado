$(function() {
// 폼 공동 체크	
	function check(data, comparison, message) {
		if(comparison){
			data.next(".message").css({display : "none"});	
			data.next(".message").attr("class", "message");
			return false;
		}else{
			data.next(".message").css({display : "block"});
			data.next(".message").attr("class", "message focus");
			data.next(".message").text(message);
			return true;
		}
	};
// id 중복체크
	resultCheckId = true;
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
// 패턴 체크
	function checkPattern(data) {
		pat = (RegExp)(data.attr("data-parsley-pattern"));
		text = data.val();
		return check(data, pat.test(text), data.attr("data-parsley-message"));
	};

	function checkNull(data) {
		return check(data, data.val().length > 0, "필수 입력사항입니다");
	};
	
	function checkPassword() {
		data = $("#password2");
		return check(data, data.val() == $("#password1").val(), "비밀번호가 일치하지 않습니다");
	};
// 약관동의 체크박스
	function checkClause() {
		clause1 = $("#customCheck1");
		clause2 = $("#customCheck2");
		data = $(".custom-checkbox:last");
		return check(data, clause1.prop("checked") && clause2.prop("checked"), "약관에 동의해주세요");
	}
	
// 모든체크여부 확인 후 일반폼 submit()
	function submitForm() {
		var checkForm = true;
		$(".form-control").each(function() {
			if(checkNull($(this))){
				checkForm = false;
			}else if(checkPattern($(this))){
				checkForm = false;
			}
		})
		if(checkPassword()){
			checkForm = false;
		}
		if($(".frm").attr("id") == "join" && checkForm){
			if(checkClause() || resultCheckId){
				checkForm = false;
				checkId();
			}
		}
		if(checkForm){
			$(".frm").submit();
		}else{
			$(".focus:first").prev().focus();
		}
	}
	
	$(".form-btn").click(function() {
		submitForm();
	});
	
// 로그인 폼 체크 후 submit()
	function login() {
		$.ajax({
			url : "./login",
			type : "POST",
			data : {
				id : $("#login-id").val(),
				password : $("#login-password").val()
			},
			success : function(data) {
				alert(data);
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
	$(".form-login-btn").click(function() {

		var checkForm = true;
		$(".form-control").each(function() {
			if(checkNull($(this))){
				checkForm = false;
			}else if(checkPattern($(this))){
				checkForm = false;
			}
		})
		if(checkForm){
			login();
		}
	})
// 폼에서 엔터키 누르면 실행
	$('.form-control').keyup(function(e){
		if(e.keyCode == 13){
			if($(this).attr("id") == $(".form-control:last").attr("id")){
				if($(this).attr("id") != "login-password"){
					submitForm();
				}else{
					login();
				}
			}else{
				$(this).parent().next().find(".form-control").focus();
			}
		}
	});
//	폼 값변동시 체크
	$(".form-control").change(function() {
		if($(this).attr("id") == "id"){
				checkId();
		}
		checkNull($(this));
		checkPattern($(this));
	});

})