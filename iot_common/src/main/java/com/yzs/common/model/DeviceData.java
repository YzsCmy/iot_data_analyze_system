package com.yzs.common.model;

import com.yzs.common.utils.DateUtils;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;
@Table(name = "device_data")
public class DeviceData {
    @Id
    private String id;

    @Transient
    private String name;

    @Column(name = "value")
    private Float value;

    private Date createdTime;
    @Transient
    private String createdTimeStr;
    @Transient
    private String typeName;
    @Transient
    private String pointName;
    @Transient
    private String unitName;

    /**
     * 状态 0 不可用 1 正常
     */
    private Integer status;
    @Transient
    private String statusStr;

    private String typeId;

    private String pointId;

    private String unitId;

    private String deviceId;

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

    public Float getValue() {
        return value;
    }

    public void setValue(Float value) {
        this.value = value;
    }

    public String getCreatedTimeStr() {
        if(createdTime!=null){
            createdTimeStr = DateUtils.date2string(createdTime,"yyyy-MM-dd HH:mm");
        }

        return createdTimeStr;
    }

    public void setCreatedTimeStr(String createdTimeStr) {
        this.createdTimeStr = createdTimeStr;
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName == null ? null : typeName.trim();
    }

    public String getPointName() {
        return pointName;
    }

    public void setPointName(String pointName) {
        this.pointName = pointName == null ? null : pointName.trim();
    }

    public String getUnitName() {
        return unitName;
    }

    public void setUnitName(String unitName) {
        this.unitName = unitName == null ? null : unitName.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getTypeId() {
        return typeId;
    }

    public void setTypeId(String typeId) {
        this.typeId = typeId == null ? null : typeId.trim();
    }

    public String getPointId() {
        return pointId;
    }

    public void setPointId(String pointId) {
        this.pointId = pointId == null ? null : pointId.trim();
    }

    public String getUnitId() {
        return unitId;
    }

    public void setUnitId(String unitId) {
        this.unitId = unitId == null ? null : unitId.trim();
    }

    public String getDeviceId() {
        return deviceId;
    }

    public void setDeviceId(String deviceId) {
        this.deviceId = deviceId == null ? null : deviceId.trim();
    }

    public String getStatusStr() {
        if(status==1){
            statusStr = "正常";
        }else if(status==0){
            statusStr = "不可用";
        }
        return statusStr;
    }

    public void setStatusStr(String statusStr) {
        this.statusStr = statusStr;
    }

    @Override
    public String toString() {
        return "DeviceData{" +
                "id='" + id + '\'' +
                ", value=" + value +
                ", createdTime=" + createdTime +
                ", status=" + status +
                ", typeId='" + typeId + '\'' +
                ", pointId='" + pointId + '\'' +
                ", unitId='" + unitId + '\'' +
                ", deviceId='" + deviceId + '\'' +
                '}';
    }
}