package kr.or.pickme.utils;

/*
@class : MediaUtils
@Date : 2017-11-30
@Author : 강희창
@Desc : 파일이 이미지인지 아닌지 판단여부
*/

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.MediaType;

//이미지 타입을 식별할 수 있는 기능을 가진 클래스
//클래스로 나눈 이유는 브라우저에서 파일을 다운로드 할 것인지, 보여줄 것인지 결정하기 위함
public class MediaUtils {
	private static Map<String, MediaType> mediaMap;
	
	static{
		//확장자로 인해 이미지 타입인지 판단해줌
		mediaMap = new HashMap<String, MediaType>();		
		mediaMap.put("JPG", MediaType.IMAGE_JPEG);
		mediaMap.put("GIF", MediaType.IMAGE_GIF);
		mediaMap.put("PNG", MediaType.IMAGE_PNG);
	}
	
	public static MediaType getMediaType(String type){
		
		return mediaMap.get(type.toUpperCase());
	}
}
