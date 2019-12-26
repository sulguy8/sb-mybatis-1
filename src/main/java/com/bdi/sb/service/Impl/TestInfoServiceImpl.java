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
	public Map<String,Object> selectTestInfoList(TestInfoVO test) {
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

	@Override
	public Map<String,Object> selectTestInfo(TestInfoVO test) {
		System.out.println(test);
		Map<String,Object> rMap = new HashMap<>();
		rMap.put("list", tiMapper.selectTestInfo(test));
		
		return rMap;
	}
	
	@Override
	public int insertTestInfo(TestInfoVO test) {
		int result = tiMapper.insertTestInfo(test);
		return result;
	}

	@Override
	public int updateTestInfo(TestInfoVO test) {
		int cnt = tiMapper.updateTestInfo(test);
		Map<String,Object> rMap = new HashMap<>();
		rMap.put("msg", "업데이트 실패");
		if(cnt==1) {
			if(tiMapper.updateTiUpdcnt(test)==1) {
				rMap.put("msg", "업데이트 성공");
			}
		}
		int result = tiMapper.updateTestInfo(test);
		return result;
	}

	@Override
	public int deleteTestInfo(TestInfoVO test) {
		int result = tiMapper.deleteTestInfo(test);
		return result;
	}

	@Override
	public int deleteTestInfos(TestInfoVO test) {
		int result = tiMapper.deleteTestInfos(test);
		return result;
	}
}
