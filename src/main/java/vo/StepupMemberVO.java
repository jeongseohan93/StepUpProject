package vo;

import org.springframework.web.multipart.MultipartFile;

public class StepupMemberVO {
	private int stepup_idx;
	private String stepup_id, stepup_pwd, stepup_name, stepup_email, stepup_address, stepup_gender, stepup_birthday, stepup_nickname, stepup_phone,stepup_profile;
	private MultipartFile stepup_pic;

	public int getStepup_idx() {
		return stepup_idx;
	}

	public void setStepup_idx(int stepup_idx) {
		this.stepup_idx = stepup_idx;
	}

	public String getStepup_id() {
		return stepup_id;
	}

	public void setStepup_id(String stepup_id) {
		this.stepup_id = stepup_id;
	}

	public String getStepup_pwd() {
		return stepup_pwd;
	}

	public void setStepup_pwd(String stepup_pwd) {
		this.stepup_pwd = stepup_pwd;
	}

	public String getStepup_email() {
		return stepup_email;
	}

	public void setStepup_email(String stepup_email) {
		this.stepup_email = stepup_email;
	}

	public String getStepup_name() {
		return stepup_name;
	}

	public void setStepup_name(String stepup_name) {
		this.stepup_name = stepup_name;
	}

	public String getStepup_address() {
		return stepup_address;
	}

	public void setStepup_address(String stepup_address) {
		this.stepup_address = stepup_address;
	}

	public String getStepup_gender() {
		return stepup_gender;
	}

	public void setStepup_gender(String stepup_gender) {
		this.stepup_gender = stepup_gender;
	}

	public String getStepup_birthday() {
		return stepup_birthday;
	}

	public void setStepup_birthday(String stepup_birthday) {
		this.stepup_birthday = stepup_birthday;
	}

	public String getStepup_nickname() {
		return stepup_nickname;
	}

	public void setStepup_nickname(String stepup_nickname) {
		this.stepup_nickname = stepup_nickname;
	}

	public String getStepup_phone() {
		return stepup_phone;
	}

	public void setStepup_phone(String stepup_phone) {
		this.stepup_phone = stepup_phone;
	}

	public String getStepup_profile() {
		return stepup_profile;
	}

	public void setStepup_profile(String stepup_profile) {
		this.stepup_profile = stepup_profile;
	}

	public MultipartFile getStepup_pic() {
		return stepup_pic;
	}

	public void setStepup_pic(MultipartFile stepup_pic) {
		this.stepup_pic = stepup_pic;
	}
}
