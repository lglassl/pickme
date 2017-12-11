<%-- 
   @JSP : apply.jsp
   @Date : 2017-12-04
   @Author : 박현지
   @Desc : 특정 채용공고 지원하기 button 클릭시, 초기이력서 불러오고, 자기소개서항목 불러오고, resume table에 insert 시키기
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!-- progress bar -->  
  <link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
  <script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
  <script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>

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
					<div class="col-lg-12" class="label" style="text-align: center"><h2>%%기업 이력서자기소개서 수정</h2></div>
					<form action="applyupdate.htm" method="POST" id="applyUpdateResumeForm" enctype="multipart/form-data">
					
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
						
						<c:forEach items="${eduList2}" var="eduList" varStatus="status">
							<div class="formcontainerIndex">
							<input type="hidden" id="edu_index" value="${status.index }">
								<div class="row formprofile_row">
									<div class="col-md-3 form-group formprofile_detail input">
										<label class="control-label profile_label" for="eduList2_${status.index}_edu_institute">학교명</label>
										<input type="text" id="eduList2_${status.index}_edu_institute" name="eduList2[${status.index}].edu_institute" value="${eduList.edu_institute}">
									</div>
									<div class="col-md-3 form-group formprofile_detail input">
										<label class="control-label profile_label" for="eduList2_${status.index}_edu_start">입학년월</label>
										<input type="text" id="eduList2_${status.index}_edu_start" name="eduList2[${status.index}].edu_start" placeholder="예) 2015.05" value="${eduList.edu_start}">
									</div>
									<div class="col-md-3 form-group formprofile_detail input">
										<label class="control-label profile_label" for="eduList2_${status.index}_edu_end">졸업년월</label>
										<input type="text" id="eduList2_${status.index}_edu_end" name="eduList2[${status.index}].edu_end" placeholder="예) 2015.05" value="${eduList.edu_end}">
									</div>
									<div class="col-md-3 form-group formprofile_detail input">
										<label class="control-label profile_label" for="eduList2_${status.index}_edu_category">구분</label>
										<div><select id="eduList2_${status.index}_edu_category" name="eduList2[${status.index}].edu_category" value="${eduList.edu_category}">
											<option value="재학중">재학중</option>
											<option value="졸업예정">졸업예정</option>
											<option value="졸업">졸업</option>
										</select></div>
									</div>
								</div>
								<div class="row formprofile_row">
									<div class="col-md-4 form-group formprofile_detail input">
										<label class="control-label profile_label" for="eduList2_${status.index}_edu_major">전공</label>
										<input type="text" id="eduList2_${status.index}_edu_major" name="eduList2[${status.index}].edu_major" value="${eduList.edu_major}">
									</div>
									<div class="col-md-4 form-group formprofile_detail input">
										<label class="control-label profile_label" for="eduList2_${status.index}_edu_grade">학점</label>
										<input type="text" id="eduList2_${status.index}_edu_grade" name="eduList2[${status.index}].edu_grade" placeholder="평점/총점"value="${eduList.edu_grade}">
									</div>
								</div>
							</div>
							<hr color="#808080">
					</c:forEach>	
						
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
							<div class="formprofile career_formcontainer" id="formprofile" class="col-lg-12">
							
							<c:forEach items="${careerList2}" var="careerList" varStatus="status">
								<div class="formcontainerIndex">
								<input type="hidden" id="career_index" value="${status.index }">
									<div class="row formprofile_row">
										<div class="col-md-4 form-group formprofile_detail input">
											<label class="control-label profile_label" for="careerList2_${status.index }_career_institute">회사/단체명</label>
											<input type="text" id="careerList2_${status.index }_career_institute" name="careerList2[${status.index }].career_institute" value="${careerList.career_institute }">
										</div>
										<div class="col-md-4 form-group formprofile_detail input">
											<label class="control-label profile_label" for="careerList2_${status.index }_career_start">활동시작</label>
											<input type="text" id="careerList2_${status.index }_career_start" name="careerList2[${status.index }].career_start" placeholder="예) 2015.05" value="${careerList.career_start }">
										</div>
										<div class="col-md-4 form-group formprofile_detail input">
											<label class="control-label profile_label" for="careerList2_${status.index }_career_end">활동종료</label>
											<input type="text" id="careerList2_${status.index }_career_end" name="careerList2[${status.index }].career_end" placeholder="예) 2015.05" value="${careerList.career_end }">
										</div>
									</div>
									<div class="row formprofile_row">
										<div class="form-group formprofile_detail input">
											<label class="control-label profile_label" for="careerList2_${status.index }_career_task">담당직책/지위</label>
											<input type="text" id="careerList2_${status.index }_career_task" name="careerList2[${status.index }].career_task" value="${careerList.career_task }">
										</div>
										<div class="form-group formprofile_detail input">
											<label class="control-label profile_label" for="careerList2_${status.index }_career_activity">담당업무</label>
											<input type="text" id="careerList2_${status.index }_career_activity" name="careerList2[${status.index }].career_activity" 
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
									<button type="button" class="btn remove_btn" style="background-color: transparent;">
									<img id="rmvimg_btn" src="<%=request.getContextPath()%>/resources/resume/minus.PNG"><span><b> 삭제</b></span></button>
									<div><span id="career_addbtn_alert_span"></span></div>
								</div>
							</div>
			
			
							
						<!-- 어학 :필수 -->
						<label class="formprofile_name" for="formprofile">어학</label>
							<div class="formprofile lang_formcontainer" id="formprofile" class="col-lg-12">
							
							<c:forEach items="${langList2 }" var="langList" varStatus="status">
								<div class="formcontainerIndex">
									<input type="hidden" id="lang_index" value="${status.index }">
									<div class="row formprofile_row">
										<div class="col-md-3 form-group formprofile_detail input">
											<label class="control-label profile_label" for="langList2_${status.index }_lang_field">언어구분</label>
											<div>
											<select id="langList2_${status.index }_lang_field" name="langList2[${status.index }].lang_field" value="${langList.lang_field }">
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
											<label class="control-label profile_label" for="langList2_${status.index }_lang_testname">언어자격증 명</label>
											<input type="text" id="langList2_${status.index }_lang_testname" name="langList2[${status.index }].lang_testname" placeholder="예) toeic" value="${langList.lang_testname }">
										</div>
										<div class="col-md-3 form-group formprofile_detail input">
											<label class="control-label profile_label" for="langList2_${status.index }_lang_grade">점수/급수</label>
											<input type="text" id="langList2_${status.index }_lang_grade" name="langList2[${status.index }].lang_grade" value="${langList.lang_grade }">
										</div>
										<div class="col-md-3 form-group formprofile_detail input">
											<label class="control-label profile_label" for="langList2_${status.index }_lang_getdate">취득일</label>
											<input type="text" id="langList2_${status.index }_lang_getdate" name="langList2[${status.index }].lang_getdate" placeholder="예) 2017.01" value="${langList.lang_getdate }">
										</div>
									</div>
								</div>
								<hr color="#808080">
							</c:forEach>
								
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
							<div class="formprofile license_formcontainer" id="formprofile" class="col-lg-12">
							
						<c:forEach items="${licenseList2 }" var="licenseList" varStatus="status">	
								<div class="formcontainerIndex">
									<input type="hidden" id="license_index" value="${status.index }">
									<div class="row formprofile_row">
										<div class="col-md-4 form-group formprofile_detail input">
											<label class="control-label profile_label" for="licenseList2_${status.index }_license_name">자격증 명</label>
											<input type="text" id="licenseList2_${status.index }_license_name" name="licenseList2[${status.index }].license_name" value="${licenseList.license_name }">
										</div>
										<div class="col-md-4 form-group formprofile_detail input">
											<label class="control-label profile_label" for="licenseList2_${status.index }_license_co">발행기관</label>
											<input type="text" id="licenseList2_${status.index }_license_co" name="licenseList2[${status.index }].license_co" value="${licenseList.license_co }">
										</div>
										<div class="col-md-4 form-group formprofile_detail input">
											<label class="control-label profile_label" for="licenseList2_${status.index }_license_getdate">취득일</label>
											<input type="text" id="licenseList2_${status.index }_license_getdate" name="licenseList2[${status.index }].license_getdate" placeholder="예) 2017.01" value="${licenseList.license_getdate }">
										</div>
									</div>
								</div>
								<hr color="#808080">
							</c:forEach>
								
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
										<label class="control-label profile_label" for="file2">파일추가</label>
										<input type="file" id="file2" name="file2">
										<input type="text" name="portpolio_update" value="${portpolio2.portpolio_file }" readonly>
									</div>
								</div>
								<div class="row formprofile_row" style="text-align: center">
									<span><b> 포트폴리오 파일은 하나만 업로드 할 수 있어요 ^^</b></span>
								</div>
							</div>
								
								
					<!-- 보유기술 : 선택 -->
					<label class="formprofile_name" for="formprofile">보유기술</label>
						<div class="formprofile skill_formcontainer" id="formprofile" class="col-lg-12">
						
					<c:forEach items="${skillList2 }" var="skillList" varStatus="status">
							<div class="formcontainerIndex">
								<input type="hidden" id="skill_index" value="${status.index }">
								<div class="row formprofile_row">
									<div class="form-group formprofile_detail input">
										<label class="control-label profile_label" for="skillList2${status.index }_skill_name">보유기술</label>
										<input type="text" id="skillList2_${status.index }_skill_name" name="skillList2[${status.index }].skill_name" 
												placeholder="예) HTML5 / CSS5 , JQuery, JAVA, JSP, Eclipse" value="${skillList.skill_name }">
									</div>
								</div>
							</div>	
							<hr color="#808080">
					</c:forEach>		
					
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
						<div class="formprofile award_formcontainer" id="formprofile" class="col-lg-12">
					
						<c:forEach items="${awardList2 }" var="awardList" varStatus="status">
							<div class="formcontainerIndex">
								<input type="hidden" id="award_index" value="${status.index }">						
								<div class="row formprofile_row">
									<div class="col-md-4 form-group formprofile_detail input">
										<label class="control-label profile_label" for="awardList2_${status.index }_award_name">수상명</label>
										<input type="text" id="awardList2_${status.index }_award_name" name="awardList2[${status.index }].award_name" value="${awardList.award_name }">
									</div>
									<div class="col-md-4 form-group formprofile_detail input">
										<label class="control-label profile_label" for="awardList2_${status.index }_award_co">수여기관</label>
										<input type="text" id="awardList2_${status.index }_award_co" name="awardList2[${status.index }].award_co" value="${awardList.award_co }">
									</div>
									<div class="col-md-4 form-group formprofile_detail input">
										<label class="control-label profile_label" for="awardList2_${status.index }_award_year">수상연도</label>
										<input type="text" id="awardList2_${status.index }_award_year" name="awardList2[${status.index }].award_year" placeholder="예) 2017" value="${awardList.award_year }">
									</div>
								</div>
								
								<div class="row formprofile_row">
									<div class="form-group formprofile_detail input">
										<label class="control-label profile_label" for="awardList2_${status.index }_award_activity">수여내용</label>
										<input type="text" id="awardList2_${status.index }_award_activity" name="awardList2[${status.index }].award_activity" 
												placeholder="수여 내용 및 결과를 자세히 입력해주세요." value="${awardList.award_activity }">
									</div>
								</div>
							</div>	
							<hr color="#808080">
						</c:forEach>
							
							<div id="space_award_addForm"></div>
							<div class="row formprofile_row" style="text-align: center">
								<button type="button" class="btn" id="award_addbtn" style="background-color: transparent;">
								<img id="addimg_btn" src="<%=request.getContextPath()%>/resources/resume/plus.PNG"><span><b> 수상항목 추가</b></span></button>
								<button type="button" class="btn remove_btn" style="background-color: transparent;">
								<img id="rmvimg_btn" src="<%=request.getContextPath()%>/resources/resume/minus.PNG"><span><b> 삭제</b></span></button>
								<div><span id="award_addbtn_alert_span"></span></div>
							</div>
						</div>
							
			

