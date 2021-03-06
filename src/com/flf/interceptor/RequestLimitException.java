package com.flf.interceptor;

public class RequestLimitException extends Exception {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public RequestLimitException() {
        super("HTTP请求超出设定的限制");
    }

    public RequestLimitException(String message) {
        super(message);
    }

    public RequestLimitException(String message, Throwable cause){
        super(message, cause);
    }
}
