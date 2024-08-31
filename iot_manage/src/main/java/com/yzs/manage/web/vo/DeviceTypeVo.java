package com.yzs.manage.web.vo;

public class DeviceTypeVo {

    private String id;

    private String name;
    private String unit;

    private Integer deviceNum;

    public DeviceTypeVo(){}

    public DeviceTypeVo(String id, String name, String unit, Integer deviceNum) {
        this.id = id;
        this.name = name;
        this.unit = unit;
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

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public Integer getDeviceNum() {
        return deviceNum;
    }

    public void setDeviceNum(Integer deviceNum) {
        this.deviceNum = deviceNum;
    }
}
