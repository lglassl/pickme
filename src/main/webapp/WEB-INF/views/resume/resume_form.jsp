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
							<div id="edu_formcontainer0">
								<div class="row formprofile_row">
									<div class="col-md-3 formprofile_detail input">
										<label class="control-label profile_label" for="eduList0_edu_institute">학교명</label>
										<input type="text" id="eduList0_edu_institute" name="eduList[0].edu_institute">
									</div>
									<div class="col-md-3 formprofile_detail input">
										<label class="control-label profile_label" for="eduList0_edu_start">입학년월</label>
										<input type="text" id="eduList0_edu_start" name="eduList[0].edu_start" placeholder="예) 2015.05">
									</div>
									<div class="col-md-3 formprofile_detail input">
										<label class="control-label profile_label" for="eduList0_edu_end">졸업년월</label>
										<input type="text" id="eduList0_edu_end" name="eduList[0].edu_end" placeholder="예) 2015.05">
									</div>
									<div class="col-md-3 formprofile_detail input">
										<label class="control-label profile_label" for="eduList0_edu_category">구분</label>
										<div><select id="eduList0_edu_category" name="eduList[0].edu_category">
											<option value="재학중">재학중</option>
											<option value="졸업예정">졸업예정</option>
											<option value="졸업">졸업</option>
										</select></div>
									</div>
								</div>
								<div class="row formprofile_row">
									<div class="col-md-4 formprofile_detail input">
										<label class="control-label profile_label" for="eduList0_edu_major">전공</label>
										<input type="text" id="eduList0_edu_major" name="eduList[0].edu_major">
									</div>
									<div class="col-md-4 formprofile_detail input">
										<label class="control-label profile_label" for="eduList0_edu_grade">학점</label>
										<input type="text" id="eduList0_edu_grade" name="eduList[0].edu_grade" placeholder="평점/총점">
									</div>
								</div>
							</div>
							<hr color="#808080">
							<div id="space_edu_addForm"></div>
							<div class="row formprofile_row" style="text-align: center">
									<button type="button" class="btn" id="edu_addbtn" style="background-color: transparent;">
									<img id="addimg_btn" src="<%=request.getContextPath()%>/resources/resume/plus.PNG"><span><b> 학력 추가</b></span></button>
									<button type="button" class="btn remove_btn" style="background-color: transparent;">
									<img id="rmvimg_btn" src="<%=request.getContextPath()%>/resources/resume/minus.PNG"><span><b> 삭제</b></span></button>
									<div><span id="edu_addbtn_alert_span"></span></div>
							</div>
						</div>
						
				
				
						
					<!-- 경력 :필수-->
					<label class="formprofile_name" for="formprofile">경력 /인턴/대외활동</label>
						<div class="formprofile" id="formprofile" class="col-lg-12">
							<div class="career_formcontainer0">
								<div class="row formprofile_row">
									<div class="col-md-4 formprofile_detail input">
										<label class="control-label profile_label" for="careerList0_career_institute">회사/단체명</label>
										<input type="text" id="careerList0_career_institute" name="careerList[0].career_institute">
									</div>
									<div class="col-md-4 formprofile_detail input">
										<label class="control-label profile_label" for="careerList0_career_start">활동시작</label>
										<input type="text" id="careerList0_career_start" name="careerList[0].career_start" placeholder="예) 2015.05">
									</div>
									<div class="col-md-4 formprofile_detail input">
										<label class="control-label profile_label" for="careerList0_career_end">활동종료</label>
										<input type="text" id="careerList0_career_end" name="careerList[0].career_end" placeholder="예) 2015.05">
									</div>
								</div>
								<div class="row formprofile_row">
									<div class="form-group formprofile_detail input">
										<label class="control-label profile_label" for="careerList0_career_task">담당직책/지위</label>
										<input type="text" id="careerList0_career_task" name="careerList[0].career_task">
									</div>
									<div class="form-group formprofile_detail input">
										<label class="control-label profile_label" for="careerList0_career_activity">담당업무</label>
										<input type="text" id="careerList0_career_activity" name="careerList[0].career_activity" placeholder="담당하신 업무의 성과에 대해 간단 명료하게 작성해주세요.">
									</div>
								</div>
							</div>
							<hr color="#808080">
							<div id="space_career_addForm"></div>
							<div class="row formprofile_row" style="text-align: center">
								<button type="button" class="btn" id="career_addbtn" style="background-color: transparent;">
								<img id="addimg_btn" src="<%=request.getContextPath()%>/resources/resume/plus.PNG"><span><b> 경력 추가</b></span></button>
								<button type="button" class="btn remove_btn" style="background-color: transparent;">
								<img id="rmvimg_btn" src="<%=request.getContextPath()%>/resources/resume/minus.PNG"><span><b> 삭제</b></span></button>
								<div><span id="career_addbtn_alert_span"></span></div>
							</div>
						</div>
				
				
				
				
					<!-- 어학 :필수 -->
					<label class="formprofile_name" for="formprofile">어학</label>
						<div class="formprofile" id="formprofile" class="col-lg-12">
							<div class="lang_formcontainer0">
								<div class="row formprofile_row">
									<div class="col-md-3 form-group formprofile_detail input">
										<label class="control-label profile_label" for="langList0_lang_field">언어구분</label>
										<div>
										<select id="langList0_lang_field" name="langList[0].lang_field">
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
										<label class="control-label profile_label" for="langList0_lang_testname">언어자격증 명</label>
										<input type="text" id="langList0_lang_testname" name="langList[0].lang_testname" placeholder="예) toeic">
									</div>
									<div class="col-md-3 form-group formprofile_detail input">
										<label class="control-label profile_label" for="langList0_lang_grade">점수/급수</label>
										<input type="text" id="langList0_lang_grade" name="langList[0].lang_grade">
									</div>
									<div class="col-md-3 form-group formprofile_detail input">
										<label class="control-label profile_label" for="langList0_lang_getdate">취득일</label>
										<input type="text" id="langList0_lang_getdate" name="langList[0].lang_getdate" placeholder="예) 2017.01">
									</div>
								</div>
							</div>
							<hr color="#808080">
							<div id="space_lang_addForm"></div>
							<div class="row formprofile_row" style="text-align: center">
								<button type="button" class="btn" id="language_addbtn" style="background-color: transparent;">
								<img id="addimg_btn" src="<%=request.getContextPath()%>/resources/resume/plus.PNG"><span><b> 어학 추가</b></span></button>
								<button type="button" class="btn remove_btn" style="background-color: transparent;">
								<img id="rmvimg_btn" src="<%=request.getContextPath()%>/resources/resume/minus.PNG"><span><b> 삭제</b></span></button>	
								<div><span id="language_addbtn_alert_span"></span></div>
							</div>
						</div>
						
						
						
					<!-- 자격증 : 필수 -->
					<label class="formprofile_name" for="formprofile">자격증</label>
						<div class="formprofile" id="formprofile" class="col-lg-12">
							<div class="license_formcontainer0">
								<div class="row formprofile_row">
									<div class="col-md-4 form-group formprofile_detail input">
										<label class="control-label profile_label" for="licenseList0_license_name">자격증 명</label>
										<input type="text" id="licenseList0_license_name" name="licenseList[0].license_name" >
									</div>
									<div class="col-md-4 form-group formprofile_detail input">
										<label class="control-label profile_label" for="licenseList0_license_co">발행기관</label>
										<input type="text" id="licenseList0_license_co" name="licenseList[0].license_co">
									</div>
									<div class="col-md-4 form-group formprofile_detail input">
										<label class="control-label profile_label" for="licenseList0_license_getdate">취득일</label>
										<input type="text" id="licenseList0_license_getdate" name="licenseList[0].license_getdate" placeholder="예) 2017.01">
									</div>
								</div>
							</div>
							<hr color="#808080">
							<div id="space_license_addForm"></div>
							<div class="row formprofile_row" style="text-align: center">
								<button type="button" class="btn" id="license_addbtn" style="background-color: transparent;">
								<img id="addimg_btn" src="<%=request.getContextPath()%>/resources/resume/plus.PNG"><span><b> 자격증 추가</b></span></button>
								<button type="button" class="btn remove_btn" style="background-color: transparent;">
								<img id="rmvimg_btn" src="<%=request.getContextPath()%>/resources/resume/minus.PNG"><span><b> 삭제</b></span></button>	
								<div><span id="license_addbtn_alert_span"></span></div>
							</div>
						</div>	
						
		
						
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
										<label class="control-label profile_label" for="skillList0_skill_name">보유기술</label>
										<input type="text" id="skillList0_skill_name" name="skillList[0].skill_name" placeholder="예) HTML5 / CSS5 , JQuery, JAVA, JSP, Eclipse" >
									</div>
								</div>
							</div>	
							<hr color="#808080">
							<div id="space_skill_addForm"></div>
							<div class="row formprofile_row" style="text-align: center">
								<button type="button" class="btn" id="skill_addbtn" style="background-color: transparent;">
								<img id="addimg_btn" src="<%=request.getContextPath()%>/resources/resume/plus.PNG"><span><b> 보유기술 추가</b></span></button>
								<button type="button" class="btn remove_btn" style="background-color: transparent;">
								<img id="rmvimg_btn" src="<%=request.getContextPath()%>/resources/resume/minus.PNG"><span><b> 삭제</b></span></button>	
								<div><span id="skill_addbtn_alert_span"></span></div>
							</div>
						</div>
			
				
								
					<!-- 수상 : 선택 -->
					<label class="formprofile_name" for="formprofile">수상</label>
						<div class="formprofile" id="formprofile" class="col-lg-12">
							<div class="award_formcontainer0">
								<div class="row formprofile_row">
									<div class="col-md-4 form-group formprofile_detail input">
										<label class="control-label profile_label" for="awardList0_award_name">수상명</label>
										<input type="text" id="awardList0_award_name" name="awardList[0].award_name">
									</div>
									<div class="col-md-4 form-group formprofile_detail input">
										<label class="control-label profile_label" for="awardList0_award_co">수여기관</label>
										<input type="text" id="awardList0_award_co" name="awardList[0].award_co">
									</div>
									<div class="col-md-4 form-group formprofile_detail input">
										<label class="control-label profile_label" for="awardList0_award_year">수상연도</label>
										<input type="text" id="awardList0_award_year" name="awardList[0].award_year" placeholder="예) 2017" >
									</div>
								</div>
								<div class="row formprofile_row">
									<div class="form-group formprofile_detail input">
										<label class="control-label profile_label" for="awardList0_award_activity">수여내용</label>
										<input type="text" id="awardList0_award_activity" name="awardList[0].award_activity" placeholder="수여 내용 및 결과를 자세히 입력해주세요.">
									</div>
								</div>
							</div>
							<hr color="#808080">
							<div id="space_award_addForm"></div>
							<div class="row formprofile_row" style="text-align: center">
								<button type="button" class="btn" id="award_addbtn" style="background-color: transparent;">
								<img id="addimg_btn" src="<%=request.getContextPath()%>/resources/resume/plus.PNG"><span><b> 수상항목 추가</b></span></button>
								<button type="button" class="btn remove_btn" style="background-color: transparent;">
								<img id="rmvimg_btn" src="<%=request.getContextPath()%>/resources/resume/minus.PNG"><span><b> 삭제</b></span></button>	
								<div><span id="award_addbtn_alert_span"></span></div>
							</div>
						</div>	
			
			

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

