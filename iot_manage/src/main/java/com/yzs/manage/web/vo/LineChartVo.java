package com.yzs.manage.web.vo;

import java.util.List;

public class LineChartVo {
    private List<String> names;
    private String[] dateList;
    private List<LineVo> lineVos;

    public List<String> getNames() {
        return names;
    }

    public void setNames(List<String> names) {
        this.names = names;
    }

    public String[] getDateList() {
        return dateList;
    }

    public void setDateList(String[] dateList) {
        this.dateList = dateList;
    }

    public List<LineVo> getLineVos() {
        return lineVos;
    }

    public void setLineVos(List<LineVo> lineVos) {
        this.lineVos = lineVos;
    }
}
