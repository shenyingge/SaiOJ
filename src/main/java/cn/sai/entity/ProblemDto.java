package cn.sai.entity;

import java.io.Serializable;
import java.util.List;

public class ProblemDto implements Serializable {

    private Problem problem;

    private List<Explanation> explanations;

    @Override
    public String toString() {
        return "ProblemDto{" +
                "problem=" + problem +
                ", explanations=" + explanations +
                '}';
    }

    public Problem getProblem() {
        return problem;
    }

    public void setProblem(Problem problem) {
        this.problem = problem;
    }

    public List<Explanation> getExplanations() {
        return explanations;
    }

    public void setExplanations(List<Explanation> explanations) {
        this.explanations = explanations;
    }
}
