package com.bdi.sb.aop;

import java.util.List;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;
@Component
@Aspect
@Slf4j
public class LogAOP {
	
	@Before("execution(public String com.bdi.sb.controller..*())")
	public void before1(JoinPoint jp) {
		log.info("join point=>{}", jp);
	}
	
	@Before("execution(private void com.bdi.sb.controller..*())")
	public void before2(JoinPoint jp) {
		log.info("join point=>{}", jp); // 접근은 되지만 private이기 때문에 AOP가 감싸지 못함
	}
	
	@Before("execution(public java.util.List<String> com.bdi.sb.controller..*())")
	public void before3(JoinPoint jp) {
		log.info("join point=>{}", jp);
	}
	
	@Before("execution(private java.util.List<String> com.bdi.sb.controller..*())")
	public void before4(JoinPoint jp) {
		log.info("join point=>{}", jp); // 접근은 되지만 private이기 때문에 AOP가 감싸지 못함
	}

}
