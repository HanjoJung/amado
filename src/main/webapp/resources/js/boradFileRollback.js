var filesArr = new Array();
$('#contents').summernote(
		{
			placeholder : '내용을 입력하세요',
			tabsize : 2,
			height : 400,
			minHeight : 200,
			maxHeight : 600,
			fontNames : [ '맑은고딕', 'Arial', 'Arial Black',
					'Comic Sans MS', 'Courier New', ],
			fontNamesIgnoreCheck : [ '맑은고딕' ],
			lang : 'ko-KR',
			callbacks: { 
			    onImageUpload: function(files, editor, welEditable) {
				    sendFile(files[0], this);
				}
			}
		});

function sendFile(file, editor) {
	data = new FormData();
    data.append("file", file);
    $.ajax({ 
        data : data,
        type : "POST",
        url : "file/fileUpload",
        cache : false,
        contentType : false,
        processData : false,
    	enctype: 'multipart/form-data',
        success : function(img_name) {
        	$(editor).summernote('editor.insertImage', img_name);
        	filesArr.push(img_name.replace("../resources/img/board/","").trim());
        }
    });
}
$(function() {
	var board = $("#board").attr("data-board");
	var curFiles = new Array();
	var delFiles = new Array();
	var checkSubmit = false;
	var temp = $("#contents").val();
	
	while(temp.indexOf('src="../resources/img/board/') > 0){
		var first = temp.indexOf('src="../resources/img/board/')+25;
		var last = temp.indexOf('&#13;&#10;');
		var middel = temp.substring(first, last);
		curFiles.push(middel);
		temp = temp.replace('src="../resources/img/board/' + middel + '&#13;&#10;', "");
	}
	
	$("#frm").on("blur",".note-editable", function() {
		checkFile($("#contents").val(), filesArr);
		$.each(curFiles, function(index, item) {
			if($("#contents").val().search(item) == -1){
				curFiles.splice(curFiles.indexOf(item), 1);
				delFiles.push(item)
			}
		})
	});
	

	function nullCheck() {
		check = true;
		$(".form-value").each(function() {
			if($(this).val().length == 0){
				$(this).focus();
				$(this).prev(".tooltiptext").css({
					visibility: "visible",
			  		opacity: 1});
				check = false;
				return check;
			}
		})
		return check;
	}
	$(".form-value").keydown(function() {
		$(".tooltiptext").css({
			visibility: "hidden",
		  	opacity: 0});
	})
	
	
	$(".board-btn").click(function() {
		if(nullCheck()){
			url = $(this).attr("data-action");
			str = $(this).text();
			$.ajax({
				url : "./" + board + url,
				type : "POST",
				data : {
					num : $("#num").val(),
					title : $("#title").val(),
					writer : $("#writer").val(),
					contents : $("#contents").val()
				},
				success : function(result) {
					if(result > 0){
						checkFile("", delFiles);
						checkSubmit = true;
						alert(str + "하였습니다.");
						location.href = "./" + board + "List";
					}else{
						alert(str + "하지 못하였습니다.");
					}
				},
				error : function(err) {
					alert(err);
				}
			})
		};
	})
	
	function checkFile(contents, array) {
		$.each(array, function(index, item) {
			if(contents.search(item) == -1){
				$.ajax({
					url : "file/delete",
					type : "POST",
					data : {
						fname : item
					},
					success : function() {
						array.splice(array.indexOf(item), 1);
					}
				});
			}
		})
	}
	
	$("#del").click(function() {
		$.ajax({
			url : "./" + board + "Delete",
			type : "POST",
			data : {
				num : "${dto.num}",
				writer : "${dto.writer}"
			},
			success : function(result) {
				if (result > 0) {
					alert("삭제하였습니다.");
					location.href = "./${board}List";
				} else {
					alert("삭제하지 못하였습니다.");
				}
			},
			error : function(err) {
				alert(arr);
			}
		});
	});

	window.onbeforeunload = function(e) {
		if(checkSubmit){
			checkFile($("#contents").val(), filesArr);
		}else{
			checkFile("",filesArr);
		}
	};
});