<%-- 
   @JSP : apply.jsp
   @Date : 2017-12-04
   @Author : 박현지
   @Desc : 특정 채용공고 지원하기 button 클릭시, 초기이력서 불러오고, 자기소개서항목 불러오고, resume table에 insert 시키기
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   


<script type="text/javascript">
$(document).ready(function(){
	
});
</script>

<div class="resumeContainer">
	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="row">
					<div class="col-lg-12" class="label" style="text-align: center"><h2>%%기업 이력서자기소개서 등록</h2></div>
					<form action="apply.htm" method="POST" id="applyResumeForm" enctype="multipart/form-data">
					
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
						<div class="formprofile edu_formcontainer" id="formprofile" class="col-lg-12">
						
						<c:forEach items="${eduList}" var="eduList" varStatus="status">
							<div id="edu_formcontainer[${status.index}]">
							<input type="hidden" id="edu_index" value="${status.index }">
								<div class="row formprofile_row">
									<div class="col-md-3 form-group formprofile_detail input">
										<label class="control-label profile_label" for="eduList2[${status.index}].edu_institute">학교명</label>
										<input type="text" id="eduList2[${status.index}].edu_institute" name="eduList2[${status.index}].edu_institute" value="${eduList.edu_institute}">
									</div>
									<div class="col-md-3 form-group formprofile_detail input">
										<label class="control-label profile_label" for="eduList2[${status.index}].edu_start">입학년월</label>
										<input type="text" id="eduList2[${status.index}].edu_start" name="eduList2[${status.index}].edu_start" placeholder="예) 2015.05" value="${eduList.edu_start}">
									</div>
									<div class="col-md-3 form-group formprofile_detail input">
										<label class="control-label profile_label" for="eduList2[${status.index}].edu_end">졸업년월</label>
										<input type="text" id="eduList2[${status.index}].edu_end" name="eduList2[${status.index}].edu_end" placeholder="예) 2015.05" value="${eduList.edu_end}">
									</div>
									<div class="col-md-3 form-group formprofile_detail input">
										<label class="control-label profile_label" for="eduList2[${status.index}].edu_category">구분</label>
										<div><select id="eduList2[${status.index}].edu_category" name="eduList2[${status.index}].edu_category" value="${eduList.edu_category}">
											<option value="재학중">재학중</option>
											<option value="졸업예정">졸업예정</option>
											<option value="졸업">졸업</option>
										</select></div>
									</div>
								</div>
								<div class="row formprofile_row">
									<div class="col-md-4 form-group formprofile_detail input">
										<label class="control-label profile_label" for="eduList2[${status.index}].edu_major">전공</label>
										<input type="text" id="eduList2[${status.index}].edu_major" name="eduList2[${status.index}].edu_major" value="${eduList.edu_major}">
									</div>
									<div class="col-md-4 form-group formprofile_detail input">
										<label class="control-label profile_label" for="eduList2[${status.index}].edu_grade">학점</label>
										<input type="text" id="eduList2[${status.index}].edu_grade" name="eduList2[${status.index}].edu_grade" placeholder="평점/총점"value="${eduList.edu_grade}">
									</div>
								</div>
							</div>
							<hr color="#808080">
					</c:forEach>	
						
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
					
						var edu_containerIndex = $('.edu_formcontainer').children('div').find('#edu_index').length;
						console.log(edu_containerIndex);
						
						$('#edu_addbtn').click(function(){
							var eduStr=
								'<div id="edu_formcontainer['+edu_containerIndex +']">'
							+	'<input type="hidden" id="edu_index" value="'+edu_containerIndex+'">'
							+		'<div class="row formprofile_row">'
							+			'<div class="col-md-3 form-group formprofile_detail input">'
							+				'<label class="control-label profile_label" for="eduList2['+edu_containerIndex+'].edu_institute">학교명</label>'
							+				'<input type="text" id="eduList2['+edu_containerIndex+'].edu_institute" name="eduList2['+edu_containerIndex+'].edu_institute">'
							+			'</div>'
							+			'<div class="col-md-3 form-group formprofile_detail input">'
							+				'<label class="control-label profile_label" for="eduList2['+edu_containerIndex+'].edu_start">입학년월</label>'
							+				'<input type="text" id="eduList2['+edu_containerIndex+'].edu_start" name="eduList2['+edu_containerIndex+'].edu_start" placeholder="예) 2015.05">'    
							+			'</div>'
							+			'<div class="col-md-3 form-group formprofile_detail input">'
							+				'<label class="control-label profile_label" for="eduList2['+edu_containerIndex+'].edu_end">졸업년월</label>'
							+				'<input type="text" id="eduList2['+edu_containerIndex+'].edu_end" name="eduList2['+edu_containerIndex+'].edu_end" placeholder="예) 2015.05">'
							+			'</div>'
							+			'<div class="col-md-3 form-group formprofile_detail input">'
							+				'<label class="control-label profile_label" for="eduList2['+edu_containerIndex+'].edu_category">구분</label>'
							+				'<div><select id="eduList2['+edu_containerIndex+'].edu_category" name="eduList2['+edu_containerIndex+'].edu_category">'
							+					'<option value="재학중">재학중</option>'
							+					'<option value="졸업예정">졸업예정</option>'
							+					'<option value="졸업">졸업</option>'
							+				'</select></div>'
							+			'</div>'
							+		'</div>'
							+		'<div class="row formprofile_row">'
							+			'<div class="col-md-4 form-group formprofile_detail input">'
							+				'<label class="control-label profile_label" for="eduList2['+edu_containerIndex+'].edu_major">전공</label>'
							+				'<input type="text" id="eduList2['+edu_containerIndex+'].edu_major" name="eduList2['+edu_containerIndex+'].edu_major">'
							+			'</div>'
							+			'<div class="col-md-4 form-group formprofile_detail input">'
							+				'<label class="control-label profile_label" for="eduList2['+edu_containerIndex+'].edu_grade">학점</label>'
							+				'<input type="text" id="eduList2['+edu_containerIndex+'].edu_grade" name="eduList2['+edu_containerIndex+'].edu_grade" placeholder="평점/총점">'
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
							<div class="formprofile career_formcontainer" id="formprofile" class="col-lg-12">
							
							<c:forEach items="${careerList}" var="careerList" varStatus="status">
								<div class="career_formcontainer[${status.index }]">
								<input type="hidden" id="career_index" value="${status.index }">
									<div class="row formprofile_row">
										<div class="col-md-4 form-group formprofile_detail input">
											<label class="control-label profile_label" for="careerList[${status.index }].career_institute">회사/단체명</label>
											<input type="text" id="careerList[${status.index }].career_institute" name="careerList[${status.index }].career_institute" value="${careerList.career_institute }">
										</div>
										<div class="col-md-4 form-group formprofile_detail input">
											<label class="control-label profile_label" for="careerList[${status.index }].career_start">활동시작</label>
											<input type="text" id="careerList[${status.index }].career_start" name="careerList[${status.index }].career_start" placeholder="예) 2015.05" value="${careerList.career_start }">
										</div>
										<div class="col-md-4 form-group formprofile_detail input">
											<label class="control-label profile_label" for="careerList[${status.index }].career_end">활동종료</label>
											<input type="text" id="careerList[${status.index }].career_end" name="careerList[${status.index }].career_end" placeholder="예) 2015.05" value="${careerList.career_end }">
										</div>
									</div>
									<div class="row formprofile_row">
										<div class="form-group formprofile_detail input">
											<label class="control-label profile_label" for="careerList[${status.index }].career_task">담당직책/지위</label>
											<input type="text" id="careerList[${status.index }].career_task" name="careerList[${status.index }].career_task" value="${careerList.career_task }">
										</div>
										<div class="form-group formprofile_detail input">
											<label class="control-label profile_label" for="careerList[${status.index }].career_activity">담당업무</label>
											<input type="text" id="careerList[${status.index }].career_activity" name="careerList[${status.index }].career_activity" 
													placeholder="담당하신 업무의 성과에 대해 간단 명료하게 작성해주세요." value="${careerList.career_activity }">
										</div>
									</div>
								</div>
								<hr color="#808080">
							</c:forEach>
								
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
						
						var career_containerIndex = $('.career_formcontainer').children('div').find('#career_index').length;
						console.log(career_containerIndex);
						
						$('#career_addbtn').click(function(){
							var careerStr =
								'<div class="career_formcontainer['+career_containerIndex+']">'
							+	'<input type="hidden" id="career_index" value="'+career_containerIndex+'">'
							+		'<div class="row formprofile_row">'
							+			'<div class="col-md-4 form-group formprofile_detail input">'
							+				'<label class="control-label profile_label" for="careerList['+career_containerIndex+'].career_institute">회사/단체명</label>'
							+				'<input type="text" id="careerList['+career_containerIndex+'].career_institute" name="careerList['+career_containerIndex+'].career_institute">'
							+			'</div>'
							+			'<div class="col-md-4 form-group formprofile_detail input">'
							+				'<label class="control-label profile_label" for="careerList['+career_containerIndex+'].career_start">활동시작</label>'
							+				'<input type="text" id="careerList['+career_containerIndex+'].career_start" name="careerList['+career_containerIndex+'].career_start" placeholder="예) 2015.05">'
							+			'</div>'
							+			'<div class="col-md-4 form-group formprofile_detail input">'
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
								<div class="formprofile lang_formcontainer" id="formprofile" class="col-lg-12">
								
								<c:forEach items="${langList }" var="langList" varStatus="status">
									<div class="lang_formcontainer[${status.index }]">
									<input type="hidden" id="lang_index" value="${status.index }">
										<div class="row formprofile_row">
											<div class="col-md-3 form-group formprofile_detail input">
												<label class="control-label profile_label" for="langList[${status.index }].lang_field">언어구분</label>
												<div>
												<select id="langList[${status.index }].lang_field" name="langList[${status.index }].lang_field" value="${langList.lang_field }">
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
												<label class="control-label profile_label" for="langList[${status.index }].lang_testname">언어자격증 명</label>
												<input type="text" id="langList[${status.index }].lang_testname" name="langList[${status.index }].lang_testname" placeholder="예) toeic" value="${langList.lang_testname }">
											</div>
											<div class="col-md-3 form-group formprofile_detail input">
												<label class="control-label profile_label" for="langList[${status.index }].lang_grade">점수/급수</label>
												<input type="text" id="langList[${status.index }].lang_grade" name="langList[${status.index }].lang_grade" value="${langList.lang_grade }">
											</div>
											<div class="col-md-3 form-group formprofile_detail input">
												<label class="control-label profile_label" for="langList[${status.index }].lang_getdate">취득일</label>
												<input type="text" id="langList[${status.index }].lang_getdate" name="langList[${status.index }].lang_getdate" placeholder="예) 2017.01" value="${langList.lang_getdate }">
											</div>
										</div>
									</div>
									<hr color="#808080">
								</c:forEach>
									
									<div id="space_lang_addForm"></div>
									<div class="row formprofile_row" style="text-align: center">
										<button type="button" class="btn" id="language_addbtn">
										<img id="addimg_btn" src="<%=request.getContextPath()%>/resources/resume/plus.PNG"><span><b> 어학 추가</b></span></button>
										<div><span id="language_addbtn_alert_span"></span></div>
									</div>
								</div>
								
				<!-- 어학form추가 script// 7개까지만 생성가능 -->
				<script type="text/javascript">
					var lang_containerIndex=$('.lang_formcontainer').children('div').find('#lang_index').length;
					console.log(lang_containerIndex);	
					
					$(document).ready(function(){
						$('#language_addbtn').click(function(){
							var langStr=
								'<div class="lang_formcontainer['+lang_containerIndex+']">'
							+	'<input type="hidden" id="lang_index" value="'+lang_containerIndex+'">'
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
								<div class="formprofile license_formcontainer" id="formprofile" class="col-lg-12">
								
							<c:forEach items="${licenseList }" var="licenseList" varStatus="status">	
									<div class="license_formcontainer[${status.index }]">
									<input type="hidden" id="license_index" value="${status.index }">
										<div class="row formprofile_row">
											<div class="col-md-4 form-group formprofile_detail input">
												<label class="control-label profile_label" for="licenseList[${status.index }].license_name">자격증 명</label>
												<input type="text" id="licenseList[${status.index }].license_name" name="licenseList[${status.index }].license_name" value="${licenseList.license_name }">
											</div>
											<div class="col-md-4 form-group formprofile_detail input">
												<label class="control-label profile_label" for="licenseList[${status.index }].license_co">발행기관</label>
												<input type="text" id="licenseList[${status.index }].license_co" name="licenseList[${status.index }].license_co" value="${licenseList.license_co }">
											</div>
											<div class="col-md-4 form-group formprofile_detail input">
												<label class="control-label profile_label" for="licenseList[${status.index }].license_getdate">취득일</label>
												<input type="text" id="licenseList[${status.index }].license_getdate" name="licenseList[${status.index }].license_getdate" placeholder="예) 2017.01" value="${licenseList.license_getdate }">
											</div>
										</div>
									</div>
									<hr color="#808080">
								</c:forEach>
									
									<div id="space_license_addForm"></div>
									<div class="row formprofile_row" style="text-align: center">
										<button type="button" class="btn" id="license_addbtn">
										<img id="addimg_btn" src="<%=request.getContextPath()%>/resources/resume/plus.PNG"><span><b> 자격증 추가</b></span></button>
										<div><span id="license_addbtn_alert_span"></span></div>
									</div>
								</div>	
								
				
				<!-- 자격증 form 추가 script // 7개까지 가능 -->
				<script type="text/javascript">
					var license_containerIndex=$('.license_formcontainer').children('div').find('#license_index').length;
					console.log(license_containerIndex);	
					
					$(document).ready(function(){
						$('#license_addbtn').click(function(){
							var licenseStr=
								'<div class="license_formcontainer['+license_containerIndex+']">'
							+	'<input type="hidden" id="license_index" value="'+license_containerIndex+'">'
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
											<input type="file" id="file" name="file" value="${portpolio.portpolio_file }" >${portpolio.portpolio_file }
										</div>
									</div>
									<div class="row formprofile_row" style="text-align: center">
										<span><b> 포트폴리오 파일은 하나만 업로드 할 수 있어요 ^^</b></span>
									</div>
								</div>
								
								
								
							<!-- 보유기술 : 선택 -->
							<label class="formprofile_name" for="formprofile">보유기술</label>
								<div class="formprofile skill_formcontainer" id="formprofile" class="col-lg-12">
								
							<c:forEach items="${skillList }" var="skillList" varStatus="status">
									<div class="skill_formcontainer[${status.index }]">
									<input type="hidden" id="skill_index" value="${status.index }">
										<div class="row formprofile_row">
											<div class="form-group formprofile_detail input">
												<label class="control-label profile_label" for="skillList[${status.index }].skill_name">보유기술</label>
												<input type="text" id="skillList[${status.index }].skill_name" name="skillList[${status.index }].skill_name" 
														placeholder="예) HTML5 / CSS5 , JQuery, JAVA, JSP, Eclipse" value="${skillList.skill_name }">
											</div>
										</div>
									</div>	
									<hr color="#808080">
							</c:forEach>		
							
									<div id="space_skill_addForm"></div>
									<div class="row formprofile_row" style="text-align: center">
										<button type="button" class="btn" id="skill_addbtn">
										<img id="addimg_btn" src="<%=request.getContextPath()%>/resources/resume/plus.PNG"><span><b> 보유기술 추가</b></span></button>
										<div><span id="skill_addbtn_alert_span"></span></div>
									</div>
								</div>
					
					
					<!-- 보유기술 form 추가 script // 5개까지 입력가능 -->			
					<script type="text/javascript">
						var skill_containerIndex= $('.skill_formcontainer').children('div').find('#skill_index').length;
						console.log(skill_containerIndex);
						
						$(document).ready(function(){
							$('#skill_addbtn').click(function(){
								var skillStr=
									'<div class="skill_formcontainer['+skill_containerIndex+']">'
								+	'<input type="hidden" id="license_index" value="'+skill_containerIndex+'">'
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
								<div class="formprofile award_formcontainer" id="formprofile" class="col-lg-12">
							
								<c:forEach items="${awardList }" var="awardList" varStatus="status">
									<div class="award_formcontainer[${status.index }]">
									<input type="hidden" id="award_index" value="${status.index }">						
										<div class="row formprofile_row">
											<div class="col-md-4 form-group formprofile_detail input">
												<label class="control-label profile_label" for="awardList[${status.index }].award_name">수상명</label>
												<input type="text" id="awardList[${status.index }].award_name" name="awardList[${status.index }].award_name" value="${awardList.award_name }">
											</div>
											<div class="col-md-4 form-group formprofile_detail input">
												<label class="control-label profile_label" for="awardList[${status.index }].award_co">수여기관</label>
												<input type="text" id="awardList[${status.index }].award_co" name="awardList[${status.index }].award_co" value="${awardList.award_co }">
											</div>
											<div class="col-md-4 form-group formprofile_detail input">
												<label class="control-label profile_label" for="awardList[${status.index }].award_year">수상연도</label>
												<input type="text" id="awardList[${status.index }].award_year" name="awardList[${status.index }].award_year" placeholder="예) 2017" value="${awardList.award_year }">
											</div>
										</div>
										
										<div class="row formprofile_row">
											<div class="form-group formprofile_detail input">
												<label class="control-label profile_label" for="awardList[${status.index }].award_activity">수여내용</label>
												<input type="text" id="awardList[${status.index }].award_activity" name="awardList[${status.index }].award_activity" 
														placeholder="수여 내용 및 결과를 자세히 입력해주세요." value="${awardList.award_activity }">
											</div>
										</div>
									</div>	
									<hr color="#808080">
								</c:forEach>
									
									<div id="space_award_addForm"></div>
									<div class="row formprofile_row" style="text-align: center">
										<button type="button" class="btn" id="award_addbtn">
										<img id="addimg_btn" src="<%=request.getContextPath()%>/resources/resume/plus.PNG"><span><b> 수상항목 추가</b></span></button>
										<div><span id="award_addbtn_alert_span"></span></div>
									</div>
								</div>
							
			

				<!-- 수상 form 추가 script // 5개까지 입력가능 -->			
				<script type="text/javascript">
					var award_containerIndex=$('.award_formcontainer').children('div').find('#award_index').length;
					console.log(award_containerIndex);
					
					$(document).ready(function(){
						$('#award_addbtn').click(function(){
							var awardStr=
								'<div class="award_formcontainer['+award_containerIndex+']">'
							+	'<input type="hidden" id="award_index" value="'+award_containerIndex+'">'
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
					
					
<!-- ////////////////////////////////////////   자기소개서       /////////////////////////////////////////////////////////////////////// -->					
					
               
      <label class="formprofile_name" for="formprofile">자기소개서</label>
            <div class="formprofile question_formcontainer" id="formprofile" class="col-lg-12">
            
         <c:forEach items="${questionList }" var="questionList" varStatus="status">   
               <div class="question_formcontainer${status.index }">
                  <input type="hidden" id="question_index" value="${status.index }">
                  <div class="row formprofile_row">
                     <div class="col-md-10 form-group formprofile_detail input">
                        <label class="control-label profile_label" for="coverletterList2.intro_no"> 항목 ${status.index +1} </label>
                        <input id="coverletterList2.intro_no" name="coverletterList2[${status.index }].intro_no" value="${questionList.intro_no }" readonly style="background-color: transparent;">
                     </div>
                     <div class="col-md-2 form-group formprofile_detail input">
                        <label class="control-label profile_label" for="coverletterList2.intro_lim">글자 수</label>
                        <input id="coverletterList2.intro_lim" name="coverletterList2[${status.index }].intro_lim" value="${questionList.intro_lim }" readonly style="background-color: transparent;">
                     </div>
                     <div class="form-group formprofile_detail input">
                        <textarea id="coverletterList2_resu_ctmt${status.index }" name="coverletterList2[${status.index }].resu_ctmt" rows="10" cols="92%" placeholder="기업에게 자신을 소개해주세요!"></textarea>      
                     </div>
                  </div>
               </div>
               <hr color="#808080">
               <input type="hidden" id="pick_no" name="coverletterList2[${status.index }].pick_no" value="${questionList.pick_no }">
               <input type="hidden" id="pick_code" name="coverletterList2[${status.index }].pick_code" value="${questionList.pick_code }">
         </c:forEach>      
            </div>
         
<!-- //////////////////////////////////////////자기소개서 끝 ////////////////////////////////////////////////////////////////////////// -->               
               
					<!-- 이력서/자기소개서 등록시 버튼!! -->	
					<div style="text-align: center; margin-bottom: 40px;">
						<input type="hidden" id="paper_status" name="paper_status" value="">
						<input type="hidden" id="edit_status" name="edit_status" value=""> <!-- 임시저장을 누르면 edit_status=0, 제출버튼 누르면 다른값???  -->
						<input type="button" class="btn btn-lg btn-primary" id="justSaveResumeBtn" value="임시저장" onclick="saveORsubmbitResume(0)">
						<input type="button" class="btn btn-lg btn-primary" id="submitResumeToComp" value="제   출" onclick="saveORsubmbitResume(1)">
						<input type="button" class="btn btn-lg btn-primary" id="viewCompanyNotice" value="공고보기">		
					</div>
					
				</form>  <!-- 이력서랑 자소서 한꺼번에 insert 시키기위해 -->
				
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
	
});

function saveORsubmbitResume(status_resume){
	
	if(status_resume =='0'){   //임시저장버튼 click
		$('#paper_status').val(status_resume);   //paper_status = 0
		$('#edit_status').val(status_resume);    //edit_status=0 
		console.log($('#paper_status').val());
		console.log($('#edit_status').val());
		
	}else if(status_resume=='1'){  //제출완료버튼 click
		$('#paper_status').val(status_resume);	 //paper_status = 1
		$('#edit_status').val(4);				//edit_status=4
		console.log($('#paper_status').val());	
		console.log($('#edit_status').val());
	}
	$('#applyResumeForm').submit();
}

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

