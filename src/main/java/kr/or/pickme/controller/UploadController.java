package kr.or.pickme.controller;
/*
@class : UploadController
@Date : 2017-11-30
@Author : 강희창
@Desc : 이미지파일 ajax로 화면출력
*/

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.pickme.utils.MediaUtils;
import kr.or.pickme.utils.UploadFileUtils;

@Controller
public class UploadController {
	private static final Logger logger =
			LoggerFactory.getLogger(UploadController.class);
	
	//저장될 파일 경로 injection
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@ResponseBody
	@RequestMapping(value="/uploadAjax.htm", method=RequestMethod.POST)	//produces는 한국어를 정상적으로 전송하기 위함
	public ResponseEntity<String> uploadAjax(@RequestParam MultipartFile file) throws Exception {
		//logger.info("originalName : " + file.getOriginalFilename()); //저장될 경로
		
		return 
			      new ResponseEntity<String>(
			          UploadFileUtils.uploadFile(uploadPath, 
			                file.getOriginalFilename(), 
			                file.getBytes()), 
			          HttpStatus.CREATED);
		//utils 패키지 생성 전
		//logger.info("originalName : " + file.getOriginalFilename()); //저장될 경로
		//logger.info("size" + file.getSize()); //파일 길이
		//logger.info("contentType : " + file.getContentType());
		
		/*String savedName = 
				//원본파일의 이름과 파일 데이터를 byte[]로 변환한 정보를 파라미터로 해서 파일을 업로드하는 작업(10MB)
				uploadFile(file.getOriginalFilename(), file.getBytes());
		
		return new ResponseEntity<String>(savedName,
				HttpStatus.CREATED);	//원하는 리소스가 정상적으로 생성되었다는 상태코드
*/	}
	
	@ResponseBody	//byte[]데이터가 그대로 전송될 것을 명시한 것
	@RequestMapping("/displayFile.htm")
	public ResponseEntity<byte[]>  displayFile(String fileName)throws Exception{
	    
		InputStream in = null; 
	    ResponseEntity<byte[]> entity = null;
	    
	    logger.info("FILE NAME: " + fileName);
	
		try{
		  
		  String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		  
		  MediaType mType = MediaUtils.getMediaType(formatName);	//파일 이름의 확장자 추출 및 이미지일 경우 적절한 MIME타입을 지정
		  
		  HttpHeaders headers = new HttpHeaders();
		  
		  in = new FileInputStream(uploadPath+fileName);
		  
		  if(mType != null){
		    headers.setContentType(mType);
		  }else{
	    
		fileName = fileName.substring(fileName.indexOf("_")+1);       
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);	//이미지가 아닐 경우 MIME타입을 다운로드 용으로 사용(APPLICATION_OCTET_STREAM을 활용)
		headers.add("Content-Disposition", "attachment; filename=\""+ 
		  new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");	//다운로드 후 사용자에게 보이는 파일의 이름을 한글로
		      }
		        entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), 	//IOUtils.toByteArray(in): 실제 데이터 읽는 부분
		        headers, 
		        HttpStatus.CREATED);
		    }catch(Exception e){
		      e.printStackTrace();
		      entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		    }finally{
		      in.close();
		    }
		      return entity;    
		  }
	

}