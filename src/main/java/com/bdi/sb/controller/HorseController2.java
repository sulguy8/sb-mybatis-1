package com.bdi.sb.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class HorseController2 {
	public List<Horse> hList = new ArrayList<>(); 
	
	private void stopGame() {
		for(Horse h : hList) {
			h.interrupt();
		}
		hList.clear();
	}
	
	@PostMapping("/start/game/{cnt}")
	public List<Map<String,Object>> startGame(@PathVariable("cnt") int cnt){
		stopGame(); // 여러번 호출될때마다 리스트가 계속 add되기때문에 이러한 메소드를 추가해 줌.
		Random r = new Random();
		for(int i=1;i<=cnt;i++) {
			int speed = r.nextInt(5)+1;
			Horse h = new Horse("말"+i, speed);
			hList.add(h);
		}
		List<Map<String,Object>> rList = new ArrayList<>();
		for(int i=0;i<hList.size();i++) {
			hList.get(i).start();
			Map<String,Object> horse = new HashMap<>();
			horse.put("name", hList.get(i).getHorseName());
			horse.put("left", hList.get(i).getLeft());
			rList.add(horse);
		}
		return rList;
	}
}
