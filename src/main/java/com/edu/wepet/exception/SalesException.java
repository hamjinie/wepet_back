package com.edu.wepet.exception;

public class SalesException extends RuntimeException {

	public SalesException(String msg) {
		super(msg);
	}

	public SalesException(String msg, Throwable e) {
		super(msg, e);
	}

}
