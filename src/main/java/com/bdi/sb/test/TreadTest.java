package com.bdi.sb.test;

class SCV extends Thread{
	private String name;
	private int speed = 10;
	public SCV(String name) {
		this.name = name;
		
	}
	public void cheat(int speed) {
		this.speed = speed;
	}
	@Override // 만약에 thread에 run()없다면 오류남.
	public void run() {
		int sum = 0;
		for(int i=1;i<50;i++) {	
			try {
				Thread.sleep(this.speed);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			sum += i; 
			System.out.println(this.name + "SCV가 캔 미네랄 양: " + sum);
		}
		System.out.println(this.name + "미네랄 다캠!");
	}	
}

public class TreadTest {
	public static void main(String[] args) {
		Thread t1 = new SCV("첫번째");
		SCV t2 = new SCV("두번째");
		t2.cheat(5);
		t1.start(); // start()가 실행될때 run()메서드가 실행됨.
		t2.start(); 
	}
}
