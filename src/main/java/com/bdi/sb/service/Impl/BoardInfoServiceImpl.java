package com.bdi.sb.service.Impl;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bdi.sb.mapper.BoardInfoMapper;
import com.bdi.sb.service.BoardInfoService;
import com.bdi.sb.vo.BoardInfoVO;
import com.bdi.sb.vo.PageVO;

@Service
public class BoardInfoServiceImpl implements BoardInfoService {
	@Resource
	private BoardInfoMapper biMapper;
	
	@Value("${save.file.path}")
	private String saveFilePath;
	
	@Override
	public List<BoardInfoVO> selectBoardInfoList(BoardInfoVO board, PageVO page) {
		int startNum = (page.getPage()-1)*page.getPageSize();
		page.setStartNum(startNum);
		return biMapper.selectBoardInfoList(board, page);
	}

	@Override
	public int insertBoardInfo(BoardInfoVO board) {
		MultipartFile mf = board.getBiFileItem();
		if(mf!=null) {
			String extName = FilenameUtils.getExtension(mf.getOriginalFilename()); // 확장자만 따옴 .jpg
			String fileName = System.nanoTime() + "." + extName; // ex) 3333.gif
			board.setBiFile(fileName);
			String filePath = saveFilePath + fileName;
			File targetFile = new File(filePath);	
			try {
				Files.copy(mf.getInputStream(), targetFile.toPath(), StandardCopyOption.REPLACE_EXISTING); // StandardCopyOption.REPLACE_EXISTING은 이름이 같다면 덮어씌우기
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return biMapper.insertBoardInfo(board);
	}

}
