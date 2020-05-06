package com.yzs.common.Exceptiion;

import com.yzs.common.enums.ExceptionEnum;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Getter
public class IOTException extends RuntimeException {
    private ExceptionEnum exceptionEnum;
}
