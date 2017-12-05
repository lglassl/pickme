	$(document).ready(function(){
		$('#email3').change(function(){
			$('#email2').val($('#email3').val());
			if($('#email3').val() != ''){
				$('#email2').attr("disabled", "disabled");
				$('#comp_pp_email').val($('#email1').val() + '@' + $('#email2').val());
			}else{
				$('#email2').removeAttr("disabled");
				$('#comp_pp_email').val("");
			}
		})
	});