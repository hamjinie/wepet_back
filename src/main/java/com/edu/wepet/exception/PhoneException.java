package com.edu.wepet.exception;

public class PhoneException extends RuntimeException{
	
	public PhoneException(String msg) {
		super(msg);
	}
	public PhoneException(String msg, Throwable e) {
		super(msg, e);
	}
	
}
