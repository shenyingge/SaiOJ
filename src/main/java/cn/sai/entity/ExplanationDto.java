package cn.sai.entity;

import java.io.Serializable;

public class ExplanationDto implements Serializable {

    private Explanation explanation;

    private User user;

    public ExplanationDto() {
    }

    public ExplanationDto(Explanation explanation, User user) {
        this.explanation = explanation;
        this.user = user;
    }

    @Override
    public String toString() {
        return "ExplanationDto{" +
                "explanation=" + explanation +
                ", user=" + user +
                '}';
    }

    public Explanation getExplanation() {
        return explanation;
    }

    public void setExplanation(Explanation explanation) {
        this.explanation = explanation;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
