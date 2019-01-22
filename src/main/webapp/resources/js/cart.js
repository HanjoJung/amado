$(".cart-insert-btn").click(function() {
		id = $(this).attr("data-id"),
		productNum = $(this).attr("data-product")
	$.ajax({
		url : "../cart/check",
		data : {
			id : id,
			productNum : productNum
		},
		success : function(data) {
			if(data == 1){
				alert("이미 장바구니에 담겨있습니다.");
			}else{
				$.ajax({
					url : "../cart/insert",
					type : "POST",
					data : {
						id : id,
						productNum : productNum
					},
					success : function(data) {
						alert(data);
					}
				})
			}
		}
	})
})

$(".cart-delete-btn").click(function() {
	$.ajax({
		url : "./delete",
		type : "POST",
		data : {
			num : $(this).attr("data-num"),
			id : $(this).attr("data-id")
		},
		success : function() {
			location.reload();
		}
	})
})