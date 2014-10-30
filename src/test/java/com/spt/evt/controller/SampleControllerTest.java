package com.spt.evt.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.servlet.HandlerAdapter;
import org.springframework.web.servlet.HandlerExecutionChain;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.HandlerMapping;
import org.springframework.web.servlet.ModelAndView;

public class SampleControllerTest extends AbstractTestController {
	private final static Logger logger = LoggerFactory.getLogger(SampleControllerTest.class);
//	@Autowired
//	private HandlerAdapter handlerAdapter;
//	@Autowired
//	private HandlerMapping handlerMapping;
//	private MockHttpServletRequest request;
//	private MockHttpServletResponse response;
//
//	
//	private ModelAndView handle(final HttpServletRequest request,
//			final HttpServletResponse response) throws Exception {
//		final HandlerExecutionChain handler = handlerMapping
//				.getHandler(request);
//
//		final Object controller = handler.getHandler();
//		for (final HandlerInterceptor interceptor : handlerMapping.getHandler(
//				request).getInterceptors()) {
//			if (!interceptor.preHandle(request, response, controller)) {
//				return null;
//			}
//		}
//		return handlerAdapter.handle(request, response, controller);
//	}
//
//	@Before
//	public void setUp() {
//		request = new MockHttpServletRequest();
//		response = new MockHttpServletResponse();
//	}
//	
//	@Test
//	public void testHandleRequest() throws Exception {
//	request.setContentType("application/html");
//	request.setMethod("GET");
//	request.setRequestURI("/evaluateboard");
//	final ModelAndView mav = handle(request, response);
//	logger.debug("Result : {}",mav);
//	Assert.assertEquals("!! Un-expectedResult !!","evaluateboard",mav.getViewName());
//	}
}
