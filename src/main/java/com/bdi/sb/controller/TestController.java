package com.bdi.sb.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bdi.sb.mapper.UserInfoMapper;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class TestController {
	@Resource
	private UserInfoMapper uiMapper;
	

	@GetMapping("/hello")
	public String hello()	{
		log.info("AOP사이에 끼어버림 ㅋ");
		return "hello~~";
	}
	
	@GetMapping("/hellos")
	public List<String> hellos(){
		List<String> strList =new ArrayList<>();
		strList.add("hello");
		strList.add("hello~");
		strList.add("hello~~");
		return strList;
	}
}
