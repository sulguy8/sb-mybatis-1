package com.bdi.sb.test;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class TimeTest {
	
	static class Test extends Thread{
		
		public void run() {
			String s ="";
			for(int i=1;i<=(50000/5);i++) {
				s+= i;
			}
			this.interrupt();
		}
	}
	
	public static void main(String[] args) {
		double sTime = System.currentTimeMillis();
		String s ="";
		for(int i=1;i<=50000;i++) {
			s+= i;
		}
		
		double eTime = System.currentTimeMillis() - sTime;
		log.info("일반 작업 시간 : " + (eTime/1000) + "초");
		sTime = System.currentTimeMillis(); 
		Test t1 = new Test();
		Test t2 = new Test();
		Test t3 = new Test();
		Test t4 = new Test();
		t1.start();
		t2.start();
		t3.start();
		t4.start();
		while(!t1.isInterrupted() && !t2.isInterrupted() && !t3.isInterrupted() && !t4.isInterrupted()) {
			
		}
		eTime = System.currentTimeMillis() - sTime;
		log.info("작업을 5분할로 쓰레드로 돌린 시간 : " + (eTime/1000) + "초");
	}
}
