package cn.sai.entity;

import java.util.ArrayList;
import java.util.List;

public class ProblemExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ProblemExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andPidIsNull() {
            addCriterion("pid is null");
            return (Criteria) this;
        }

        public Criteria andPidIsNotNull() {
            addCriterion("pid is not null");
            return (Criteria) this;
        }

        public Criteria andPidEqualTo(Integer value) {
            addCriterion("pid =", value, "pid");
            return (Criteria) this;
        }

        public Criteria andPidNotEqualTo(Integer value) {
            addCriterion("pid <>", value, "pid");
            return (Criteria) this;
        }

        public Criteria andPidGreaterThan(Integer value) {
            addCriterion("pid >", value, "pid");
            return (Criteria) this;
        }

        public Criteria andPidGreaterThanOrEqualTo(Integer value) {
            addCriterion("pid >=", value, "pid");
            return (Criteria) this;
        }

        public Criteria andPidLessThan(Integer value) {
            addCriterion("pid <", value, "pid");
            return (Criteria) this;
        }

        public Criteria andPidLessThanOrEqualTo(Integer value) {
            addCriterion("pid <=", value, "pid");
            return (Criteria) this;
        }

        public Criteria andPidIn(List<Integer> values) {
            addCriterion("pid in", values, "pid");
            return (Criteria) this;
        }

        public Criteria andPidNotIn(List<Integer> values) {
            addCriterion("pid not in", values, "pid");
            return (Criteria) this;
        }

        public Criteria andPidBetween(Integer value1, Integer value2) {
            addCriterion("pid between", value1, value2, "pid");
            return (Criteria) this;
        }

        public Criteria andPidNotBetween(Integer value1, Integer value2) {
            addCriterion("pid not between", value1, value2, "pid");
            return (Criteria) this;
        }

        public Criteria andTitleIsNull() {
            addCriterion("title is null");
            return (Criteria) this;
        }

        public Criteria andTitleIsNotNull() {
            addCriterion("title is not null");
            return (Criteria) this;
        }

        public Criteria andTitleEqualTo(String value) {
            addCriterion("title =", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotEqualTo(String value) {
            addCriterion("title <>", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleGreaterThan(String value) {
            addCriterion("title >", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleGreaterThanOrEqualTo(String value) {
            addCriterion("title >=", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLessThan(String value) {
            addCriterion("title <", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLessThanOrEqualTo(String value) {
            addCriterion("title <=", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLike(String value) {
            addCriterion("title like", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotLike(String value) {
            addCriterion("title not like", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleIn(List<String> values) {
            addCriterion("title in", values, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotIn(List<String> values) {
            addCriterion("title not in", values, "title");
            return (Criteria) this;
        }

        public Criteria andTitleBetween(String value1, String value2) {
            addCriterion("title between", value1, value2, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotBetween(String value1, String value2) {
            addCriterion("title not between", value1, value2, "title");
            return (Criteria) this;
        }

        public Criteria andDescriptionIsNull() {
            addCriterion("description is null");
            return (Criteria) this;
        }

        public Criteria andDescriptionIsNotNull() {
            addCriterion("description is not null");
            return (Criteria) this;
        }

        public Criteria andDescriptionEqualTo(String value) {
            addCriterion("description =", value, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionNotEqualTo(String value) {
            addCriterion("description <>", value, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionGreaterThan(String value) {
            addCriterion("description >", value, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionGreaterThanOrEqualTo(String value) {
            addCriterion("description >=", value, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionLessThan(String value) {
            addCriterion("description <", value, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionLessThanOrEqualTo(String value) {
            addCriterion("description <=", value, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionLike(String value) {
            addCriterion("description like", value, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionNotLike(String value) {
            addCriterion("description not like", value, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionIn(List<String> values) {
            addCriterion("description in", values, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionNotIn(List<String> values) {
            addCriterion("description not in", values, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionBetween(String value1, String value2) {
            addCriterion("description between", value1, value2, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionNotBetween(String value1, String value2) {
            addCriterion("description not between", value1, value2, "description");
            return (Criteria) this;
        }

        public Criteria andInputIsNull() {
            addCriterion("input is null");
            return (Criteria) this;
        }

        public Criteria andInputIsNotNull() {
            addCriterion("input is not null");
            return (Criteria) this;
        }

        public Criteria andInputEqualTo(String value) {
            addCriterion("input =", value, "input");
            return (Criteria) this;
        }

        public Criteria andInputNotEqualTo(String value) {
            addCriterion("input <>", value, "input");
            return (Criteria) this;
        }

        public Criteria andInputGreaterThan(String value) {
            addCriterion("input >", value, "input");
            return (Criteria) this;
        }

        public Criteria andInputGreaterThanOrEqualTo(String value) {
            addCriterion("input >=", value, "input");
            return (Criteria) this;
        }

        public Criteria andInputLessThan(String value) {
            addCriterion("input <", value, "input");
            return (Criteria) this;
        }

        public Criteria andInputLessThanOrEqualTo(String value) {
            addCriterion("input <=", value, "input");
            return (Criteria) this;
        }

        public Criteria andInputLike(String value) {
            addCriterion("input like", value, "input");
            return (Criteria) this;
        }

        public Criteria andInputNotLike(String value) {
            addCriterion("input not like", value, "input");
            return (Criteria) this;
        }

        public Criteria andInputIn(List<String> values) {
            addCriterion("input in", values, "input");
            return (Criteria) this;
        }

        public Criteria andInputNotIn(List<String> values) {
            addCriterion("input not in", values, "input");
            return (Criteria) this;
        }

        public Criteria andInputBetween(String value1, String value2) {
            addCriterion("input between", value1, value2, "input");
            return (Criteria) this;
        }

        public Criteria andInputNotBetween(String value1, String value2) {
            addCriterion("input not between", value1, value2, "input");
            return (Criteria) this;
        }

        public Criteria andOutputIsNull() {
            addCriterion("output is null");
            return (Criteria) this;
        }

        public Criteria andOutputIsNotNull() {
            addCriterion("output is not null");
            return (Criteria) this;
        }

        public Criteria andOutputEqualTo(String value) {
            addCriterion("output =", value, "output");
            return (Criteria) this;
        }

        public Criteria andOutputNotEqualTo(String value) {
            addCriterion("output <>", value, "output");
            return (Criteria) this;
        }

        public Criteria andOutputGreaterThan(String value) {
            addCriterion("output >", value, "output");
            return (Criteria) this;
        }

        public Criteria andOutputGreaterThanOrEqualTo(String value) {
            addCriterion("output >=", value, "output");
            return (Criteria) this;
        }

        public Criteria andOutputLessThan(String value) {
            addCriterion("output <", value, "output");
            return (Criteria) this;
        }

        public Criteria andOutputLessThanOrEqualTo(String value) {
            addCriterion("output <=", value, "output");
            return (Criteria) this;
        }

        public Criteria andOutputLike(String value) {
            addCriterion("output like", value, "output");
            return (Criteria) this;
        }

        public Criteria andOutputNotLike(String value) {
            addCriterion("output not like", value, "output");
            return (Criteria) this;
        }

        public Criteria andOutputIn(List<String> values) {
            addCriterion("output in", values, "output");
            return (Criteria) this;
        }

        public Criteria andOutputNotIn(List<String> values) {
            addCriterion("output not in", values, "output");
            return (Criteria) this;
        }

        public Criteria andOutputBetween(String value1, String value2) {
            addCriterion("output between", value1, value2, "output");
            return (Criteria) this;
        }

        public Criteria andOutputNotBetween(String value1, String value2) {
            addCriterion("output not between", value1, value2, "output");
            return (Criteria) this;
        }

        public Criteria andTimeLimitIsNull() {
            addCriterion("time_limit is null");
            return (Criteria) this;
        }

        public Criteria andTimeLimitIsNotNull() {
            addCriterion("time_limit is not null");
            return (Criteria) this;
        }

        public Criteria andTimeLimitEqualTo(Integer value) {
            addCriterion("time_limit =", value, "timeLimit");
            return (Criteria) this;
        }

        public Criteria andTimeLimitNotEqualTo(Integer value) {
            addCriterion("time_limit <>", value, "timeLimit");
            return (Criteria) this;
        }

        public Criteria andTimeLimitGreaterThan(Integer value) {
            addCriterion("time_limit >", value, "timeLimit");
            return (Criteria) this;
        }

        public Criteria andTimeLimitGreaterThanOrEqualTo(Integer value) {
            addCriterion("time_limit >=", value, "timeLimit");
            return (Criteria) this;
        }

        public Criteria andTimeLimitLessThan(Integer value) {
            addCriterion("time_limit <", value, "timeLimit");
            return (Criteria) this;
        }

        public Criteria andTimeLimitLessThanOrEqualTo(Integer value) {
            addCriterion("time_limit <=", value, "timeLimit");
            return (Criteria) this;
        }

        public Criteria andTimeLimitIn(List<Integer> values) {
            addCriterion("time_limit in", values, "timeLimit");
            return (Criteria) this;
        }

        public Criteria andTimeLimitNotIn(List<Integer> values) {
            addCriterion("time_limit not in", values, "timeLimit");
            return (Criteria) this;
        }

        public Criteria andTimeLimitBetween(Integer value1, Integer value2) {
            addCriterion("time_limit between", value1, value2, "timeLimit");
            return (Criteria) this;
        }

        public Criteria andTimeLimitNotBetween(Integer value1, Integer value2) {
            addCriterion("time_limit not between", value1, value2, "timeLimit");
            return (Criteria) this;
        }

        public Criteria andMemoryLimitIsNull() {
            addCriterion("memory_limit is null");
            return (Criteria) this;
        }

        public Criteria andMemoryLimitIsNotNull() {
            addCriterion("memory_limit is not null");
            return (Criteria) this;
        }

        public Criteria andMemoryLimitEqualTo(Integer value) {
            addCriterion("memory_limit =", value, "memoryLimit");
            return (Criteria) this;
        }

        public Criteria andMemoryLimitNotEqualTo(Integer value) {
            addCriterion("memory_limit <>", value, "memoryLimit");
            return (Criteria) this;
        }

        public Criteria andMemoryLimitGreaterThan(Integer value) {
            addCriterion("memory_limit >", value, "memoryLimit");
            return (Criteria) this;
        }

        public Criteria andMemoryLimitGreaterThanOrEqualTo(Integer value) {
            addCriterion("memory_limit >=", value, "memoryLimit");
            return (Criteria) this;
        }

        public Criteria andMemoryLimitLessThan(Integer value) {
            addCriterion("memory_limit <", value, "memoryLimit");
            return (Criteria) this;
        }

        public Criteria andMemoryLimitLessThanOrEqualTo(Integer value) {
            addCriterion("memory_limit <=", value, "memoryLimit");
            return (Criteria) this;
        }

        public Criteria andMemoryLimitIn(List<Integer> values) {
            addCriterion("memory_limit in", values, "memoryLimit");
            return (Criteria) this;
        }

        public Criteria andMemoryLimitNotIn(List<Integer> values) {
            addCriterion("memory_limit not in", values, "memoryLimit");
            return (Criteria) this;
        }

        public Criteria andMemoryLimitBetween(Integer value1, Integer value2) {
            addCriterion("memory_limit between", value1, value2, "memoryLimit");
            return (Criteria) this;
        }

        public Criteria andMemoryLimitNotBetween(Integer value1, Integer value2) {
            addCriterion("memory_limit not between", value1, value2, "memoryLimit");
            return (Criteria) this;
        }

        public Criteria andSubmitTimesIsNull() {
            addCriterion("submit_times is null");
            return (Criteria) this;
        }

        public Criteria andSubmitTimesIsNotNull() {
            addCriterion("submit_times is not null");
            return (Criteria) this;
        }

        public Criteria andSubmitTimesEqualTo(Integer value) {
            addCriterion("submit_times =", value, "submitTimes");
            return (Criteria) this;
        }

        public Criteria andSubmitTimesNotEqualTo(Integer value) {
            addCriterion("submit_times <>", value, "submitTimes");
            return (Criteria) this;
        }

        public Criteria andSubmitTimesGreaterThan(Integer value) {
            addCriterion("submit_times >", value, "submitTimes");
            return (Criteria) this;
        }

        public Criteria andSubmitTimesGreaterThanOrEqualTo(Integer value) {
            addCriterion("submit_times >=", value, "submitTimes");
            return (Criteria) this;
        }

        public Criteria andSubmitTimesLessThan(Integer value) {
            addCriterion("submit_times <", value, "submitTimes");
            return (Criteria) this;
        }

        public Criteria andSubmitTimesLessThanOrEqualTo(Integer value) {
            addCriterion("submit_times <=", value, "submitTimes");
            return (Criteria) this;
        }

        public Criteria andSubmitTimesIn(List<Integer> values) {
            addCriterion("submit_times in", values, "submitTimes");
            return (Criteria) this;
        }

        public Criteria andSubmitTimesNotIn(List<Integer> values) {
            addCriterion("submit_times not in", values, "submitTimes");
            return (Criteria) this;
        }

        public Criteria andSubmitTimesBetween(Integer value1, Integer value2) {
            addCriterion("submit_times between", value1, value2, "submitTimes");
            return (Criteria) this;
        }

        public Criteria andSubmitTimesNotBetween(Integer value1, Integer value2) {
            addCriterion("submit_times not between", value1, value2, "submitTimes");
            return (Criteria) this;
        }

        public Criteria andAcRateIsNull() {
            addCriterion("ac_rate is null");
            return (Criteria) this;
        }

        public Criteria andAcRateIsNotNull() {
            addCriterion("ac_rate is not null");
            return (Criteria) this;
        }

        public Criteria andAcRateEqualTo(Float value) {
            addCriterion("ac_rate =", value, "acRate");
            return (Criteria) this;
        }

        public Criteria andAcRateNotEqualTo(Float value) {
            addCriterion("ac_rate <>", value, "acRate");
            return (Criteria) this;
        }

        public Criteria andAcRateGreaterThan(Float value) {
            addCriterion("ac_rate >", value, "acRate");
            return (Criteria) this;
        }

        public Criteria andAcRateGreaterThanOrEqualTo(Float value) {
            addCriterion("ac_rate >=", value, "acRate");
            return (Criteria) this;
        }

        public Criteria andAcRateLessThan(Float value) {
            addCriterion("ac_rate <", value, "acRate");
            return (Criteria) this;
        }

        public Criteria andAcRateLessThanOrEqualTo(Float value) {
            addCriterion("ac_rate <=", value, "acRate");
            return (Criteria) this;
        }

        public Criteria andAcRateIn(List<Float> values) {
            addCriterion("ac_rate in", values, "acRate");
            return (Criteria) this;
        }

        public Criteria andAcRateNotIn(List<Float> values) {
            addCriterion("ac_rate not in", values, "acRate");
            return (Criteria) this;
        }

        public Criteria andAcRateBetween(Float value1, Float value2) {
            addCriterion("ac_rate between", value1, value2, "acRate");
            return (Criteria) this;
        }

        public Criteria andAcRateNotBetween(Float value1, Float value2) {
            addCriterion("ac_rate not between", value1, value2, "acRate");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}