<!-- ////////////////////////////////////////   자기소개서       /////////////////////////////////////////////////////////////////////// -->					
					
		<label class="formprofile_name" for="formprofile">자기소개서</label>
				<div class="formprofile question_formcontainer" id="formprofile" class="col-lg-12">
				
			<c:forEach items="${coverletterList2 }" var="coverletterList2" varStatus="status">	
				<input type="hidden" id="pick_code" name="pick_code" value="${coverletterList2.pick_code }">
				<input type="hidden" id="resu_code" name="resu_code" value="${coverletterList2.resu_code }">
					<div class="question_formcontainer${status.index }">
						<input type="hidden" id="question_index" value="${status.index }">
						<div class="row formprofile_row">
							<div class="col-md-10 form-group formprofile_detail input">
								<label class="control-label profile_label" for="coverletterList2.intro_no"> 항목 ${status.index +1} </label>
								<input id="coverletterList2.intro_no" name="coverletterList2[${status.index }].intro_no" value="${coverletterList2.intro_no }" readonly style="background-color: transparent;">
							</div>
							<div class="col-md-2 form-group formprofile_detail input">
								<label class="control-label profile_label" for="coverletterList2.intro_lim">글자 수</label>
								<input class="remaining" id="coverletterList2_intro_lim${status.index }" name="coverletterList2[${status.index }].intro_lim"
										readonly style="background-color: transparent;"> <span class="count">${coverletterList2.intro_lim }</span>
							</div>
							<div class="form-group formprofile_detail input">
								<textarea class="count_me" id="coverletterList2_resu_ctmt${status.index }" name="coverletterList2[${status.index }].resu_ctmt" rows="10" cols="92%" placeholder="기업에게 자신을 소개해주세요!"
											maxlength="${coverletterList2.intro_lim }">${coverletterList2.resu_ctmt }
								</textarea>	
							<div id="progressbar${status.index }"></div>
							
							</div>
							
						</div>
					</div>
					<hr color="#808080">
					<input type="hidden" id="pick_no" name="coverletterList2[${status.index }].pick_no" value="${coverletterList2.pick_no }">
					<input type="hidden" id="pick_code" name="coverletterList2[${status.index }].pick_code" value="${coverletterList2.pick_code }">
					<input type="hidden" id="resu_code" name="coverletterList2[${status.index }].resu_code" value="${coverletterList2.resu_code }">
			</c:forEach>		
				</div>

