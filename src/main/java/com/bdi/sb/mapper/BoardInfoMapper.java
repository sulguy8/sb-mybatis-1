package com.bdi.sb.mapper;

import java.util.List;

import com.bdi.sb.vo.BoardInfoVO;
import com.bdi.sb.vo.PageVO;

public interface BoardInfoMapper {
	
	public List<BoardInfoVO> selectBoardInfoList(BoardInfoVO board, PageVO page);
	public int insertBoardInfo(BoardInfoVO board);
}
