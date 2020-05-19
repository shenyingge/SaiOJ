package cn.sai.entity;

public class ExplanationDtoWithProblem {

    private Explanation explanation;

    private Problem problem;

    public ExplanationDtoWithProblem() {
    }

    public ExplanationDtoWithProblem(Explanation explanation, Problem problem) {
        this.explanation = explanation;
        this.problem = problem;
    }

    @Override
    public String toString() {
        return "ExplanationDtoWithProblem{" +
                "explanation=" + explanation +
                ", problem=" + problem +
                '}';
    }

    public Explanation getExplanation() {
        return explanation;
    }

    public void setExplanation(Explanation explanation) {
        this.explanation = explanation;
    }

    public Problem getProblem() {
        return problem;
    }

    public void setProblem(Problem problem) {
        this.problem = problem;
    }
}
