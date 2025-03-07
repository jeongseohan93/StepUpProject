package vo;

public class CartVO {
    private int cart_idx;           // cart_idx
    private String stepup_id;       // stepup_id
    private String stepup_name;     // stepup_name
    private String stepup_email;    // stepup_email
    private String stepup_phone;    // stepup_phone
    private int schedule_idx;        // lecture_idx
    private String subject;    // lecture_name
    private String school_type; // lecture_category
    private int price;      // lecture_price (int로 유지)
    private String time_slot; // 강의 시작 날짜
    private int total_price;
    private String cart_date;
    private int quantity; // 필드 추가
	private int instructor_idx;


	public int getCart_idx() {
		return cart_idx;
	}

	public void setCart_idx(int cart_idx) {
		this.cart_idx = cart_idx;
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

	public String getStepup_email() {
		return stepup_email;
	}

	public void setStepup_email(String stepup_email) {
		this.stepup_email = stepup_email;
	}

	public String getStepup_phone() {
		return stepup_phone;
	}

	public void setStepup_phone(String stepup_phone) {
		this.stepup_phone = stepup_phone;
	}

	public int getSchedule_idx() {
		return schedule_idx;
	}

	public void setSchedule_idx(int schedule_idx) {
		this.schedule_idx = schedule_idx;
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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getTime_slot() {
		return time_slot;
	}

	public void setTime_slot(String time_slot) {
		this.time_slot = time_slot;
	}

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}

	public String getCart_date() {
		return cart_date;
	}

	public void setCart_date(String cart_date) {
		this.cart_date = cart_date;
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
}
