package com.bdi.sb.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RestController;

import com.bdi.sb.service.TestInfoService;
import com.bdi.sb.vo.TestInfoVO;

@RestController
public class TestInfoController {
	
	@Resource
	private TestInfoService tiService;
	
	@GetMapping("/tests")
	public Map<String,Object> getTests(@ModelAttribute TestInfoVO test){
		return tiService.selectUserInfoList(test);
	}
}
