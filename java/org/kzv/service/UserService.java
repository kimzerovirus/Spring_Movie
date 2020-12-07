package org.kzv.service;

import java.util.List;

import org.kzv.domain.NotUserException;
import org.kzv.domain.UserVO;

public interface UserService {
	
	int createUser(UserVO user);
	boolean idCheck(String userid);
	
	UserVO getUser(int idx);
	UserVO findUser(UserVO user);
	
	UserVO loginCheck(UserVO user) throws NotUserException;
}
