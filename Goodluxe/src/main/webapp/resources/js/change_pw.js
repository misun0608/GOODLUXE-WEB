		// 비밀번호 비교
	$(function() {
		$("#alert-success_pw").hide();
		$("#alert-danger_pw").hide();
		$("#alert-danger_pw1").hide();
		$("input").keyup(function() {
			var change_pw1 = $("#change_pw1").val();
			var change_pw2 = $("#change_pw2").val();
			if (change_pw1 != "" || change_pw2 != "") {
				if (change_pw1 == change_pw2) {
					$("#alert-success_pw").show();
					$("#alert-danger_pw").hide();
					$("#alert-danger_pw1").hide();
					$("#submit").removeAttr("disabled");
				} else {
					$("#alert-success_pw").hide();
					$("#alert-danger_pw").show();
					$("#alert-danger_pw1").hide();
					$("#submit").attr("disabled", "disabled");
				}
			}
		});
		$("input").keyup(function() {
			var change_pw1 = $("#change_pw1").val();
			var change_pw2 = $("#change_pw2").val();
			if (change_pw1 != "" || change_pw2 != "") {
				if (change_pw1 == change_pw2) {
					$("#alert-success_pw").show();
					$("#alert-danger_pw").hide();
					$("#alert-danger_pw1").hide();
					$("#submit").removeAttr("disabled");
				} else {
					$("#alert-success_pw").hide();
					$("#alert-danger_pw").show();
					$("#alert-danger_pw1").hide();
					$("#submit").attr("disabled", "disabled");
				}
			}
		});
	});