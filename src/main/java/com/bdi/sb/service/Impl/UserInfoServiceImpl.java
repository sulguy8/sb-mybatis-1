package com.bdi.sb.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bdi.sb.mapper.UserInfoMapper;
import com.bdi.sb.service.UserInfoService;
import com.bdi.sb.vo.UserInfoVO;

@Service
public class UserInfoServiceImpl implements UserInfoService {
	
	@Resource
	private UserInfoMapper uiMapper;
	
	@Override
	public List<UserInfoVO> selectUserInfoList(UserInfoVO user) {
		return uiMapper.selectUserInfoList(user);
	}

}
