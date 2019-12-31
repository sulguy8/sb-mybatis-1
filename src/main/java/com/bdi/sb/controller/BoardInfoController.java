package com.bdi.sb.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bdi.sb.service.BoardInfoService;
import com.bdi.sb.vo.BoardInfoVO;
import com.bdi.sb.vo.PageVO;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class BoardInfoController {
	@Resource
	private BoardInfoService biService;
	@Value("${save.file.path}")
	private String saveFilePath;
	@PostMapping("/boardinfo")
	public Map<String,Object> insertBoard(BoardInfoVO board){
		log.info("board=>{}",board);
		int cnt = biService.insertBoardInfo(board);
		return null;
	}
	@GetMapping("/boardinfos")
	public List<BoardInfoVO> selectBoardInfo(BoardInfoVO board, PageVO page) {
		log.info("page=>{}", page);
		return biService.selectBoardInfoList(board, page);
	}
}
