package cn.sai.entity;

import java.io.Serializable;
import java.util.Date;

public class Submission implements Serializable {
    private Integer sid;

    private String lan;

    private Date dateTime;

    private Integer uid;

    private Integer pid;

    private Integer status;

    private Double runTime;

    private Boolean isVisible;

    private String code;

    @Override
    public String toString() {
        return "Submission{" +
                "sid=" + sid +
                ", lan='" + lan + '\'' +
                ", dateTime=" + dateTime +
                ", uid=" + uid +
                ", pid=" + pid +
                ", status=" + status +
                ", runTime=" + runTime +
                ", isVisible=" + isVisible +
                ", code='" + code + '\'' +
                '}';
    }

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public String getLan() {
        return lan;
    }

    public void setLan(String lan) {
        this.lan = lan == null ? null : lan.trim();
    }

    public Date getDateTime() {
        return dateTime;
    }

    public void setDateTime(Date dateTime) {
        this.dateTime = dateTime;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Double getRunTime() {
        return runTime;
    }

    public void setRunTime(Double runTime) {
        this.runTime = runTime;
    }

    public Boolean getIsVisible() {
        return isVisible;
    }

    public void setIsVisible(Boolean isVisible) {
        this.isVisible = isVisible;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }
}