package vo;

public class InstructorReviewVO {
    private int instructor_review_idx;
    private String instructor_id,stepup_id,content,created_at,updated_at;
    private float rating;

    public int getInstructor_review_idx() {
        return instructor_review_idx;
    }

    public void setInstructor_review_idx(int instructor_review_idx) {
        this.instructor_review_idx = instructor_review_idx;
    }

    public String getInstructor_id() {
        return instructor_id;
    }

    public void setInstructor_id(String instructor_id) {
        this.instructor_id = instructor_id;
    }

    public String getStepup_id() {
        return stepup_id;
    }

    public void setStepup_id(String stepup_id) {
        this.stepup_id = stepup_id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }

    public String getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(String updated_at) {
        this.updated_at = updated_at;
    }

    public float getRating() {
        return rating;
    }

    public void setRating(float rating) {
        this.rating = rating;
    }
}
