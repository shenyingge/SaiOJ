package cn.sai.entity;

public class SubmissionDto {

    private Submission submission;

    private User user;

    private Problem problem;

    public SubmissionDto() {
    }

    public SubmissionDto(Submission submission, User user, Problem problem) {
        this.submission = submission;
        this.user = user;
        this.problem = problem;
    }

    @Override
    public String toString() {
        return "SubmissionDto{" +
                "submission=" + submission +
                ", user=" + user +
                ", problem=" + problem +
                '}';
    }

    public Problem getProblem() {
        return problem;
    }

    public void setProblem(Problem problem) {
        this.problem = problem;
    }

    public Submission getSubmission() {
        return submission;
    }

    public void setSubmission(Submission submission) {
        this.submission = submission;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
