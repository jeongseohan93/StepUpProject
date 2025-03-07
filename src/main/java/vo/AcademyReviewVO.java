package vo;

public class AcademyReviewVO {
    private int review_idx,rating,academy_idx;
    private String academy_id,stepup_id,content,created_at,updated_at;

    public int getReview_idx() {
        return review_idx;
    }

    public void setReview_idx(int review_idx) {
        this.review_idx = review_idx;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public int getAcademy_idx() {
        return academy_idx;
    }

    public void setAcademy_idx(int academy_idx) {
        this.academy_idx = academy_idx;
    }

    public String getAcademy_id() {
        return academy_id;
    }

    public void setAcademy_id(String academy_id) {
        this.academy_id = academy_id;
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
}
