package com.example.myauth.aspect;

import com.example.myauth.MyAuth;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;
import java.util.HashSet;
import java.util.Set;

@Aspect
@Component
public class DoJoinPoint {

    private static Set<String> whitelist;
    static {
        whitelist = new HashSet<>();
        whitelist.add("niu");
        whitelist.add("lily");
    }

    @Pointcut("@annotation(com.example.myauth.MyAuth)")
    public void aopPoint() {

    }

    @Around("aopPoint()")
    public Object doRouter(ProceedingJoinPoint jp) throws Throwable {
        Method method = getMethod(jp);
        Object[] args = jp.getArgs();
        MyAuth annotation = method.getAnnotation(MyAuth.class);
        if (annotation != null) {
            for (Object arg : args) {
                if (arg instanceof String && whitelist.contains(arg)) {
                    return jp.proceed();
                }
            }
        }
        return "调用非法";
    }

    private Method getMethod(JoinPoint jp) throws NoSuchMethodException {
        Signature sig = jp.getSignature();
        MethodSignature methodSignature = (MethodSignature) sig;
        return jp.getTarget().getClass().getMethod(methodSignature.getName(), methodSignature.getParameterTypes());
    }






}
