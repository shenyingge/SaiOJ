package cn.sai.entity;

import java.io.Serializable;

public class Explanation implements Serializable {

    private Integer eid;

    private Integer uid;

    private Integer pid;

    private String content;

    @Override
    public String toString() {
        return "Explanation{" +
                "eid=" + eid +
                ", uid=" + uid +
                ", pid=" + pid +
                ", content='" + content + '\'' +
                '}';
    }

    public Integer getEid() {
        return eid;
    }

    public void setEid(Integer eid) {
        this.eid = eid;
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}