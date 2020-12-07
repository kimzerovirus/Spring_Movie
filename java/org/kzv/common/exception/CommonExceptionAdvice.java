package org.kzv.common.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import org.kzv.domain.NotUserException;

import lombok.extern.log4j.Log4j;

@ControllerAdvice
@Log4j
public class CommonExceptionAdvice {
	
	@ExceptionHandler(NotUserException.class)
	public String commonLoginError(NotUserException ex) {
		log.error("로그인 처리 중 예외:" +ex.getMessage());
		return "errorAlert";
	}
}
