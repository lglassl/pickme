	$(document).ready(function(){
		$('#email3').change(function(){
			$('#email2').val($('#email3').val());
			if($('#email3').val() != ''){
				$('#email2').attr("disabled", "disabled");
			}else{
				$('#email2').removeAttr("disabled");
			}
		})
	});