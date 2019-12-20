package com.bdi.sb.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bdi.sb.service.UserInfoService;
import com.bdi.sb.vo.UserInfoVO;

@RestController
public class UserController {
	
	@Resource
	private UserInfoService uiService;
	
	@GetMapping("/users")
	public List<UserInfoVO> getUserInfoList(UserInfoVO user){
		
		return uiService.selectUserInfoList(null);
	}
	
	
	
	
	
	
	
	
	
	
	
//	@Resource
//	private UserInfoMapper uiMapper;
//	
//	@GetMapping("/users")
//	public List<UserInfoVO> selectUserList(){
//		return uiMapper.selectUserInfoList(null);
//	}
//	
//	@GetMapping("/users/select")
//	public UserInfoVO selectUserInfo(UserInfoVO user){
//		return uiMapper.selectUserInfo(user);
//	}
//	
//	@GetMapping("/users/login")
//	public UserInfoVO loginUserInfo(UserInfoVO user){
//		return uiMapper.selectUserInfo(user);
//	}
//	
//	@PostMapping("/users/dologin")
//	public Map<String,String> doLogin(UserInfoVO user){
//		Map<String,String> msg = new HashMap<>();
//		return uiMapper.doLogin(user);
//	}
//	
//	@PostMapping("/users")
//	public int insertUserInfo(UserInfoVO user) {
//		return uiMapper.insertUserInfo(user);
//	}
//	
//	@PutMapping("/users")
//	public int updateUserInfo(UserInfoVO user) {
//		return uiMapper.updateUserInfo(user);
//	}
//	
//	@PutMapping("/users/dlt")
//	public int deleteUserInfos(UserInfoVO user) {
//		return uiMapper.deleteUserInfos(user);
//	}
//	
//	@DeleteMapping("/users")
//	public int deleteUserInfo(UserInfoVO user) {
//		return uiMapper.deleteUserInfo(user);
//	}
}
