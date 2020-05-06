package com.yzs.common.vo;

public class StatusCode {
    public static final int OK=20000;//成功
    public static final int ERROR =20001;//失败
    public static final int LOGINERROR =20002;//用户名或密码错误
    public static final int ACCESSERROR =20003;//权限不足
    public static final int PWDERROR =20004;//密码错误
    public static final int ADDUSERERROR =20005;//用户名已存在错误
    //public static final int ADDJOBERROR =20010;//添加job错误
    public static final int ADDMEASUREPOINTERROR =20006;//测点名已存在错误
    public static final int ADDUNITERROR =20007;//单元名已存在错误
    public static final int ADDDEVICETYPEERROR =20008;//设备类型已存在错误
    public static final int ADDDEVICEERROR =20009;//设备已存在错误
}
