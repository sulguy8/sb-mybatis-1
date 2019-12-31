package com.bdi.sb.socket;

import java.io.IOException;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Scanner;

public class SocketServerTest {

	public static void main(String[] args) {
//		Scanner scan = new Scanner(System.in);
		
		try {
			ServerSocket ss = new ServerSocket(8282);
			boolean proceed = true;
			while (proceed) {
				Socket s = ss.accept();
				OutputStream out = null;
				try {
					out = s.getOutputStream();
					out.write("hello".toString().getBytes());
				} catch (IOException e) {
					e.printStackTrace();
				} finally {
					s.close();
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
