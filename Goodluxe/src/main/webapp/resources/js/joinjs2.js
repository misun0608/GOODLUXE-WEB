$(document).ready(function () {

// 실시간 아이디 중복체크
	$(function() {
		$("#alert-success_id").hide();
		$("#alert-danger_id").hide(); // 아이디를 입력해주세요
		$("#alert-danger_id1").hide(); // 동일한 아이디 존재
		$("#alert-danger_id2").hide(); // 영문자/숫자만 사용
		
		$("#join_id").keyup(function() {
			var join_id = $("#join_id").val();
			$.ajax({
				url : '/goodluxe/idCheck.do',
				type : "post",
				dataType : "json",
				data : {
					member_id : join_id
				},
				contentType : 'application/x-www-form-urlencoded; charset=utf-8',

				success : function(retVal) {
					if (retVal.res == "Fail") { 
						// db에 동일한 아이디 존재하기 때문에 가입 실패
						$("#alert-success_id").hide(); // 사용할 수 있는 아이디
						$("#alert-danger_id").hide(); // 아이디를 입력해주세요
						$("#alert-danger_id1").show(); // 동일한 아이디 존재
						$("#alert-danger_id2").hide(); // 영문자/숫자만 사용
					} else {
						if (join_id == ""){
							$("#alert-success_id").hide(); // 사용할 수 있는 아이디
							$("#alert-danger_id").show(); // 아이디를 입력해주세요
							$("#alert-danger_id1").hide(); // 동일한 아이디 존재
						} else {
							$("#alert-success_id").show();
							$("#alert-danger_id").hide(); // 아이디를 확인해주세요
							$("#alert-danger_id1").hide(); // 동일한 아이디 존재
						}
					}
				},
				error : function() {
					alert("ajax통신 실패!!!");
				}
			});											
		});
	});

	// 비밀번호 비교
	$(function() {
		$("#alert-success_pw").hide();
		$("#alert-danger_pw").hide();
		$("#alert-danger_pw1").hide();
		$("#alert-danger_pw2").hide();
		
		$("#join_pw1").keyup(function() {
			var join_pw1 = $("#join_pw1").val();
			var join_pw2 = $("#join_pw2").val();
			
			if (join_pw1 != "" || join_pw2 != "") {
				if(join_pw1 == join_pw2) {
					$("#alert-success_pw").show();
					$("#alert-danger_pw").hide();
					$("#alert-danger_pw1").hide();
					$("#alert-danger_pw2").hide();
					$("#submit").removeAttr("disabled");
				} else if((join_pw1.length < 10) || (join_pw2.length < 10)){
					$("#alert-success_pw").hide();
					$("#alert-danger_pw").hide();
					$("#alert-danger_pw1").show();
					$("#alert-danger_pw2").hide	();
					$("#submit").removeAttr("disabled");
				} else {
					$("#alert-success_pw").hide();
					$("#alert-danger_pw").show(); // 일치 x
					$("#alert-danger_pw1").hide(); // 10자 이상 입력
					$("#alert-danger_pw2").hide(); // 입력 X
					$("#submit").attr("disabled", "disabled");
				}
			} else if((join_pw1 == "") && (join_pw2 == "")) {
				$("#alert-success_pw").hide();
				$("#alert-danger_pw").hide();
				$("#alert-danger_pw1").hide();
				$("#alert-danger_pw2").show();
				$("#submit").removeAttr("disabled");
			}
		});
		
		$("#join_pw2").keyup(function() {
			var join_pw1 = $("#join_pw1").val();
			var join_pw2 = $("#join_pw2").val();
			
			if (join_pw1 != "" || join_pw2 != "") {
				if(join_pw1 == join_pw2) {
					$("#alert-success_pw").show();
					$("#alert-danger_pw").hide();
					$("#alert-danger_pw1").hide();
					$("#alert-danger_pw2").hide();
					$("#submit").removeAttr("disabled");
				} else if((join_pw1.length < 10) || (join_pw2.length < 10)){
					$("#alert-success_pw").hide();
					$("#alert-danger_pw").hide();
					$("#alert-danger_pw1").show();
					$("#alert-danger_pw2").hide();
					$("#submit").removeAttr("disabled");
				} else {
					$("#alert-success_pw").hide();
					$("#alert-danger_pw").show(); // 일치 x
					$("#alert-danger_pw1").hide(); // 10자 이상 입력
					$("#alert-danger_pw2").hide(); // 입력 X
					$("#submit").attr("disabled", "disabled");
				}
			} else if((join_pw1 == "") && (join_pw2 == "")) {
				$("#alert-success_pw").hide();
				$("#alert-danger_pw").hide();
				$("#alert-danger_pw1").hide();
				$("#alert-danger_pw2").show();
				$("#submit").removeAttr("disabled");
			}
		});
	});

	// 우편번호 주소검색
	$(".zipcode_button").click(
			function openZipSearch() {
				new daum.Postcode({
					oncomplete : function(data) {
						$('[name=member_zipcode]').val(
								data.zonecode); // 우편번호
						// (5자리)
						$('[name=member_addr1]').val(
								data.address); // 기본주소
						$('[name=member_addr2]').val(
								data.buildingName); // 상세주소
						console.log(data);
					}
				}).open();
			});

	// checkbox의 name값이 이름이면서 체크되어 있는 함수를 체크하여 호출함.
	$("input[name=likedcate]:checked").each(function() {
		var likedCate = $(this).val();
	});
	
	
});