package vo;
public class ResumeVO {
	private int academy_idx, instructor_idx, resume_idx;
	private String academy_name,self_introduction,instructor_name, instructor_email,
				instructor_address, instructor_gender,instructor_category,instructor_phone,approval_status;
	
	private String created_at,updated_at; //이력서 전송시간,승인 및 거절시간.
	
	
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
	public int getAcademy_idx() {
		return academy_idx;
	}
	public void setAcademy_idx(int academy_idx) {
		this.academy_idx = academy_idx;
	}
	public int getInstructor_idx() {
		return instructor_idx;
	}
	public void setInstructor_idx(int instructor_idx) {
		this.instructor_idx = instructor_idx;
	}
	public int getResume_idx() {
		return resume_idx;
	}
	public void setResume_idx(int resume_idx) {
		this.resume_idx = resume_idx;
	}
	public String getAcademy_name() {
		return academy_name;
	}
	public void setAcademy_name(String academy_name) {
		this.academy_name = academy_name;
	}
	public String getSelf_introduction() {
		return self_introduction;
	}
	public void setSelf_introduction(String self_introduction) {
		this.self_introduction = self_introduction;
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
	public String getInstructor_category() {
		return instructor_category;
	}
	public void setInstructor_category(String instructor_category) {
		this.instructor_category = instructor_category;
	}
	public String getInstructor_phone() {
		return instructor_phone;
	}
	public void setInstructor_phone(String instructor_phone) {
		this.instructor_phone = instructor_phone;
	}
	public String getApproval_status() {
		return approval_status;
	}
	public void setApproval_status(String approval_status) {
		this.approval_status = approval_status;
	}



}