package cn.sai.entity;

import java.io.Serializable;

public class User implements Serializable {
    private Integer uid;

    private String username;

    private String password;

    private String nickname;

    private Integer problemAcNum;

    private Float acRate;

    private Integer rank;

    private String u1;

    public User() {
    }

    public User(String username, String password, String nickname) {
        this.username = username;
        this.password = password;
        this.nickname = nickname;
    }

    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", nickname='" + nickname + '\'' +
                ", problemAcNum=" + problemAcNum +
                ", acRate=" + acRate +
                ", rank=" + rank +
                ", u1='" + u1 + '\'' +
                '}';
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname == null ? null : nickname.trim();
    }

    public Integer getProblemAcNum() {
        return problemAcNum;
    }

    public void setProblemAcNum(Integer problemAcNum) {
        this.problemAcNum = problemAcNum;
    }

    public Float getAcRate() {
        return acRate;
    }

    public void setAcRate(Float acRate) {
        this.acRate = acRate;
    }

    public Integer getRank() {
        return rank;
    }

    public void setRank(Integer rank) {
        this.rank = rank;
    }

    public String getU1() {
        return u1;
    }

    public void setU1(String u1) {
        this.u1 = u1 == null ? null : u1.trim();
    }
}