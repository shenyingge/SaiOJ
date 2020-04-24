package cn.sai.entity;

import java.io.Serializable;

public class Tag implements Serializable {
    private Integer tid;

    private String name;

    public Tag() {
    }

    @Override
    public String toString() {
        return "Tag{" +
                "tid=" + tid +
                ", name='" + name + '\'' +
                '}';
    }

    public Tag(String name) {
        this.name = name;
    }

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }
}