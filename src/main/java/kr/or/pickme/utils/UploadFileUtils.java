package kr.or.pickme.utils;

/*
@class : MediaUtils
@Date : 2017-11-30
@Author : 강희창
@Desc : 파일업로드, 썸네일이미지
*/

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {
	
	//private static final Logger logger = LoggerFactory.getLogger(UploadFileUtils.class);
	
	/*파일업로드 기능. 저장경로, 원본이름, 데이터*/
	public static String uploadFile(String uploadPath, 
									String originalName, 
									byte[] fileData) throws Exception{
		
		UUID uid = UUID.randomUUID();
		
		String saveName = uid.toString() + "_" + originalName;
		String savePath = calcPath(uploadPath);
		
		File target = new File(uploadPath + savePath, saveName);
		FileCopyUtils.copy(fileData, target);
		
		String formatName = originalName.substring(originalName.lastIndexOf(".")+1);
		
		String uploadFileName = null;
		
		if(MediaUtils.getMediaType(formatName) != null) {
			uploadFileName = makeThumbnail(uploadPath, savePath, saveName);
		}
		
		return uploadFileName;
	}
	
	/*업로드 폴더의 생성처리*/
	private static String calcPath(String uploadPath) {
		
		Calendar cal = Calendar.getInstance();
		
		String yearPath = File.separator + cal.get(Calendar.YEAR);
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		makeDir(uploadPath, yearPath, monthPath, datePath);
		
		//logger.info(datePath);
		
		return datePath;
	}
	
	private static void makeDir(String uploadPath, String... paths) {
		
		if(new File(uploadPath + paths[paths.length -1]).exists()) {
			return;
		}
		
		for(String path : paths) {
			File dirPath = new File(uploadPath + path);
			
			if(!dirPath.exists()) {
				dirPath.mkdirs();
			}
		}
	}
	
	/*썸네일 이미지 생성*/
	private static String makeThumbnail(String uploadPath, String path, String fileName) throws Exception {
		
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));		
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT,100);
		
		String thumbnailName = uploadPath + path + File.separator + "s_"+fileName;
		
		File newFile = new File(thumbnailName);
		
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
		
	}

}