<script type="text/javascript">

	$(document).ready(function(){
		
		var containerIndex;
		
		/* 학력form추가 script// 5개까지만 생성가능  */		
		$('#edu_addbtn').click(function(){
			containerIndex =$(this).parents('div .formprofile').find('.remove_flag_div').length +1;
			
			var eduStr=
				'<div class="remove_flag_div" id="edu_formcontainer'+containerIndex +'">'
			+		'<div class="row formprofile_row">'
			+			'<div class="col-md-3 formprofile_detail input">'
			+				'<label class="control-label profile_label" for="eduList'+containerIndex+'_edu_institute">학교명</label>'
			+				'<input type="text" id="eduList'+containerIndex+'_edu_institute" name="eduList['+containerIndex+'].edu_institute">'
			+			'</div>'
			+			'<div class="col-md-3 formprofile_detail input">'
			+				'<label class="control-label profile_label" for="eduList'+containerIndex+'_edu_start">입학년월</label>'
			+				'<input type="text" id="eduList'+containerIndex+'_edu_start" name="eduList['+containerIndex+'].edu_start" placeholder="예) 2015.05">'    
			+			'</div>'
			+			'<div class="col-md-3 formprofile_detail input">'
			+				'<label class="control-label profile_label" for="eduList'+containerIndex+'_edu_end">졸업년월</label>'
			+				'<input type="text" id="eduList'+containerIndex+'_edu_end" name="eduList['+containerIndex+'].edu_end" placeholder="예) 2015.05">'
			+			'</div>'
			+			'<div class="col-md-3 formprofile_detail input">'
			+				'<label class="control-label profile_label" for="eduList'+containerIndex+'_edu_category">구분</label>'
			+				'<div><select id="eduList'+containerIndex+'_edu_category" name="eduList['+containerIndex+'].edu_category">'
			+					'<option value="재학중">재학중</option>'
			+					'<option value="졸업예정">졸업예정</option>'
			+					'<option value="졸업">졸업</option>'
			+				'</select></div>'
			+			'</div>'
			+		'</div>'
			+		'<div class="row formprofile_row">'
			+			'<div class="col-md-4 formprofile_detail input">'
			+				'<label class="control-label profile_label" for="eduList'+containerIndex+'_edu_major">전공</label>'
			+				'<input type="text" id="eduList'+containerIndex+'_edu_major" name="eduList['+containerIndex+'].edu_major">'
			+			'</div>'
			+			'<div class="col-md-4 formprofile_detail input">'
			+				'<label class="control-label profile_label" for="eduList'+containerIndex+'_edu_grade">학점</label>'
			+				'<input type="text" id="eduList'+containerIndex+'_edu_grade" name="eduList['+containerIndex+'].edu_grade" placeholder="평점/총점">'
			+			'</div>'
			+		'</div>'
			+	'</div>'
			+   '<hr color="#808080">';
			
			console.log('edu_addbtn 클릭');
			$('#space_edu_addForm').append(eduStr);
			console.log('현재 remove_flag_div 갯수 : ' +containerIndex);
			
			console.log(containerIndex);
			if(containerIndex >= 4 ){
				$('#edu_addbtn').prop("disabled", true);
				$('#edu_addbtn_alert_span').html('학력 항목은 5개까지 입력 가능합니다!')
			}
			
			if( $(this).parents('div .formprofile').find('.remove_flag_div').length > 0 ){
				$(this).next().prop("disabled", false);   // 1번째 div 초과면 '삭제'버튼 '활성화'
			}
		});
		
		
		
		/* 경력form추가 script// 7개까지만 생성가능 */
		$('#career_addbtn').click(function(){
			containerIndex =$(this).parents('div .formprofile').find('.remove_flag_div').length +1;
			console.log('현재 remove_flag_div 갯수 : ' +containerIndex);
			
			var careerStr =
				'<div class="remove_flag_div" id="career_formcontainer'+containerIndex+'">'
			+		'<div class="row formprofile_row">'
			+			'<div class="col-md-4 formprofile_detail input">'
			+				'<label class="control-label profile_label" for="careerList'+containerIndex+'_career_institute">회사/단체명</label>'
			+				'<input type="text" id="careerList'+containerIndex+'_career_institute" name="careerList['+containerIndex+'].career_institute">'
			+			'</div>'
			+			'<div class="col-md-4 formprofile_detail input">'
			+				'<label class="control-label profile_label" for="careerList'+containerIndex+'_career_start">활동시작</label>'
			+				'<input type="text" id="careerList'+containerIndex+'_career_start" name="careerList['+containerIndex+'].career_start" placeholder="예) 2015.05">'
			+			'</div>'
			+			'<div class="col-md-4 formprofile_detail input">'
			+				'<label class="control-label profile_label" for="careerList'+containerIndex+'_career_end">활동종료</label>'
			+				'<input type="text" id="careerList'+containerIndex+'_career_end" name="careerList['+containerIndex+'].career_end" placeholder="예) 2015.05">'
			+			'</div>'
			+		'</div>'
			+		'<div class="row formprofile_row">'
			+			'<div class="form-group formprofile_detail input">'
			+				'<label class="control-label profile_label" for="careerList'+containerIndex+'_career_task">담당직책/지위</label>'
			+				'<input type="text" id="careerList'+containerIndex+'_career_task" name="careerList['+containerIndex+'].career_task">'
			+			'</div>'
			+			'<div class="form-group formprofile_detail input">'
			+				'<label class="control-label profile_label" for="careerList'+containerIndex+'_career_activity">담당업무</label>'
			+				'<input type="text" id="careerList'+containerIndex+'_career_activity" name="careerList['+containerIndex+'].career_activity" placeholder="담당하신 업무의 성과에 대해 간단 명료하게 작성해주세요.">'
			+			'</div>'
			+		'</div>'
			+	'</div>'
			+	'<hr color="#808080">';
			
			console.log('경력추가 버튼 누름');
			$('#space_career_addForm').append(careerStr);
			
			if(containerIndex >=6){
				$('#career_addbtn').prop("disabled", true);
				$('#career_addbtn_alert_span').html('경력항목은 7개까지 입력가능합니다!');
			}
			
			if( $(this).parents('div .formprofile').find('.remove_flag_div').length > 0 ){
				$(this).next().prop("disabled", false);   // 1번째 div 초과면 '삭제'버튼 '활성화'
			}
		});
		
		
		/* 어학form추가 script// 7개까지만 생성가능 */
		$('#language_addbtn').click(function(){
			containerIndex =$(this).parents('div .formprofile').find('.remove_flag_div').length +1;
			
			var langStr=
				'<div class="remove_flag_div" id="lang_formcontainer'+containerIndex+'">'
			+		'<div class="row formprofile_row">'
			+			'<div class="col-md-3 form-group formprofile_detail input">'
			+				'<label class="control-label profile_label" for="langList'+containerIndex+'_lang_field">언어구분</label>'
			+				'<div>'
			+				'<select id="langList'+containerIndex+'_lang_field" name="langList['+containerIndex+'].lang_field">'
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
			+				'<label class="control-label profile_label" for="langList'+containerIndex+'_lang_testname">언어자격증 명</label>'
			+				'<input type="text" id="langList'+containerIndex+'_lang_testname" name="langList['+containerIndex+'].lang_testname" placeholder="예) toeic">'
			+			'</div>'
			+			'<div class="col-md-3 form-group formprofile_detail input">'
			+				'<label class="control-label profile_label" for="langList'+containerIndex+'_lang_grade">점수/급수</label>'
			+				'<input type="text" id="langList'+containerIndex+'_lang_grade" name="langList['+containerIndex+'].lang_grade">'
			+			'</div>'
			+			'<div class="col-md-3 form-group formprofile_detail input">'
			+				'<label class="control-label profile_label" for="langList'+containerIndex+'_lang_getdate">취득일</label>'
			+				'<input type="text" id="langList'+containerIndex+'_lang_getdate" name="langList['+containerIndex+'].lang_getdate" placeholder="예) 2017.01">'
			+			'</div>'
			+		'</div>'
			+	'</div>'
			+   '<hr color="#808080">';
			
			console.log('어학 추가 버튼 누름');
			$('#space_lang_addForm').append(langStr);
			console.log('현재 remove_flag_div 갯수 : ' +containerIndex);
			
			if(containerIndex >= 6){
				$('#language_addbtn').prop("disabled", true);
				$('#language_addbtn_alert_span').html('어학 항목은 7개까지 입력가능합니다!');
			}
			if( $(this).parents('div .formprofile').find('.remove_flag_div').length > 0 ){
				$(this).next().prop("disabled", false);   // 1번째 div 초과면 '삭제'버튼 '활성화'
			}
			
		});
		
		
		/* 자격증 form 추가 script // 7개까지 가능  */
		$('#license_addbtn').click(function(){
			containerIndex =$(this).parents('div .formprofile').find('.remove_flag_div').length +1;
			
			var licenseStr=
				'<div class="remove_flag_div" id="license_formcontainer'+containerIndex+'">'
			+		'<div class="row formprofile_row">'
			+			'<div class="col-md-4 form-group formprofile_detail input">'
			+				'<label class="control-label profile_label" for="licenseList'+containerIndex+'_license_name">자격증 명</label>'
			+				'<input type="text" id="licenseList'+containerIndex+'_license_name" name="licenseList['+containerIndex+'].license_name">'
			+			'</div>'
			+			'<div class="col-md-4 form-group formprofile_detail input">'
			+				'<label class="control-label profile_label" for="licenseList'+containerIndex+'_license_co">발행기관</label>'
			+				'<input type="text" id="licenseList'+containerIndex+'_license_co" name="licenseList['+containerIndex+'].license_co">'
			+			'</div>'
			+			'<div class="col-md-4 form-group formprofile_detail input">'
			+				'<label class="control-label profile_label" for="licenseList'+containerIndex+'_license_getdate">취득일</label>'
			+				'<input type="text" id="licenseList'+containerIndex+'_license_getdate" name="licenseList['+containerIndex+'].license_getdate" placeholder="예) 2017.01">'
			+			'</div>'
			+		'</div>'
			+	'</div>'
			+	'<hr color="#808080">';
			
			console.log('자격증 추가 버튼 누름');
			$('#space_license_addForm').append(licenseStr);
			console.log('현재 remove_flag_div 갯수 : ' +containerIndex);
			
			if(containerIndex >= 6){
				$('#license_addbtn').prop("disabled", true);
				$('#license_addbtn_alert_span').html('자격증 항목은 7개까지 입력가능합니다!');
			}
			if( $(this).parents('div .formprofile').find('.remove_flag_div').length > 0 ){
				$(this).next().prop("disabled", false);   // 1번째 div 초과면 '삭제'버튼 '활성화'
			}
		});
		
		
		
		/* 보유기술 form 추가 script // 5개까지 입력가능 */
		$('#skill_addbtn').click(function(){
			containerIndex =$(this).parents('div .formprofile').find('.remove_flag_div').length +1;
			
			var skillStr=
				'<div class="remove_flag_div" id="skill_formcontainer'+containerIndex+'">'
			+		'<div class="row formprofile_row">'
			+			'<div class="form-group formprofile_detail input">'
			+				'<label class="control-label profile_label" for="skillList'+containerIndex+'_skill_name">보유기술</label>'
			+				'<input type="text" id="skillList'+containerIndex+'_skill_name" name="skillList['+containerIndex+'].skill_name" placeholder="예) HTML5 / CSS5 , JQuery, JAVA, JSP, Eclipse" >'
			+			'</div>'
			+		'</div>'
			+	'</div>'	
			+	'<hr color="#808080">';
			
			console.log('보유기술 추가 버튼 누름');
			$('#space_skill_addForm').append(skillStr);
			console.log('현재 remove_flag_div 갯수 : ' +containerIndex);
			
			if(containerIndex >= 4){
				$('#skill_addbtn').prop("disabled", true);
				$('#skill_addbtn_alert_span').html('보유기술 항목은 5개까지 입력가능합니다!');
			}
			if( $(this).parents('div .formprofile').find('.remove_flag_div').length > 0 ){
				$(this).next().prop("disabled", false);   // 1번째 div 초과면 '삭제'버튼 '활성화'
			}
		});
		
		
		
		/* 수상 form 추가 script // 5개까지 입력가능 */
		$('#award_addbtn').click(function(){
			containerIndex =$(this).parents('div .formprofile').find('.remove_flag_div').length +1;
			
			var awardStr=
				'<div class="remove_flag_div" id="award_formcontainer'+containerIndex+'">'
			+		'<div class="row formprofile_row">'
			+			'<div class="col-md-4 form-group formprofile_detail input">'
			+				'<label class="control-label profile_label" for="awardList'+containerIndex+'_award_name">수상명</label>'
			+				'<input type="text" id="awardList'+containerIndex+'_award_name" name="awardList['+containerIndex+'].award_name">'
			+			'</div>'
			+			'<div class="col-md-4 form-group formprofile_detail input">'
			+				'<label class="control-label profile_label" for="awardList'+containerIndex+'_award_co">수여기관</label>'
			+				'<input type="text" id="awardList'+containerIndex+'_award_co" name="awardList['+containerIndex+'].award_co">'
			+			'</div>'
			+			'<div class="col-md-4 form-group formprofile_detail input">'
			+				'<label class="control-label profile_label" for="awardList'+containerIndex+'_award_year">수상연도</label>'
			+				'<input type="text" id="awardList'+containerIndex+'_award_year" name="awardList['+containerIndex+'].award_year" placeholder="예) 2017" >'
			+			'</div>'
			+		'</div>'
			+		'<div class="row formprofile_row">'
			+			'<div class="form-group formprofile_detail input">'
			+				'<label class="control-label profile_label" for="awardList'+containerIndex+'_award_activity">수여내용</label>'
			+				'<input type="text" id="awardList'+containerIndex+'_award_activity" name="awardList['+containerIndex+'].award_activity" placeholder="수여 내용 및 결과를 자세히 입력해주세요.">'
			+			'</div>'
			+		'</div>'
			+	'</div>'
			+	'<hr color="#808080">'
				
			console.log('수상 추가 버튼 누름');
			$('#space_award_addForm').append(awardStr);
			console.log('현재 remove_flag_div 갯수 : ' +containerIndex);
			
			if(containerIndex >= 4){
				$('#award_addbtn').prop("disabled", true);
				$('#award_addbtn_alert_span').html('수상 항목은 5개까지 입력가능합니다!');
			}
			
			if( $(this).parents('div .formprofile').find('.remove_flag_div').length > 0 ){
				$(this).next().prop("disabled", false);   // 1번째 div 초과면 '삭제'버튼 '활성화'
			}
		});
		
		
		/* ---------------------------------------------------------------------------  */
		
		
		/* 삭제 버튼 */
		$('.remove_btn').click(function(){
			console.log($(this));
			var targetDiv = $(this).parents('div .formprofile').find('.remove_flag_div').last();
			targetDiv.next().remove();   //hr지우기
			targetDiv.remove();	  		// 마지막 remove_flag_div 지우기
			$(this).prop("disabled", false);  
			$(this).prev().prop("disabled", false);    // 추가 버튼 활성화
			$(this).next('div').empty();
			
			if( $(this).parents('div .formprofile').find('.remove_flag_div').length ==0 ){
				$(this).prop("disabled", true);   // 1번째 div남으면 '삭제'버튼 '비활성화'
			}
			
			
		});
	});
</script>
						



<!-- 등록 버튼 누르면!! -->
<script type="text/javascript">
$(document).ready(function(){
	$('#enrollResumeBtn').click(function(){
		$("#resumeEnrollForm").attr("action", "resume/insert.htm").submit();
	});
});

</script>


<!-- 간단한 유효성 검사 -->
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


