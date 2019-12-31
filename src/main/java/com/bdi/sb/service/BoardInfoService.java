package com.bdi.sb.service;

import java.util.List;

import com.bdi.sb.vo.BoardInfoVO;
import com.bdi.sb.vo.PageVO;

public interface BoardInfoService {
	public List<BoardInfoVO> selectBoardInfoList(BoardInfoVO board, PageVO page);
	public int insertBoardInfo(BoardInfoVO board);
}
