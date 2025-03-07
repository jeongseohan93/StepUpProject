package vo;

public class LectureVO {
		private int lecture_idx, academy_idx;
		private String lecture_name,  lecture_category, lecture_sub, lecture_price, lecture_time, lecture_start_time, 
		lecture_end_time, lecture_content, lecture_profile, instructor_name, lecture_weak;

	public int getAcademy_idx() {
		return academy_idx;
	}

	public void setAcademy_idx(int academy_idx) {
		this.academy_idx = academy_idx;
	}

	public String getInstructor_name() {
		return instructor_name;
	}

	public void setInstructor_name(String instructor_name) {
		this.instructor_name = instructor_name;
	}

	public String getLecture_weak() {
		return lecture_weak;
	}

	public void setLecture_weak(String lecture_weak) {
		this.lecture_weak = lecture_weak;
	}

	public String getLecture_profile() {
			return lecture_profile;
		}
		public void setLecture_profile(String lecture_profile) {
			this.lecture_profile = lecture_profile;
		}
		public int getLecture_idx() {
			return lecture_idx;
		}
		public void setLecture_idx(int lecture_idx) {
			this.lecture_idx = lecture_idx;
		}
		public String getLecture_name() {
			return lecture_name;
		}
		public void setLecture_name(String lecture_name) {
			this.lecture_name = lecture_name;
		}
		public String getLecture_category() {
			return lecture_category;
		}
		public void setLecture_category(String lecture_category) {
			this.lecture_category = lecture_category;
		}
		public String getLecture_sub() {
			return lecture_sub;
		}
		public void setLecture_sub(String lecture_sub) {
			this.lecture_sub = lecture_sub;
		}
		public String getLecture_price() {
			return lecture_price;
		}
		public void setLecture_price(String lecture_price) {
			this.lecture_price = lecture_price;
		}
		public String getLecture_time() {
			return lecture_time;
		}
		public void setLecture_time(String lecture_time) {
			this.lecture_time = lecture_time;
		}
		public String getLecture_start_time() {
			return lecture_start_time;
		}
		public void setLecture_start_time(String lecture_start_time) {
			this.lecture_start_time = lecture_start_time;
		}
		public String getLecture_end_time() {
			return lecture_end_time;
		}
		public void setLecture_end_time(String lecture_end_time) {
			this.lecture_end_time = lecture_end_time;
		}
		public String getLecture_content() {
			return lecture_content;
		}
		public void setLecture_content(String lecture_content) {
			this.lecture_content = lecture_content;
		}
		
		
		
}