package vo;

public class CurseVO {
    private int curse_idx, schedule_idx, total_price, quantity, instructor_idx,academy_idx;
    private String stepup_id, stepup_name, curse_date, subject, school_type;

    public int getAcademy_idx() {
        return academy_idx;
    }

    public void setAcademy_idx(int academy_idx) {
        this.academy_idx = academy_idx;
    }

    public int getCurse_idx() {
        return curse_idx;
    }

    public void setCurse_idx(int curse_idx) {
        this.curse_idx = curse_idx;
    }

    public int getSchedule_idx() {
        return schedule_idx;
    }

    public void setSchedule_idx(int schedule_idx) {
        this.schedule_idx = schedule_idx;
    }

    public int getTotal_price() {
        return total_price;
    }

    public void setTotal_price(int total_price) {
        this.total_price = total_price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getInstructor_idx() {
        return instructor_idx;
    }

    public void setInstructor_idx(int instructor_idx) {
        this.instructor_idx = instructor_idx;
    }

    public String getStepup_id() {
        return stepup_id;
    }

    public void setStepup_id(String stepup_id) {
        this.stepup_id = stepup_id;
    }

    public String getStepup_name() {
        return stepup_name;
    }

    public void setStepup_name(String stepup_name) {
        this.stepup_name = stepup_name;
    }

    public String getCurse_date() {
        return curse_date;
    }

    public void setCurse_date(String curse_date) {
        this.curse_date = curse_date;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getSchool_type() {
        return school_type;
    }

    public void setSchool_type(String school_type) {
        this.school_type = school_type;
    }
}
