package com.yzs.common.advice;

import com.yzs.common.Exceptiion.IOTException;
import com.yzs.common.vo.Result;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

@ControllerAdvice("com.yzs.manage")
public class CommonExceptionHandler {

    @ExceptionHandler(IOTException.class)
    @ResponseBody
    public Result handeException(IOTException e){

        return new Result(false, e.getExceptionEnum().getCode(),e.getExceptionEnum().getMsg());
    }
}
