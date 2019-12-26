package com.bdi.sb.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.bdi.sb.service.TestInfoService;
import com.bdi.sb.vo.TestInfoVO;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class TestInfoController {
	
	@Resource
	private TestInfoService tiService;
	
	@GetMapping("/tests")
	public Map<String,Object> getTests(@ModelAttribute TestInfoVO test){
		return tiService.selectTestInfoList(test);
	}
	
	@GetMapping("/test")
	public Map<String,Object> getTest(@ModelAttribute TestInfoVO test){
		System.out.println(test);
		return tiService.selectTestInfo(test);
	}
	
	
	@PostMapping("/tests")
	public int InsertTest(@RequestBody TestInfoVO test){
		log.info("test=>{}", test);
		return tiService.insertTestInfo(test);
	}
	
	@PutMapping("/tests")
	public int UpdateTest(@RequestBody TestInfoVO test){
		log.info("test=>{}", test);
		return tiService.updateTestInfo(test);
	}
	
	@PutMapping("/tests/cnt")
	public int UpdateTiTest(@RequestBody TestInfoVO test){
		log.info("test=>{}", test);
		return tiService.updateTestInfo(test);
	}
	
	@DeleteMapping("/tests")
	public int DeleteTest(@RequestBody TestInfoVO test){
		log.info("test=>{}", test);
		return tiService.deleteTestInfo(test);
	}
	
	@DeleteMapping("/testss")
	public int DeleteTests(@RequestBody TestInfoVO test){
		log.info("test=>{}", test);
		return tiService.deleteTestInfos(test);
	}
	
	
}
