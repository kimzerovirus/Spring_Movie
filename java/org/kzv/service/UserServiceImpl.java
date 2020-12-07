package org.kzv.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import org.kzv.domain.NotUserException;
import org.kzv.domain.UserVO;
import org.kzv.mapper.UserMapper;

@Service("userServiceImpl") // Ŭ�����̸� ù���� �ҹ���
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
		// ȸ�� ���̵�� ȸ�������� ��������
		UserVO tmpUser = this.findUser(user);
		if (tmpUser == null) {
			// ���̵� �������� �ʴ� ���
			throw new NotUserException("�������� �ʴ� ���̵�");
		}
		if(!tmpUser.getPwd().equals(user.getPwd())){
			throw new NotUserException("�н����尡 ��ġ��������");
		}
		return tmpUser;
	}


}
