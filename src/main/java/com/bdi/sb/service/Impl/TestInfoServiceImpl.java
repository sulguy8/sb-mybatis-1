package com.bdi.sb.service.Impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bdi.sb.mapper.TestInfoMapper;
import com.bdi.sb.service.TestInfoService;
import com.bdi.sb.vo.PageVO;
import com.bdi.sb.vo.TestInfoVO;

@Service
public class TestInfoServiceImpl implements TestInfoService {
	
	@Resource
	private TestInfoMapper tiMapper;
	
	@Override
	public Map<String,Object> selectUserInfoList(TestInfoVO test) {
		int startNum = test.getPage().getPage()*10-10;
		test.getPage().setStartNum(startNum);
		Integer totalCount = tiMapper.totalTestInfoCount(test);
		Map<String,Object> rMap = new HashMap<>();
		rMap.put("list", tiMapper.selectTestInfoList(test));
		PageVO page = test.getPage();
		page.setTotalCount(totalCount);
		rMap.put("page", page);
		return rMap;
	}
}
