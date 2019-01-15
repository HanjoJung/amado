<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<c:import url="${pageContext.request.contextPath}/layout/head"/>
<script type="text/javascript">
$(function() {
	
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
	
	resultId = true;
	function checkId() {
		data = $("#id");
		$.ajax({
			url : "./checkId",
			data : {
				id : data.val() 
			},
			success : function(result) {
				result = result.trim();
				resultId = check(data, result.length == 0, result);
			}
		})
	};
	
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

	function checkClause() {
		clause1 = $("#customCheck1");
		clause2 = $("#customCheck2");
		data = $(".custom-checkbox:last");
		return check(data, clause1.prop("checked") && clause2.prop("checked"), "약관에 동의해주세요");
	}
	
	function submitForm() {
		var checkForm = true;
		$(".form-control").each(function() {
			if(checkNull($(this))){
				checkForm = false;
			}else if(checkPattern($(this))){
				checkForm = false;
			}
		})
		if(checkForm){
			if(checkPassword() || checkClause() || resultId){
				checkForm = false;
				checkId();
			}
		}
		if(checkForm){
			$(".join-form").submit();
		}else{
			$(".focus:first").prev().focus();
		}
	}
	
	$(".form-btn").click(function() {
		submitForm();
	});

	$('.form-control').keyup(function(e){
		if(e.keyCode == 13){
			if($(this).attr("id") == $(".form-control:last").attr("id")){
				submitForm();
			}else{
				$(this).parent().next().find(".form-control").focus();
			}
		}
	});
	
	$(".form-control").change(function() {
		if($(this).attr("id") == $(".form-control:first").attr("id")){
			checkId();
		}
		checkNull($(this));
		checkPattern($(this));
	});

})

</script>
</head>

<body>

    <!-- ##### Main Content Wrapper Start ##### -->
    <div class="main-content-wrapper d-flex clearfix">

    <c:import url="${pageContext.request.contextPath}/layout/header"/>

        <div class="cart-table-area section-padding-100">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="checkout_details_area mt-50 clearfix">

                            <div class="cart-title">
                                <h2>회원가입</h2>
                            </div>

                            <form class="join-form" action="./join" method="post" >
                                <div class="row">
                                    <div class="col-12 mb-3">
                                        <input type="email" class="form-control" 
                                        id="id" name="id" placeholder="이메일(ID)"
										data-parsley-message="이메일 형태로 입력해주세요."
										data-parsley-pattern="^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$">
										<p class="message"></p>
                                    </div>
                                    <div class="col-12 mb-3">
                                        <input type="password" class="form-control" 
                                        id="password1" placeholder="비밀번호"
										data-parsley-message="영문/숫자/특수문자 조합 8~16자 조합으로 입력해주세요."
										data-parsley-pattern="^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{8,16}$">
										<p class="message"></p>
                                    </div>
                                    <div class="col-12 mb-3">
                                        <input type="password" class="form-control" 
                                        id="password2" name="password" placeholder="비밀번호 확인"
										data-parsley-equalto-message="입력값이 일치하지 않습니다."
										data-parsley-pattern="^[]*.{1,}$"
										data-parsley-message="필수 입력 항목입니다">
										<p class="message"></p>
                                    </div>
                                    <div class="col-12 mb-3">
                                        <input type="text" class="form-control" 
                                        name="name" placeholder="이름"
										data-parsley-pattern="^[가-힣|a-z|A-Z].{0,}$"
										data-parsley-message="한글과 영문만 입력 가능합니다.">
										<p class="message"></p>
                                    </div>
                                    <div class="col-12 mb-3">
                                        <input type="text" class="form-control" 
                                        name="phone" placeholder="전화번호 ( - 없이)" draggable="false"
										data-parsley-pattern="^(01[0|1|6|7|8|9])?([0-9]{3,4})?([0-9]{4})$"
										data-parsley-message="-없이 번호로만 전부 입력해주세요.">
										<p class="message"></p>
                                    </div>
                                    <div class="col-12 mb-15">
                                        <input type="text" class="form-control" 
                                        id="address" name="address" placeholder="주소"
										data-parsley-pattern="^[]*.{10,}$"
										data-parsley-message="너무 짧습니다.">
										<p class="message"></p>
                                    </div>

                                    <div class="col-12 mb-30">
                                        <div class="custom-control custom-checkbox d-block">
                                            <input type="checkbox" class="custom-control-input" id="customCheck1">
                                            <label class="custom-control-label" for="customCheck1">약관 동의</label>
                                        </div>
                                        <div class="custom-control custom-checkbox d-block">
                                            <input type="checkbox" class="custom-control-input" id="customCheck2">
                                            <label class="custom-control-label" for="customCheck2">약관 동의</label>
                                        </div>
										<p class="message"></p>
                                    </div>
                                    <input type="hidden" name="kakao" value="">
                                    <input type="hidden" name="facebook" value="">
                                </div>
                                <button type="button" class="btn amado-btn form-btn col-12">회원가입</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Main Content Wrapper End ##### -->

	<c:import url="${pageContext.request.contextPath}/layout/footer"/>
</body>

</html>