package com.bdi.sb.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ViewController {
	
	@GetMapping("/front/**")
	public String goPage(HttpServletRequest req) {
		return req.getRequestURI();
	}
}