<script type="text/javascript">
$(function() {
    $('.remaining').each(function() {
        
    });
});

</script>
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



<script type="text/javascript">
	$(document).ready(function(){
		
		var containerIndex;
		
		/* 학력form추가 script// 5개까지만 생성가능 */
		$('#edu_addbtn').click(function(){
			containerIndex = $(this).parents('div .formprofile').find('.formcontainerIndex').length;
			
			var eduStr=
				'<div class="formcontainerIndex">'
			+	'<input type="hidden" class="edu_index" value="'+containerIndex+'">'
			+		'<div class="row formprofile_row">'
			+			'<div class="col-md-3 formprofile_detail input">'
			+				'<label class="control-label profile_label" for="eduList2_'+containerIndex+'.edu_institute">학교명</label>'
			+				'<input type="text" id="eduList2_'+containerIndex+'_edu_institute" name="eduList2['+containerIndex+'].edu_institute">'
			+			'</div>'
			+			'<div class="col-md-3 formprofile_detail input">'
			+				'<label class="control-label profile_label" for="eduList2_'+containerIndex+'_edu_start">입학년월</label>'
			+				'<input type="text" id="eduList2_'+containerIndex+'_edu_start" name="eduList2['+containerIndex+'].edu_start" placeholder="예) 2015.05">'    
			+			'</div>'
			+			'<div class="col-md-3 formprofile_detail input">'
			+				'<label class="control-label profile_label" for="eduList2_'+containerIndex+'_edu_end">졸업년월</label>'
			+				'<input type="text" id="eduList2_'+containerIndex+'_edu_end" name="eduList2['+containerIndex+'].edu_end" placeholder="예) 2015.05">'
			+			'</div>'
			+			'<div class="col-md-3 formprofile_detail input">'
			+				'<label class="control-label profile_label" for="eduList2_'+containerIndex+'_edu_category">구분</label>'
			+				'<div><select id="eduList2_'+containerIndex+'_edu_category" name="eduList2['+containerIndex+'].edu_category">'
			+					'<option value="재학중">재학중</option>'
			+					'<option value="졸업예정">졸업예정</option>'
			+					'<option value="졸업">졸업</option>'
			+				'</select></div>'
			+			'</div>'
			+		'</div>'
			+		'<div class="row formprofile_row">'
			+			'<div class="col-md-4 formprofile_detail input">'
			+				'<label class="control-label profile_label" for="eduList2_'+containerIndex+'_edu_major">전공</label>'
			+				'<input type="text" id="eduList2_'+containerIndex+'_edu_major" name="eduList2['+containerIndex+'].edu_major">'
			+			'</div>'
			+			'<div class="col-md-4 formprofile_detail input">'
			+				'<label class="control-label profile_label" for="eduList2_'+containerIndex+'_edu_grade">학점</label>'
			+				'<input type="text" id="eduList2_'+containerIndex+'_edu_grade" name="eduList2['+containerIndex+'].edu_grade" placeholder="평점/총점">'
			+			'</div>'
			+		'</div>'
			+	'</div>'
			+   '<hr color="#808080">';
			
			console.log('edu_addbtn 클릭');
			$('#space_edu_addForm').append(eduStr);
			console.log("현재 div 개수" + containerIndex);
			
			if( containerIndex < 1 ){
				$(this).next().prop("disabled", true);   // 1번째 div 면 '삭제'버튼 '비활성화'
			}else{
				$(this).next().prop("disabled", false);   // 1번째 div 초과면 '삭제'버튼 '활성화'
			}
			
			if(containerIndex >= 4){
				$(this).prop("disabled", true);
				$('#edu_addbtn_alert_span').html('학력 항목은 5개까지 입력 가능합니다!')
			}
		
		});
		
		
		/* 경력form추가 script// 7개까지만 생성가능 */
		$('#career_addbtn').click(function(){
			containerIndex = $(this).parents('div .formprofile').find('.formcontainerIndex').length;
			
			var careerStr =
				'<div class="formcontainerIndex">'
			+	'<input type="hidden" id="career_index" value="'+containerIndex+'">'
			+		'<div class="row formprofile_row">'
			+			'<div class="col-md-4 formprofile_detail input">'
			+				'<label class="control-label profile_label" for="careerList2_'+containerIndex+'_career_institute">회사/단체명</label>'
			+				'<input type="text" id="careerList2'+containerIndex+'_career_institute" name="careerList2['+containerIndex+'].career_institute">'
			+			'</div>'
			+			'<div class="col-md-4 formprofile_detail input">'
			+				'<label class="control-label profile_label" for="careerList2_'+containerIndex+'_career_start">활동시작</label>'
			+				'<input type="text" id="careerList2_'+containerIndex+'_career_start" name="careerList2['+containerIndex+'].career_start" placeholder="예) 2015.05">'
			+			'</div>'
			+			'<div class="col-md-4 formprofile_detail input">'
			+				'<label class="control-label profile_label" for="careerList2_'+containerIndex+'_career_end">활동종료</label>'
			+				'<input type="text" id="careerList2_'+containerIndex+'_career_end" name="careerList2['+containerIndex+'].career_end" placeholder="예) 2015.05">'
			+			'</div>'
			+		'</div>'
			+		'<div class="row formprofile_row">'
			+			'<div class="form-group formprofile_detail input">'
			+				'<label class="control-label profile_label" for="careerList2_'+containerIndex+'_career_task">담당직책/지위</label>'
			+				'<input type="text" id="careerList2_'+containerIndex+'_career_task" name="careerList2['+containerIndex+'].career_task">'
			+			'</div>'
			+			'<div class="form-group formprofile_detail input">'
			+				'<label class="control-label profile_label" for="careerList2_'+containerIndex+'_career_activity">담당업무</label>'
			+				'<input type="text" id="careerList2_'+containerIndex+'_career_activity" name="careerList2['+containerIndex+'].career_activity" placeholder="담당하신 업무의 성과에 대해 간단 명료하게 작성해주세요.">'
			+			'</div>'
			+		'</div>'
			+	'</div>'
			+	'<hr color="#808080">';
			console.log('경력추가 버튼 누름');
			$('#space_career_addForm').append(careerStr);
			console.log("현재 div 개수" + containerIndex);
			
			if( containerIndex < 1 ){
				$(this).next().prop("disabled", true);   // 1번째 div 면 '삭제'버튼 '비활성화'
			}else{
				$(this).next().prop("disabled", false);   // 1번째 div 초과면 '삭제'버튼 '활성화'
			}
			
			if(containerIndex >= 6 ){
				$(this).prop("disabled", true);
				$('#career_addbtn_alert_span').html('경력항목은 7개까지 입력가능합니다!');
			}
			
		});
		
		
		/* 어학form추가 script// 7개까지만 생성가능 */
		$('#language_addbtn').click(function(){
			containerIndex = $(this).parents('div .formprofile').find('.formcontainerIndex').length;
			
			var langStr=
				'<div class="formcontainerIndex">'
			+	'<input type="hidden" id="lang_index" value="'+containerIndex+'">'
			+		'<div class="row formprofile_row">'
			+			'<div class="col-md-3 form-group formprofile_detail input">'
			+				'<label class="control-label profile_label" for="langList2_'+containerIndex+'_lang_field">언어구분</label>'
			+				'<div>'
			+				'<select id="langList2_'+containerIndex+'_lang_field" name="langList2['+containerIndex+'].lang_field">'
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
			+				'<label class="control-label profile_label" for="langList2_'+containerIndex+'_lang_testname">언어자격증 명</label>'
			+				'<input type="text" id="langList2_'+containerIndex+'_lang_testname" name="langList2['+containerIndex+'].lang_testname" placeholder="예) toeic">'
			+			'</div>'
			+			'<div class="col-md-3 form-group formprofile_detail input">'
			+				'<label class="control-label profile_label" for="langList2_'+containerIndex+'_lang_grade">점수/급수</label>'
			+				'<input type="text" id="langList2_'+containerIndex+'_lang_grade" name="langList2['+containerIndex+'].lang_grade">'
			+			'</div>'
			+			'<div class="col-md-3 form-group formprofile_detail input">'
			+				'<label class="control-label profile_label" for="langList2_'+containerIndex+'_lang_getdate">취득일</label>'
			+				'<input type="text" id="langList2_'+containerIndex+'_lang_getdate" name="langList2['+containerIndex+'].lang_getdate" placeholder="예) 2017.01">'
			+			'</div>'
			+		'</div>'
			+	'</div>'
			+   '<hr color="#808080">';
			
			console.log('어학 추가 버튼 누름');
			$('#space_lang_addForm').append(langStr);
			console.log("현재 div 개수" + containerIndex);
			
			if( containerIndex < 1 ){
				$(this).next().prop("disabled", true);   // 1번째 div 면 '삭제'버튼 '비활성화'
			}else{
				$(this).next().prop("disabled", false);   // 1번째 div 초과면 '삭제'버튼 '활성화'
			}
			
			if(containerIndex >= 6 ){
				$(this).prop("disabled", true);
				$('#language_addbtn_alert_span').html('어학 항목은 7개까지 입력가능합니다!');
			}
			
		});
		
		
		/*  자격증 form 추가 script // 7개까지 가능 */
		$('#license_addbtn').click(function(){
			containerIndex = $(this).parents('div .formprofile').find('.formcontainerIndex').length;
			
			var licenseStr=
				'<div class="formcontainerIndex">'
			+	'<input type="hidden" id="license_index" value="'+containerIndex+'">'
			+		'<div class="row formprofile_row">'
			+			'<div class="col-md-4 form-group formprofile_detail input">'
			+				'<label class="control-label profile_label" for="licenseList2_'+containerIndex+'_license_name">자격증 명</label>'
			+				'<input type="text" id="licenseList2_'+containerIndex+'_license_name" name="licenseList2['+containerIndex+'].license_name">'
			+			'</div>'
			+			'<div class="col-md-4 form-group formprofile_detail input">'
			+				'<label class="control-label profile_label" for="licenseList2_'+containerIndex+'_license_co">발행기관</label>'
			+				'<input type="text" id="licenseList2_'+containerIndex+'_license_co" name="licenseList2['+containerIndex+'].license_co">'
			+			'</div>'
			+			'<div class="col-md-4 form-group formprofile_detail input">'
			+				'<label class="control-label profile_label" for="licenseList2_'+containerIndex+'_license_getdate">취득일</label>'
			+				'<input type="text" id="licenseList2_'+containerIndex+'_license_getdate" name="licenseList2['+containerIndex+'].license_getdate" placeholder="예) 2017.01">'
			+			'</div>'
			+		'</div>'
			+	'</div>'
			+	'<hr color="#808080">';
			
			console.log('자격증 추가 버튼 누름');
			$('#space_license_addForm').append(licenseStr);
			console.log("현재 div 개수" + containerIndex);
			
			if( containerIndex < 1 ){
				$(this).next().prop("disabled", true);   // 1번째 div 면 '삭제'버튼 '비활성화'
			}else{
				$(this).next().prop("disabled", false);   // 1번째 div 초과면 '삭제'버튼 '활성화'
			}
			
			if(containerIndex >= 6){
				$(this).prop("disabled", true);
				$('#license_addbtn_alert_span').html('자격증 항목은 7개까지 입력가능합니다!');
			}
			
		});
		
		
		/* 보유기술 form 추가 script // 5개까지 입력가능 */
		$('#skill_addbtn').click(function(){
			containerIndex = $(this).parents('div .formprofile').find('.formcontainerIndex').length;
			
			var skillStr=
				'<div class="formcontainerIndex">'
			+	'<input type="hidden" id="license_index" value="'+containerIndex+'">'
			+		'<div class="row formprofile_row">'
			+			'<div class="form-group formprofile_detail input">'
			+				'<label class="control-label profile_label" for="skillList2_'+containerIndex+'_skill_name">보유기술</label>'
			+				'<input type="text" id="skillList2_'+containerIndex+'_skill_name" name="skillList2['+containerIndex+'].skill_name" placeholder="예) HTML5 / CSS5 , JQuery, JAVA, JSP, Eclipse" >'
			+			'</div>'
			+		'</div>'
			+	'</div>'	
			+	'<hr color="#808080">';
			
			console.log('보유기술 추가 버튼 누름');
			$('#space_skill_addForm').append(skillStr);
			console.log("현재 div 개수" + containerIndex);
			
			if( containerIndex < 1 ){
				$(this).next().prop("disabled", true);   // 1번째 div 면 '삭제'버튼 '비활성화'
			}else{
				$(this).next().prop("disabled", false);   // 1번째 div 초과면 '삭제'버튼 '활성화'
			}
			
			if(containerIndex >= 4){
				$(this).prop("disabled", true);
				$('#skill_addbtn_alert_span').html('보유기술 항목은 5개까지 입력가능합니다!');
			}
			
		});
		
		
		/* 수상 form 추가 script // 5개까지 입력가능 */
		$('#award_addbtn').click(function(){
			containerIndex = $(this).parents('div .formprofile').find('.formcontainerIndex').length;
			
			var awardStr=
				'<div class="formcontainerIndex">'
			+	'<input type="hidden" id="award_index" value="'+containerIndex+'">'
			+		'<div class="row formprofile_row">'
			+			'<div class="col-md-4 form-group formprofile_detail input">'
			+				'<label class="control-label profile_label" for="awardList2_'+containerIndex+'_award_name">수상명</label>'
			+				'<input type="text" id="awardList2_'+containerIndex+'_award_name" name="awardList2['+containerIndex+'].award_name">'
			+			'</div>'
			+			'<div class="col-md-4 form-group formprofile_detail input">'
			+				'<label class="control-label profile_label" for="awardList2_'+containerIndex+'_award_co">수여기관</label>'
			+				'<input type="text" id="awardList2_'+containerIndex+'_award_co" name="awardList2['+containerIndex+'].award_co">'
			+			'</div>'
			+			'<div class="col-md-4 form-group formprofile_detail input">'
			+				'<label class="control-label profile_label" for="awardList2_'+containerIndex+'_award_year">수상연도</label>'
			+				'<input type="text" id="awardList2_'+containerIndex+'_award_year" name="awardList2['+containerIndex+'].award_year" placeholder="예) 2017" >'
			+			'</div>'
			+		'</div>'
			+		'<div class="row formprofile_row">'
			+			'<div class="form-group formprofile_detail input">'
			+				'<label class="control-label profile_label" for="awardList2_'+containerIndex+'_award_activity">수여내용</label>'
			+				'<input type="text" id="awardList2_'+containerIndex+'_award_activity" name="awardList2['+containerIndex+'].award_activity" placeholder="수여 내용 및 결과를 자세히 입력해주세요.">'
			+			'</div>'
			+		'</div>'
			+	'</div>'
			+	'<hr color="#808080">'
				
			console.log('수상 추가 버튼 누름');
			$('#space_award_addForm').append(awardStr);
			console.log("현재 div 개수" + containerIndex);
			
			if( containerIndex < 1 ){
				$(this).next().prop("disabled", true);   // 1번째 div 면 '삭제'버튼 '비활성화'
			}else{
				$(this).next().prop("disabled", false);   // 1번째 div 초과면 '삭제'버튼 '활성화'
			}
			
			if(containerIndex >=4){
				$(this).prop("disabled", true);
				$('#award_addbtn_alert_span').html('수상 항목은 5개까지 입력가능합니다!');
			}
			
		});

		
		
	/* ---------------------------------------------------------------- */	
		
		/* 삭제 버튼 */
		$('.remove_btn').click(function(){
			console.log("삭제버튼 위치"+$(this));
			var targetDiv = $(this).parents('div .formprofile').find('.formcontainerIndex').last();
			
			if( $(this).parents('div .formprofile').find('.formcontainerIndex').length ==1 ){
				$(this).prop("disabled", true);   // 1번째 div남으면 '삭제'버튼 '비활성화'
			}
			
			targetDiv.next().remove();   //hr지우기
			targetDiv.remove();	  		// 마지막 form 지우기
			$(this).prop("disabled", false);    //삭제버튼 활성화
			$(this).prev().prop("disabled", false);    // 추가 버튼 활성화
			$(this).next('div').empty();
			
			if( $(this).parents('div .formprofile').find('.formcontainerIndex').length ==1 ){
				$(this).prop("disabled", true);   // 1번째 div남으면 '삭제'버튼 '비활성화'
			}
			
			
		});
		
		
	});
</script>





<!-- 임시저장 OR 제출 버튼 클릭!!!!! -->
<script type="text/javascript">
	$(document).ready(function(){
		
	});
	
	function saveORsubmbitResume(status_resume){
		console.log('스크립트 시작 : '+status_resume);
		console.log($('#coverletterList2.resu_ctmt').length);
		
		if(status_resume =='0'){   //임시저장버튼 click
			$('#paper_status').val(status_resume);   //paper_status = 0
			$('#edit_status').val(status_resume);    //edit_status=0 
			console.log($('#paper_status').val());
			console.log($('#edit_status').val());
			
		}else {  //제출완료버튼 click
			//자소서 내용 비어있으면 제출완료 submit 안된다. <유효성체크>
			$('textarea[id^="coverletterList2_resu_ctmt"]').each(function(){
				if($(this).val()==""){
					alert('자소서 내용이 전부 입력되지 않았습니다.');
					$(this).focus();
					return false;
				}else{
					$('#paper_status').val(status_resume);	 //paper_status = 1
					$('#edit_status').val(4);				//edit_status=4
					console.log($('#paper_status').val());	
					console.log($('#edit_status').val());
				}
			});
		}
		alert('스크립트끝');
		$('#applyUpdateResumeForm').submit();
		
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

