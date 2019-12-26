package com.bdi.sb.mapper;

import java.util.List;

import com.bdi.sb.vo.TestInfoVO;

public interface TestInfoMapper {
	
	public List<TestInfoVO> selectTestInfoList(TestInfoVO test);
	public List<TestInfoVO> selectTestInfo(TestInfoVO test);
	public int insertTestInfo(TestInfoVO test);
	public int updateTestInfo(TestInfoVO test);
	public int deleteTestInfo(TestInfoVO test);
	public int deleteTestInfos(TestInfoVO test);
	public int updateTiUpdcnt(TestInfoVO test);
	public int totalTestInfoCount(TestInfoVO test);
}
