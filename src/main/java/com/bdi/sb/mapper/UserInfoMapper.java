package com.bdi.sb.mapper;

import java.util.List;

import com.bdi.sb.vo.UserInfoVO;

public interface UserInfoMapper {
	public List<UserInfoVO> selectUserInfoList(UserInfoVO user);
	public UserInfoVO selectUserInfo(UserInfoVO user);
	public UserInfoVO loginUserInfo(UserInfoVO user);
	public UserInfoVO doLogin(UserInfoVO user);
	public int insertUserInfo(UserInfoVO user);
	public int updateUserInfo(UserInfoVO user);
	public int deleteUserInfos(UserInfoVO user);
	public int deleteUserInfo(UserInfoVO user);
	
}
