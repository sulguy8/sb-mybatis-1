package com.bdi.sb.service;

import java.util.Map;

import com.bdi.sb.vo.TestInfoVO;

public interface TestInfoService {
	public Map<String,Object> selectTestInfoList(TestInfoVO test);
	public Map<String,Object> selectTestInfo(TestInfoVO test);
	public int insertTestInfo(TestInfoVO test);
	public int updateTestInfo(TestInfoVO test);
	public int deleteTestInfo(TestInfoVO test);
	public int deleteTestInfos(TestInfoVO test);
	
}
