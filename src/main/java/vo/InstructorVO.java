package vo;

import org.springframework.web.multipart.MultipartFile;

public class InstructorVO {
		private int instructor_idx,  academy_idx;
		private String instructor_id, instructor_pwd, instructor_name, instructor_email, instructor_address, instructor_gender, instructor_birthday, 
						instructor_nickname, instructor_phone, instructor_sub, instructor_category, instructor_profile,approval_status;

		private MultipartFile instructor_pic;

		private float instructor_rating;

	public int getInstructor_idx() {
		return instructor_idx;
	}

	public void setInstructor_idx(int instructor_idx) {
		this.instructor_idx = instructor_idx;
	}

	public int getAcademy_idx() {
		return academy_idx;
	}

	public void setAcademy_idx(int academy_idx) {
		this.academy_idx = academy_idx;
	}

	public String getInstructor_id() {
		return instructor_id;
	}

	public void setInstructor_id(String instructor_id) {
		this.instructor_id = instructor_id;
	}

	public String getInstructor_pwd() {
		return instructor_pwd;
	}

	public void setInstructor_pwd(String instructor_pwd) {
		this.instructor_pwd = instructor_pwd;
	}

	public String getInstructor_name() {
		return instructor_name;
	}

	public void setInstructor_name(String instructor_name) {
		this.instructor_name = instructor_name;
	}

	public String getInstructor_email() {
		return instructor_email;
	}

	public void setInstructor_email(String instructor_email) {
		this.instructor_email = instructor_email;
	}

	public String getInstructor_address() {
		return instructor_address;
	}

	public void setInstructor_address(String instructor_address) {
		this.instructor_address = instructor_address;
	}

	public String getInstructor_gender() {
		return instructor_gender;
	}

	public void setInstructor_gender(String instructor_gender) {
		this.instructor_gender = instructor_gender;
	}

	public String getInstructor_birthday() {
		return instructor_birthday;
	}

	public void setInstructor_birthday(String instructor_birthday) {
		this.instructor_birthday = instructor_birthday;
	}

	public String getInstructor_nickname() {
		return instructor_nickname;
	}

	public void setInstructor_nickname(String instructor_nickname) {
		this.instructor_nickname = instructor_nickname;
	}

	public String getInstructor_phone() {
		return instructor_phone;
	}

	public void setInstructor_phone(String instructor_phone) {
		this.instructor_phone = instructor_phone;
	}

	public String getInstructor_sub() {
		return instructor_sub;
	}

	public void setInstructor_sub(String instructor_sub) {
		this.instructor_sub = instructor_sub;
	}

	public String getInstructor_category() {
		return instructor_category;
	}

	public void setInstructor_category(String instructor_category) {
		this.instructor_category = instructor_category;
	}

	public String getInstructor_profile() {
		return instructor_profile;
	}

	public void setInstructor_profile(String instructor_profile) {
		this.instructor_profile = instructor_profile;
	}

	public String getApproval_status() {
		return approval_status;
	}

	public void setApproval_status(String approval_status) {
		this.approval_status = approval_status;
	}

	public MultipartFile getInstructor_pic() {
		return instructor_pic;
	}

	public void setInstructor_pic(MultipartFile instructor_pic) {
		this.instructor_pic = instructor_pic;
	}

	public float getInstructor_rating() {
		return instructor_rating;
	}

	public void setInstructor_rating(float instructor_rating) {
		this.instructor_rating = instructor_rating;
	}
}
