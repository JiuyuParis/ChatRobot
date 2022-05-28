package chatRobot;

import java.util.List;

/**
 * 聚合接口-历史上的今天实体类
 * @author 刘昌兴
 * @since 2022/5/28 11:54
 */
public class History {
    private String reason;
    private int error_code;
    private List<Result> result;

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public int getError_code() {
        return error_code;
    }

    public void setError_code(int error_code) {
        this.error_code = error_code;
    }

    public List<Result> getResult() {
        return result;
    }

    public void setResult(List<Result> result) {
        this.result = result;
    }
}
class Result{
    private String day;
    private String date;
    private String title;
    private String e_id;

    @Override
    public String toString() {
        return date +"  " + title+"<br>";
    }
}
