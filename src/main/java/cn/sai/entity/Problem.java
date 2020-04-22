package cn.sai.entity;

public class Problem {
    private Integer pid;

    private String title;

    private String description;

    private String input;

    private String output;

    private Integer timeLimit;

    private Integer memoryLimit;

    private Integer submitTimes;

    private Float acRate;

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public String getInput() {
        return input;
    }

    public void setInput(String input) {
        this.input = input == null ? null : input.trim();
    }

    public String getOutput() {
        return output;
    }

    public void setOutput(String output) {
        this.output = output == null ? null : output.trim();
    }

    public Integer getTimeLimit() {
        return timeLimit;
    }

    public void setTimeLimit(Integer timeLimit) {
        this.timeLimit = timeLimit;
    }

    public Integer getMemoryLimit() {
        return memoryLimit;
    }

    public void setMemoryLimit(Integer memoryLimit) {
        this.memoryLimit = memoryLimit;
    }

    public Integer getSubmitTimes() {
        return submitTimes;
    }

    public void setSubmitTimes(Integer submitTimes) {
        this.submitTimes = submitTimes;
    }

    public Float getAcRate() {
        return acRate;
    }

    public void setAcRate(Float acRate) {
        this.acRate = acRate;
    }
}