package com.spt.evt.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;


//@Aspect
//@Component
public class LoggingHelper{
 	private static final Logger logger = LoggerFactory.getLogger(LoggingHelper.class);
	
	//@Before("execution(* com.spt.evt.controller..*.*(..))")
//	public void doBefore(JoinPoint joinPoint) throws Throwable {
//		logger.info("***** execution  NONG ("+joinPoint.getSignature().toLongString()+")");
//	}
 	@Pointcut("execution(* *..controller..*.*(..))")
    public void businessMethods() { 
        logger.info(" ===businessMethods===");
    }
  
// 	@Before("execution(* com.spt.evt.controller.BaseController.*(..))")
//    public void before() {
// 		
//        logger.info("3 Before method is called");
//    }
 	
 	  @Before("execution(* *..controller..*.*(..))")
 		public void doBefore(JoinPoint joinPoint) throws Throwable {
 		 logger.info("3 Before method is called");
 	    	//super.doBefore(joinPoint);
 	    }
 	  
//    @After("businessMethods()")
//    public void after() {
//        logger.info("6 After method is called");
//    }
//    @AfterReturning("businessMethods()")
//    public void afterReturning() {
//        logger.info("7 After returning method is called");
//    }
//    @AfterThrowing("businessMethods()")
//    public void afterThrowing() {
//        logger.info("8 After throwing method is called");
//    }
//    @Around("businessMethods()")
//    public void around(ProceedingJoinPoint joinPoint) throws Throwable {
//         logger.info("1 Around method is called");
//         logger.info("2 Around before is running!");
//         joinPoint.proceed(); 
//         logger.info("4 Around after is running!");  
//
//         logger.info("5 execution ("+joinPoint.getSignature().toLongString()+")");  
//    }
	
}
