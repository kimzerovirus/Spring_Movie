package org.kzv.domain;

public class NotUserException extends Exception {
	
	public NotUserException() {
		super("NotUserException");
	}
	
	public NotUserException(String message) {
		super(message);
	}
	


}
