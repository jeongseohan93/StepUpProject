package vo;

import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public class PicVO {
	private int pic_idx, academy_idx;
	private String pic_name;
	private List<MultipartFile> pic_file;

	public int getPic_idx() {
		return pic_idx;
	}

	public void setPic_idx(int pic_idx) {
		this.pic_idx = pic_idx;
	}

	public int getAcademy_idx() {
		return academy_idx;
	}

	public void setAcademy_idx(int academy_idx) {
		this.academy_idx = academy_idx;
	}

	public String getPic_name() {
		return pic_name;
	}

	public void setPic_name(String pic_name) {
		this.pic_name = pic_name;
	}

	public List<MultipartFile> getPic_file() {
		return pic_file;
	}

	public void setPic_file(List<MultipartFile> pic_file) {
		this.pic_file = pic_file;
	}
}
