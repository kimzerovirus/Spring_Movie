package org.kzv.mapper;

import org.kzv.domain.NotUserException;
import org.kzv.domain.UserVO;

public interface UserMapper {
	
	int createUser(UserVO user);
	Integer idCheck(String userid);
	
	UserVO getUser(int idx);
	UserVO findUser(UserVO user);
	
	UserVO loginCheck(UserVO user) throws NotUserException;
	
	
}
