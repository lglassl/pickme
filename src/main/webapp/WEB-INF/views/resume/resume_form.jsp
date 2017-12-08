<%-- 
   @JSP : resume_form.jsp
   @Date : 2017-12-01
   @Author : 박현지
   @Desc : 이력서 등록 form
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<div class="resumeContainer">
	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="row">
					<div class="col-lg-12" class="label" style="text-align: center"><h2>초기 이력서 등록</h2></div>
					<form method="POST" id="resumeEnrollForm" enctype="multipart/form-data">
					
					<!-- 인적사항 : 필수-->
					<label class="formprofile_name" for="formprofile">인적사항</label>
					<div class="formprofile" id="formprofile" class="col-lg-12">
						<div class="row formprofile_row">
							<div class="col-md-3 formprofile_detail">
								<label class="control-label profile_label" for="solo_name">이름</label>
								<div id="solo_name">${user.solo_name}</div>
							</div>
							<div class="col-md-3 formprofile_detail">
								<label class="control-label profile_label" for="solo_birth">생년월일</label>
								<div id="solo_birth">${user.solo_birth}</div>
							</div>
							<div class="col-md-2 formprofile_detail">
								<label class="control-label profile_label" for="solo_gender">성별</label>
								<div id="solo_gender">${user.solo_gender }</div>
							</div>
							<div class="col-md-4 formprofile_detail">
								<label class="control-label profile_label" for="solo_cphone">휴대폰번호</label>
								<div id="solo_cphone">${user.solo_cphone }</div>
							</div>
						</div>
						<div class="row formprofile_row">
							<div class="col-md-6 formprofile_detail">
								<label class="control-label profile_label" for="solo_cphone">이메일</label>
								<div id="solo_cphone">${user.solo_email }</div>
							</div>
							<div class="col-md-6 formprofile_detail">
								<label class="control-label profile_label" for="solo_addr">주소</label>
								<div id="solo_addr">${user.solo_addr }</div>
							</div>
						</div>
						
					</div>
		
					<!-- 학력 : 필수 -->
					<label class="formprofile_name" for="formprofile">학력</label>
						<div class="formprofile" id="formprofile" class="col-lg-12">
							<div id="edu_formcontainer[0]">
								<div class="row formprofile_row">
									<div class="col-md-3 formprofile_detail input">
										<label class="control-label profile_label" for="eduList[0].edu_institute">학교명</label>
										<input type="text" id="eduList[0].edu_institute" name="eduList[0].edu_institute">
									</div>
									<div class="col-md-3 formprofile_detail input">
										<label class="control-label profile_label" for="eduList[0].edu_start">입학년월</label>
										<input type="text" id="eduList[0].edu_start" name="eduList[0].edu_start" placeholder="예) 2015.05">
									</div>
									<div class="col-md-3 formprofile_detail input">
										<label class="control-label profile_label" for="eduList[0].edu_end">졸업년월</label>
										<input type="text" id="eduList[0].edu_end" name="eduList[0].edu_end" placeholder="예) 2015.05">
									</div>
									<div class="col-md-3 formprofile_detail input">
										<label class="control-label profile_label" for="eduList[0].edu_category">구분</label>
										<div><select id="eduList[0].edu_category" name="eduList[0].edu_category">
											<option value="재학중">재학중</option>
											<option value="졸업예정">졸업예정</option>
											<option value="졸업">졸업</option>
										</select></div>
									</div>
								</div>
								<div class="row formprofile_row">
									<div class="col-md-4 formprofile_detail input">
										<label class="control-label profile_label" for="eduList[0].edu_major">전공</label>
										<input type="text" id="eduList[0].edu_major" name="eduList[0].edu_major">
									</div>
									<div class="col-md-4 formprofile_detail input">
										<label class="control-label profile_label" for="eduList[0].edu_grade">학점</label>
										<input type="text" id="eduList[0].edu_grade" name="eduList[0].edu_grade" placeholder="평점/총점">
									</div>
								</div>
							</div>
							<hr color="#808080">
							<div id="space_edu_addForm"></div>
							<div class="row formprofile_row" style="text-align: center">
									<button type="button" class="btn" id="edu_addbtn">
									<img id="addimg_btn" src="<%=request.getContextPath()%>/resources/resume/plus.PNG"><span><b> 학력 추가</b></span></button>
									<div><span id="edu_addbtn_alert_span"></span></div>
							</div>
						</div>
						
				<!-- 학력form추가 script// 5개까지만 생성가능 -->		
				<script type="text/javascript">
					$(document).ready(function(){
						
						var edu_containerIndex=1;
						
						$('#edu_addbtn').click(function(){
							var eduStr=
								'<div id="edu_formcontainer['+edu_containerIndex +']">'
							+		'<div class="row formprofile_row">'
							+			'<div class="col-md-3 formprofile_detail input">'
							+				'<label class="control-label profile_label" for="eduList['+edu_containerIndex+'].edu_institute">학교명</label>'
							+				'<input type="text" id="eduList['+edu_containerIndex+'].edu_institute" name="eduList['+edu_containerIndex+'].edu_institute">'
							+			'</div>'
							+			'<div class="col-md-3 formprofile_detail input">'
							+				'<label class="control-label profile_label" for="eduList['+edu_containerIndex+'].edu_start">입학년월</label>'
							+				'<input type="text" id="eduList['+edu_containerIndex+'].edu_start" name="eduList['+edu_containerIndex+'].edu_start" placeholder="예) 2015.05">'    
							+			'</div>'
							+			'<div class="col-md-3 formprofile_detail input">'
							+				'<label class="control-label profile_label" for="eduList['+edu_containerIndex+'].edu_end">졸업년월</label>'
							+				'<input type="text" id="eduList['+edu_containerIndex+'].edu_end" name="eduList['+edu_containerIndex+'].edu_end" placeholder="예) 2015.05">'
							+			'</div>'
							+			'<div class="col-md-3 formprofile_detail input">'
							+				'<label class="control-label profile_label" for="eduList['+edu_containerIndex+'].edu_category">구분</label>'
							+				'<div><select id="eduList['+edu_containerIndex+'].edu_category" name="eduList['+edu_containerIndex+'].edu_category">'
							+					'<option value="재학중">재학중</option>'
							+					'<option value="졸업예정">졸업예정</option>'
							+					'<option value="졸업">졸업</option>'
							+				'</select></div>'
							+			'</div>'
							+		'</div>'
							+		'<div class="row formprofile_row">'
							+			'<div class="col-md-4 formprofile_detail input">'
							+				'<label class="control-label profile_label" for="eduList['+edu_containerIndex+'].edu_major">전공</label>'
							+				'<input type="text" id="eduList['+edu_containerIndex+'].edu_major" name="eduList['+edu_containerIndex+'].edu_major">'
							+			'</div>'
							+			'<div class="col-md-4 formprofile_detail input">'
							+				'<label class="control-label profile_label" for="eduList['+edu_containerIndex+'].edu_grade">학점</label>'
							+				'<input type="text" id="eduList['+edu_containerIndex+'].edu_grade" name="eduList['+edu_containerIndex+'].edu_grade" placeholder="평점/총점">'
							+			'</div>'
							+		'</div>'
							+	'</div>'
							+   '<hr color="#808080">';
							console.log('edu_addbtn 클릭');
							$('#space_edu_addForm').append(eduStr);
							edu_containerIndex++;
							console.log(edu_containerIndex);
							if(edu_containerIndex == "5"){
								$('#edu_addbtn').prop("disabled", true);
								$('#edu_addbtn_alert_span').html('학력 항목은 5개까지 입력 가능합니다!')
							}
						});
						
					});
				</script>
						
						
						<!-- 경력 :필수-->
						<label class="formprofile_name" for="formprofile">경력 /인턴/대외활동</label>
							<div class="formprofile" id="formprofile" class="col-lg-12">
								<div class="career_formcontainer[0]">
									<div class="row formprofile_row">
										<div class="col-md-4 formprofile_detail input">
											<label class="control-label profile_label" for="careerList[0].career_institute">회사/단체명</label>
											<input type="text" id="careerList[0].career_institute" name="careerList[0].career_institute">
										</div>
										<div class="col-md-4 formprofile_detail input">
											<label class="control-label profile_label" for="careerList[0].career_start">활동시작</label>
											<input type="text" id="careerList[0].career_start" name="careerList[0].career_start" placeholder="예) 2015.05">
										</div>
										<div class="col-md-4 formprofile_detail input">
											<label class="control-label profile_label" for="careerList[0].career_end">활동종료</label>
											<input type="text" id="careerList[0].career_end" name="careerList[0].career_end" placeholder="예) 2015.05">
										</div>
									</div>
									<div class="row formprofile_row">
										<div class="form-group formprofile_detail input">
											<label class="control-label profile_label" for="careerList[0].career_task">담당직책/지위</label>
											<input type="text" id="careerList[0].career_task" name="careerList[0].career_task">
										</div>
										<div class="form-group formprofile_detail input">
											<label class="control-label profile_label" for="careerList[0].career_activity">담당업무</label>
											<input type="text" id="careerList[0].career_activity" name="careerList[0].career_activity" placeholder="담당하신 업무의 성과에 대해 간단 명료하게 작성해주세요.">
										</div>
									</div>
								</div>
								<hr color="#808080">
								<div id="space_career_addForm"></div>
								<div class="row formprofile_row" style="text-align: center">
									<button type="button" class="btn" id="career_addbtn">
									<img id="addimg_btn" src="<%=request.getContextPath()%>/resources/resume/plus.PNG"><span><b> 경력 추가</b></span></button>
									<div><span id="career_addbtn_alert_span"></span></div>
								</div>
							</div>
				
				<!-- 경력form추가 script// 7개까지만 생성가능 -->					
				<script type="text/javascript">
					$(document).ready(function(){
						var career_containerIndex=1;
						
						$('#career_addbtn').click(function(){
							var careerStr =
								'<div class="career_formcontainer['+career_containerIndex+']">'
							+		'<div class="row formprofile_row">'
							+			'<div class="col-md-4 formprofile_detail input">'
							+				'<label class="control-label profile_label" for="careerList['+career_containerIndex+'].career_institute">회사/단체명</label>'
							+				'<input type="text" id="careerList['+career_containerIndex+'].career_institute" name="careerList['+career_containerIndex+'].career_institute">'
							+			'</div>'
							+			'<div class="col-md-4 formprofile_detail input">'
							+				'<label class="control-label profile_label" for="careerList['+career_containerIndex+'].career_start">활동시작</label>'
							+				'<input type="text" id="careerList['+career_containerIndex+'].career_start" name="careerList['+career_containerIndex+'].career_start" placeholder="예) 2015.05">'
							+			'</div>'
							+			'<div class="col-md-4 formprofile_detail input">'
							+				'<label class="control-label profile_label" for="careerList['+career_containerIndex+'].career_end">활동종료</label>'
							+				'<input type="text" id="careerList['+career_containerIndex+'].career_end" name="careerList['+career_containerIndex+'].career_end" placeholder="예) 2015.05">'
							+			'</div>'
							+		'</div>'
							+		'<div class="row formprofile_row">'
							+			'<div class="form-group formprofile_detail input">'
							+				'<label class="control-label profile_label" for="careerList['+career_containerIndex+'].career_task">담당직책/지위</label>'
							+				'<input type="text" id="careerList['+career_containerIndex+'].career_task" name="careerList['+career_containerIndex+'].career_task">'
							+			'</div>'
							+			'<div class="form-group formprofile_detail input">'
							+				'<label class="control-label profile_label" for="careerList['+career_containerIndex+'].career_activity">담당업무</label>'
							+				'<input type="text" id="careerList['+career_containerIndex+'].career_activity" name="careerList['+career_containerIndex+'].career_activity" placeholder="담당하신 업무의 성과에 대해 간단 명료하게 작성해주세요.">'
							+			'</div>'
							+		'</div>'
							+	'</div>'
							+	'<hr color="#808080">';
							console.log('경력추가 버튼 누름');
							$('#space_career_addForm').append(careerStr);
							career_containerIndex++;
							if(career_containerIndex =="7"){
								$('#career_addbtn').prop("disabled", true);
								$('#career_addbtn_alert_span').html('경력항목은 7개까지 입력가능합니다!');
							}
						});
					});
				</script>
				
				
							<!-- 어학 :필수 -->
							<label class="formprofile_name" for="formprofile">어학</label>
								<div class="formprofile" id="formprofile" class="col-lg-12">
									<div class="lang_formcontainer[0]">
										<div class="row formprofile_row">
											<div class="col-md-3 form-group formprofile_detail input">
												<label class="control-label profile_label" for="langList[0].lang_field">언어구분</label>
												<div>
												<select id="langList[0].lang_field" name="langList[0].lang_field">
													<option value="korean">한국어</option>
													<option value="english">영어</option>
													<option value="japanese">일본어</option>
													<option value="chinese">중국어</option>
													<option value="spanish">스페인어</option>
													<option value="russia">러시아어</option>
												</select>
												</div>
											</div>
											<div class="col-md-3 form-group formprofile_detail input">
												<label class="control-label profile_label" for="langList[0].lang_testname">언어자격증 명</label>
												<input type="text" id="langList[0].lang_testname" name="langList[0].lang_testname" placeholder="예) toeic">
											</div>
											<div class="col-md-3 form-group formprofile_detail input">
												<label class="control-label profile_label" for="langList[0].lang_grade">점수/급수</label>
												<input type="text" id="langList[0].lang_grade" name="langList[0].lang_grade">
											</div>
											<div class="col-md-3 form-group formprofile_detail input">
												<label class="control-label profile_label" for="langList[0].lang_getdate">취득일</label>
												<input type="text" id="langList[0].lang_getdate" name="langList[0].lang_getdate" placeholder="예) 2017.01">
											</div>
										</div>
									</div>
									<hr color="#808080">
									<div id="space_lang_addForm"></div>
									<div class="row formprofile_row" style="text-align: center">
										<button type="button" class="btn" id="language_addbtn">
										<img id="addimg_btn" src="<%=request.getContextPath()%>/resources/resume/plus.PNG"><span><b> 어학 추가</b></span></button>
										<div><span id="language_addbtn_alert_span"></span></div>
									</div>
								</div>
								
				<!-- 어학form추가 script// 7개까지만 생성가능 -->
				<script type="text/javascript">
					var lang_containerIndex=1;
					
					$(document).ready(function(){
						$('#language_addbtn').click(function(){
							var langStr=
								'<div class="lang_formcontainer['+lang_containerIndex+']">'
							+		'<div class="row formprofile_row">'
							+			'<div class="col-md-3 form-group formprofile_detail input">'
							+				'<label class="control-label profile_label" for="langList['+lang_containerIndex+'].lang_field">언어구분</label>'
							+				'<div>'
							+				'<select id="langList['+lang_containerIndex+'].lang_field" name="langList['+lang_containerIndex+'].lang_field">'
							+					'<option value="korean">한국어</option>'
							+					'<option value="english">영어</option>'
							+					'<option value="japanese">일본어</option>'
							+					'<option value="chinese">중국어</option>'
							+					'<option value="spanish">스페인어</option>'
							+					'<option value="russia">러시아어</option>'
							+				'</select>'
							+				'</div>'
							+			'</div>'
							+			'<div class="col-md-3 form-group formprofile_detail input">'
							+				'<label class="control-label profile_label" for="langList['+lang_containerIndex+'].lang_testname">언어자격증 명</label>'
							+				'<input type="text" id="langList['+lang_containerIndex+'].lang_testname" name="langList['+lang_containerIndex+'].lang_testname" placeholder="예) toeic">'
							+			'</div>'
							+			'<div class="col-md-3 form-group formprofile_detail input">'
							+				'<label class="control-label profile_label" for="langList['+lang_containerIndex+'].lang_grade">점수/급수</label>'
							+				'<input type="text" id="langList['+lang_containerIndex+'].lang_grade" name="langList['+lang_containerIndex+'].lang_grade">'
							+			'</div>'
							+			'<div class="col-md-3 form-group formprofile_detail input">'
							+				'<label class="control-label profile_label" for="langList['+lang_containerIndex+'].lang_getdate">취득일</label>'
							+				'<input type="text" id="langList['+lang_containerIndex+'].lang_getdate" name="langList['+lang_containerIndex+'].lang_getdate" placeholder="예) 2017.01">'
							+			'</div>'
							+		'</div>'
							+	'</div>'
							+   '<hr color="#808080">';
							
							console.log('어학 추가 버튼 누름');
							$('#space_lang_addForm').append(langStr);
							lang_containerIndex++;
							if(lang_containerIndex =="7"){
								$('#language_addbtn').prop("disabled", true);
								$('#language_addbtn_alert_span').html('어학 항목은 7개까지 입력가능합니다!');
							}
						});
					});
				</script>				
								
								
								
							<!-- 자격증 : 필수 -->
							<label class="formprofile_name" for="formprofile">자격증</label>
								<div class="formprofile" id="formprofile" class="col-lg-12">
									<div class="license_formcontainer[0]">
										<div class="row formprofile_row">
											<div class="col-md-4 form-group formprofile_detail input">
												<label class="control-label profile_label" for="licenseList[0].license_name">자격증 명</label>
												<input type="text" id="licenseList[0].license_name" name="licenseList[0].license_name" >
											</div>
											<div class="col-md-4 form-group formprofile_detail input">
												<label class="control-label profile_label" for="licenseList[0].license_co">발행기관</label>
												<input type="text" id="licenseList[0].license_co" name="licenseList[0].license_co">
											</div>
											<div class="col-md-4 form-group formprofile_detail input">
												<label class="control-label profile_label" for="licenseList[0].license_getdate">취득일</label>
												<input type="text" id="licenseList[0].license_getdate" name="licenseList[0].license_getdate" placeholder="예) 2017.01">
											</div>
										</div>
									</div>
									<hr color="#808080">
									<div id="space_license_addForm"></div>
									<div class="row formprofile_row" style="text-align: center">
										<button type="button" class="btn" id="license_addbtn">
										<img id="addimg_btn" src="<%=request.getContextPath()%>/resources/resume/plus.PNG"><span><b> 자격증 추가</b></span></button>
										<div><span id="license_addbtn_alert_span"></span></div>
									</div>
								</div>	
								
				
				<!-- 자격증 form 추가 script // 7개까지 가능 -->
				<script type="text/javascript">
					var license_containerIndex=1;
					
					$(document).ready(function(){
						$('#license_addbtn').click(function(){
							var licenseStr=
								'<div class="license_formcontainer['+license_containerIndex+']">'
							+		'<div class="row formprofile_row">'
							+			'<div class="col-md-4 form-group formprofile_detail input">'
							+				'<label class="control-label profile_label" for="licenseList['+license_containerIndex+'].license_name">자격증 명</label>'
							+				'<input type="text" id="licenseList['+license_containerIndex+'].license_name" name="licenseList['+license_containerIndex+'].license_name">'
							+			'</div>'
							+			'<div class="col-md-4 form-group formprofile_detail input">'
							+				'<label class="control-label profile_label" for="licenseList['+license_containerIndex+'].license_co">발행기관</label>'
							+				'<input type="text" id="licenseList['+license_containerIndex+'].license_co" name="licenseList['+license_containerIndex+'].license_co">'
							+			'</div>'
							+			'<div class="col-md-4 form-group formprofile_detail input">'
							+				'<label class="control-label profile_label" for="licenseList['+license_containerIndex+'].license_getdate">취득일</label>'
							+				'<input type="text" id="licenseList['+license_containerIndex+'].license_getdate" name="licenseList['+license_containerIndex+'].license_getdate" placeholder="예) 2017.01">'
							+			'</div>'
							+		'</div>'
							+	'</div>'
							+	'<hr color="#808080">';
							
							console.log('자격증 추가 버튼 누름');
							$('#space_license_addForm').append(licenseStr);
							license_containerIndex++;
							if(license_containerIndex =="7"){
								$('#license_addbtn').prop("disabled", true);
								$('#license_addbtn_alert_span').html('자격증 항목은 7개까지 입력가능합니다!');
							}
						});
					});	
				</script>				
								
								
								
							<!-- 포트폴리오 : 선택 -->
							<label class="formprofile_name" for="formprofile">포트폴리오</label>
								<div class="formprofile" id="formprofile" class="col-lg-12">
									<div class="row formprofile_row">
										<div class="form-group formprofile_detail input">
											<label class="control-label profile_label" for="file">파일추가</label>
											<input type="file" id="file" name="file" >
										</div>
									</div>
									<div class="row formprofile_row" style="text-align: center">
										<span><b> 포트폴리오 파일은 하나만 업로드 할 수 있어요 ^^</b></span>
									</div>
								</div>
								
								
								
							<!-- 보유기술 : 선택 -->
							<label class="formprofile_name" for="formprofile">보유기술</label>
								<div class="formprofile" id="formprofile" class="col-lg-12">
									<div class="skill_formcontainer[0]">
										<div class="row formprofile_row">
											<div class="form-group formprofile_detail input">
												<label class="control-label profile_label" for="skillList[0].skill_name">보유기술</label>
												<input type="text" id="skillList[0].skill_name" name="skillList[0].skill_name" placeholder="예) HTML5 / CSS5 , JQuery, JAVA, JSP, Eclipse" >
											</div>
										</div>
									</div>	
									<hr color="#808080">
									<div id="space_skill_addForm"></div>
									<div class="row formprofile_row" style="text-align: center">
										<button type="button" class="btn" id="skill_addbtn">
										<img id="addimg_btn" src="<%=request.getContextPath()%>/resources/resume/plus.PNG"><span><b> 보유기술 추가</b></span></button>
										<div><span id="skill_addbtn_alert_span"></span></div>
									</div>
								</div>
					
					
					<!-- 보유기술 form 추가 script // 5개까지 입력가능 -->			
					<script type="text/javascript">
						var skill_containerIndex=1;
							
						$(document).ready(function(){
							$('#skill_addbtn').click(function(){
								var skillStr=
									'<div class="skill_formcontainer['+skill_containerIndex+']">'
								+		'<div class="row formprofile_row">'
								+			'<div class="form-group formprofile_detail input">'
								+				'<label class="control-label profile_label" for="skillList['+skill_containerIndex+'].skill_name">보유기술</label>'
								+				'<input type="text" id="skillList['+skill_containerIndex+'].skill_name" name="skillList['+skill_containerIndex+'].skill_name" placeholder="예) HTML5 / CSS5 , JQuery, JAVA, JSP, Eclipse" >'
								+			'</div>'
								+		'</div>'
								+	'</div>'	
								+	'<hr color="#808080">';
								
								console.log('보유기술 추가 버튼 누름');
								$('#space_skill_addForm').append(skillStr);
								skill_containerIndex++;
								if(skill_containerIndex =="5"){
									$('#skill_addbtn').prop("disabled", true);
									$('#skill_addbtn_alert_span').html('보유기술 항목은 5개까지 입력가능합니다!');
								}
							});
						});		
					</script>			
								
				
								
							<!-- 수상 : 선택 -->
							<label class="formprofile_name" for="formprofile">수상</label>
								<div class="formprofile" id="formprofile" class="col-lg-12">
									<div class="award_formcontainer[0]">
										<div class="row formprofile_row">
											<div class="col-md-4 form-group formprofile_detail input">
												<label class="control-label profile_label" for="awardList[0].award_name">수상명</label>
												<input type="text" id="awardList[0].award_name" name="awardList[0].award_name">
											</div>
											<div class="col-md-4 form-group formprofile_detail input">
												<label class="control-label profile_label" for="awardList[0].award_co">수여기관</label>
												<input type="text" id="awardList[0].award_co" name="awardList[0].award_co">
											</div>
											<div class="col-md-4 form-group formprofile_detail input">
												<label class="control-label profile_label" for="awardList[0].award_year">수상연도</label>
												<input type="text" id="awardList[0].award_year" name="awardList[0].award_year" placeholder="예) 2017" >
											</div>
										</div>
										<div class="row formprofile_row">
											<div class="form-group formprofile_detail input">
												<label class="control-label profile_label" for="awardList[0].award_activity">수여내용</label>
												<input type="text" id="awardList[0].award_activity" name="awardList[0].award_activity" placeholder="수여 내용 및 결과를 자세히 입력해주세요.">
											</div>
										</div>
									</div>
									<hr color="#808080">
									<div id="space_award_addForm"></div>
									<div class="row formprofile_row" style="text-align: center">
										<button type="button" class="btn" id="award_addbtn">
										<img id="addimg_btn" src="<%=request.getContextPath()%>/resources/resume/plus.PNG"><span><b> 수상항목 추가</b></span></button>
										<div><span id="award_addbtn_alert_span"></span></div>
									</div>
								</div>	
			

				<!-- 수상 form 추가 script // 5개까지 입력가능 -->			
				<script type="text/javascript">
					var award_containerIndex=1;
					
					$(document).ready(function(){
						$('#award_addbtn').click(function(){
							var awardStr=
								'<div class="award_formcontainer['+award_containerIndex+']">'
							+		'<div class="row formprofile_row">'
							+			'<div class="col-md-4 form-group formprofile_detail input">'
							+				'<label class="control-label profile_label" for="awardList['+award_containerIndex+'].award_name">수상명</label>'
							+				'<input type="text" id="awardList['+award_containerIndex+'].award_name" name="awardList['+award_containerIndex+'].award_name">'
							+			'</div>'
							+			'<div class="col-md-4 form-group formprofile_detail input">'
							+				'<label class="control-label profile_label" for="awardList['+award_containerIndex+'].award_co">수여기관</label>'
							+				'<input type="text" id="awardList['+award_containerIndex+'].award_co" name="awardList['+award_containerIndex+'].award_co">'
							+			'</div>'
							+			'<div class="col-md-4 form-group formprofile_detail input">'
							+				'<label class="control-label profile_label" for="awardList['+award_containerIndex+'].award_year">수상연도</label>'
							+				'<input type="text" id="awardList['+award_containerIndex+'].award_year" name="awardList['+award_containerIndex+'].award_year" placeholder="예) 2017" >'
							+			'</div>'
							+		'</div>'
							+		'<div class="row formprofile_row">'
							+			'<div class="form-group formprofile_detail input">'
							+				'<label class="control-label profile_label" for="awardList['+award_containerIndex+'].award_activity">수여내용</label>'
							+				'<input type="text" id="awardList['+award_containerIndex+'].award_activity" name="awardList['+award_containerIndex+'].award_activity" placeholder="수여 내용 및 결과를 자세히 입력해주세요.">'
							+			'</div>'
							+		'</div>'
							+	'</div>'
							+	'<hr color="#808080">'
								
							console.log('수상 추가 버튼 누름');
							$('#space_award_addForm').append(awardStr);
							award_containerIndex++;
							if(award_containerIndex =="5"){
								$('#award_addbtn').prop("disabled", true);
								$('#award_addbtn_alert_span').html('수상 항목은 5개까지 입력가능합니다!');
							}
						});
					});		
				</script>		
					
					
					
					
													
				
				
					<!--초기이력서 등록 버튼!!! -->		
					<div style="text-align: center; margin-bottom: 40px;">		
						<input type="button" class="btn btn-lg btn-primary" id="enrollResumeBtn" value="이력서 등록">
						<input type="reset" class="btn btn-lg btn-primary" value=" 취       소 ">		
					</div>
					
				</form>  <!-- 이력서 한꺼번에 insert 시키기위해 -->
				</div> <!-- 제일 처음 row div태그 -->
			</div> <!-- col-md-8  div 끝 -->
			
			<!--이력서 항목 추가할 수 있는 form. 이력서 좌측에 fixed !!!!! -->
			<div class="col-md-2">
				<div class="fixedMenu" id="FixedMenuView">
				    <div class="container">
				        <h2 class="header">이력서 항목</h2>
				        <ul class="list fixedMenuButtons">
				            <li><input type="checkbox" class="button buttonOExperience" data-linked_form_id="formOExperience" data-sync_id="InputStat_TrainingInputStat"><span>보유기술</span></button></li>
							<li><input type="checkbox" class="button buttonPortfolio" data-linked_form_id="formPortfolio" data-sync_id="InputStat_PortfolioInputStat"><span>포트폴리오</span></button></li>
				            <li><input type="checkbox" class="button buttonAward" data-linked_form_id="formAward" data-sync_id="InputStat_AwardInputStat"><span>수상</span></button></li>
				        </ul>
				    </div>
				</div>
			</div>
			
			
		</div>
	</div>
</div>




<!-- 간단한 유효성 검사 -->
<script type="text/javascript">
$(document).ready(function(){
	$('#enrollResumeBtn').click(function(){
		$("#resumeEnrollForm").attr("action", "resume/insert.htm").submit();
	});
});

</script>



<!-- if( $('#edu_institute').val()=="" ){
			alert('학교명을 등록해주세요');
			$('#edu_institute').select();
			$('#edu_institute').focus();
			return false;
		}else if($('#edu_start').val()=="" || $('#edu_end').val()==""){
			alert('학력 기간을 등록해주세요.');
		}else if($('edu_major').val()==""){
			alert('전공명을 등록해주세요.')
		}else if($('#edu_grade').val()==''){
			alert('학점을 등록해주세요.')
		}else if($('#career_institute').val()==""){
			alert('회사/단체명을 등록해주세요');
		}else if($('#career_start').val()=="" || $('#career_end').val()==""){
			alert('활동 기간을 등록해주세요');
		}else if($('#career_task').val()=="" ){
			alert('담당 직책/지위을 등록해주세요');
		}else if($('#career_activity').val()=="" ){
			alert('담당 업무를 입력해주세요');
		}else{
 -->


