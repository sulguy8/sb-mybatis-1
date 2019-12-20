package com.bdi.sb.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class AOPTestController {

	@GetMapping("/aop/1")
	public String aop1() {
		log.info("나는 aop1이얌");
		return "abc";
	}
	
	@GetMapping("/aop/2")
	private void aop2() {
		log.info("나는 aop2이얌");
	}
	
	@GetMapping("/aop/3")
	public List<String> aop3(){
		log.info("나는 aop3이얌");
		return new ArrayList<>();
	}
	
	@GetMapping("/aop/4")
	private List<String> aop4(){
		log.info("나는 aop4이얌");
		return new ArrayList<>();
	}
}
