package vo;
public class ScheduleVO {
    private int schedule_idx;
    private int instructor_idx;
    private String instructor_name;
    private String time_slot;
    private String day_of_week;
    private String grade_level;
    private String school_type;
    private String subject;
    private int academy_idx;
    private int price;

    public int getSchedule_idx() {
        return schedule_idx;
    }

    public void setSchedule_idx(int schedule_idx) {
        this.schedule_idx = schedule_idx;
    }

    public int getInstructor_idx() {
        return instructor_idx;
    }

    public void setInstructor_idx(int instructor_idx) {
        this.instructor_idx = instructor_idx;
    }

    public String getInstructor_name() {
        return instructor_name;
    }

    public void setInstructor_name(String instructor_name) {
        this.instructor_name = instructor_name;
    }

    public String getTime_slot() {
        return time_slot;
    }

    public void setTime_slot(String time_slot) {
        this.time_slot = time_slot;
    }

    public String getDay_of_week() {
        return day_of_week;
    }

    public void setDay_of_week(String day_of_week) {
        this.day_of_week = day_of_week;
    }

    public String getGrade_level() {
        return grade_level;
    }

    public void setGrade_level(String grade_level) {
        this.grade_level = grade_level;
    }

    public String getSchool_type() {
        return school_type;
    }

    public void setSchool_type(String school_type) {
        this.school_type = school_type;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public int getAcademy_idx() {
        return academy_idx;
    }

    public void setAcademy_idx(int academy_idx) {
        this.academy_idx = academy_idx;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
}