package com.edu.wepet.exception;

public class PetsitterException extends RuntimeException{
	
	public PetsitterException(String msg) {
		super(msg);
	}
	public PetsitterException(String msg, Throwable e) {
		super(msg, e);
	}
	
}
