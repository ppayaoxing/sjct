package com.qfw.handle;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qfw.model.HandlerResponse;

public interface IHandler {

	/**
	 * 业务逻辑处理接口,该接口不抛出任何异常<br>
	 * 当遇到运行期异常由外界进行捕获返回
	 */
	public void doHandler(HttpServletRequest request, HttpServletResponse response, HandlerResponse handlerResponse) throws Exception;
	
}
