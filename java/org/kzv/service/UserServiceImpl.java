package org.kzv.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import org.kzv.domain.NotUserException;
import org.kzv.domain.UserVO;
import org.kzv.mapper.UserMapper;

@Service("userServiceImpl") // 클래스이름 첫글자 소문자
public class UserServiceImpl implements UserService {

	@Inject
	private UserMapper userMapper;

	@Override
	public int createUser(UserVO user) {
		return userMapper.createUser(user);
	}

	@Override
	public boolean idCheck(String userid) {
		Integer idx=this.userMapper.idCheck(userid);
		boolean bool=(idx==null)? true:false;
		return bool;
	}

	@Override
	public UserVO getUser(int idx) {
		return this.userMapper.getUser(idx);
	}

	@Override
	public UserVO findUser(UserVO user) {
		return this.userMapper.findUser(user);
	}

	@Override
	public UserVO loginCheck(UserVO user) throws NotUserException {
		// 회원 아이디로 회원정보를 가져오자
		UserVO tmpUser = this.findUser(user);
		if (tmpUser == null) {
			// 아이디가 존재하지 않는 경우
			throw new NotUserException("존재하지 않는 아이디");
		}
		if(!tmpUser.getPwd().equals(user.getPwd())){
			throw new NotUserException("패스워드가 일치하지않음");
		}
		return tmpUser;
	}


}
