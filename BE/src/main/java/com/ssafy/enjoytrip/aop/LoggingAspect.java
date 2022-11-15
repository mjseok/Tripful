package com.ssafy.enjoytrip.aop;

import java.util.Arrays;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StopWatch;

//@Component
@Aspect
public class LoggingAspect {

//	private Logger logger = LoggerFactory.getLogger(LoggingAspect.class);
//
//	@Before(value = "execution(* com.ssafy.board.model..Board*.*(..))")
//	public void loggin(JoinPoint joinPoint) {
//		logger.debug("before call method : {} ", joinPoint.getSignature());
//		logger.debug("메서드 선언부 : {} 전달 파라미터 : {}", joinPoint.getSignature(), Arrays.toString(joinPoint.getArgs()));
//	}
//
//	@Around(value = "execution(* com.ssafy.board.model..Board*.*(..))")
//	public Object executionTime(ProceedingJoinPoint joinPoint) throws Throwable {
//		logger.debug("around call method : {} ", joinPoint.getSignature());
//		StopWatch stopWatch = new StopWatch();
//		stopWatch.start();
//		
//		Object proceed = joinPoint.proceed();
//		
//		stopWatch.stop();
//		
//		logger.debug("summary : {}", stopWatch.shortSummary());
//		logger.debug("totalTime : {}", stopWatch.getTotalTimeMillis());
//		logger.debug("pretty : {}", stopWatch.prettyPrint());
//		
//		return proceed;
//	}
//
//	@AfterReturning(value = "execution(* com.ssafy.board.model..Board*.list*(..))", returning = "obj")
//	public void afterReturningMethod(JoinPoint joinPoint, Object obj) {
//		logger.debug("afterReturning call method : {} ", joinPoint.getSignature());
//		logger.debug("return value : {}", obj);
//	}
//
//	@AfterThrowing(value = "execution(* com.ssafy.board.model..Board*.list*(..))", throwing = "exception")
//	public void afterThrowingMethod(JoinPoint joinPoint, Exception exception) {
//		logger.debug("afterThrowing call method : {}", joinPoint.getSignature());
//		logger.debug("exception : {}", exception);
//	}
//
//	@After(value = "execution(* com.ssafy.board.model..Board*.list*(..))")
//	public void afterMethod(JoinPoint joinPoint) {
//		logger.debug("after call method : {}", joinPoint.getSignature());
//	}
	
}