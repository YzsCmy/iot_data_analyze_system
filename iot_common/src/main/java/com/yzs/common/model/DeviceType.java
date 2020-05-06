package com.yzs.common.model;

import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "device_type")
public class DeviceType {
    @Id
    private String id;

    private String name;

    private String unit;

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
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
}