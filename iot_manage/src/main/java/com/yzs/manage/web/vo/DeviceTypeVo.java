package com.yzs.manage.web.vo;

public class DeviceTypeVo {

    private String id;

    private String name;

    private Integer deviceNum;

    public DeviceTypeVo(){}

    public DeviceTypeVo(String id, String name, Integer deviceNum) {
        this.id = id;
        this.name = name;
        this.deviceNum = deviceNum;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {

        this.name = name == null ? null : name.trim();
    }

    public Integer getDeviceNum() {
        return deviceNum;
    }

    public void setDeviceNum(Integer deviceNum) {
        this.deviceNum = deviceNum;
    }
}
