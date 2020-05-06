package com.yzs.common.enums;

import com.yzs.common.vo.StatusCode;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public enum ExceptionEnum {
    PASSWORD_NOT_EQUAL(StatusCode.PWDERROR,"密码认证失败!"),
    USERNAME_IS_EXIST(StatusCode.ADDUSERERROR,"用户名已存在！"),
    MEASUREPOINT_IS_EXIST(StatusCode.ADDMEASUREPOINTERROR,"测点名称已存在！"),
    UNITNAME_IS_EXIST(StatusCode.ADDUNITERROR,"单元名称已存在！"),
    DEVICETYPE_IS_EXIST(StatusCode.ADDDEVICETYPEERROR,"设备类型已存在！"),
    DEVICE_IS_EXIST(StatusCode.ADDDEVICEERROR,"设备已存在！"),
    //BRAND_INSERT_FAIL(500,"新增品牌失败"),
    //INVALID_CONTENT_TYPE(400,"无效的文件类型"),
    //UPLOAD_FILE_ERROR(500,"文件上传失败")
    ;
    private int code;
    private String msg;
}
