package com.bdi.sb.service;

import java.util.Map;

import com.bdi.sb.vo.TestInfoVO;

public interface TestInfoService {
	public Map<String,Object> selectUserInfoList(TestInfoVO test);
}
