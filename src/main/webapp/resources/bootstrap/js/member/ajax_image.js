function fileAjax(event){
			
			var file = $("input[name=file]")[0].files[0];
			
			//formData사용 : <form>태그로 만든 전송방식과 동일하게 파일 데이터를 전송할 수 있음
			var formData = new FormData();
			formData.append("file", file);	//끌어다 놓은 파일을 "file"이란 이름으로 객체를 추가함
			 
			//Ajax 처리하기
			//processData와 contentType은 FormData를 사용하기 위해서 반드시 필요로 하는 것이고 'false'로 지정해야 함
			//아래 두 명령어는 데이터 전송을 form 태그를 이용한 파일 업로드와 동일하게 해주는 역할
			//processData : false,	//application/x-www-form-urlencoded타입으로 전송하지 않을 시 false
			//contentType : false,	//파일을 multipart/form-data 방식으로 전송하기 위함(form방식에 해당됨)
			$.ajax({
				url : '/uploadAjax.htm',
				data : formData,
				dataType : 'text',
				processData : false,	
				contentType : false,
				type : 'POST',
				success : function(data){
					//alert(data);
					console.log(data);
					var str = "";
					 if(checkImageType(data)){
						  str ="<img src='displayFile.htm?fileName="+data+"'/>";
					  }else{
						  str ="이미지파일(jpg, png, gif)로 올려주세요";
					  }
					  //console.log(str);
					  $(".uploadedList").empty();
					  $(".uploadedList").append(str);
				}
			});
		}
		
		//전송받은 문자열이 이미지 파일인지 확인하는 작업
		function checkImageType(fileName){
			var pattern = /jpg$|gif$|png$|jpeg$/i;	//정규표현을 통해 파일의 확장자가 존재하는지 확인
			return fileName.match(pattern);
		}