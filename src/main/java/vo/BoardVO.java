package vo;

public class BoardVO {
	private int board_idx, board_readhit, board_del_info;
	private String board_name, board_subject, board_content, board_ip, board_regdate;
	
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	
	public int getBoard_readhit() {
		return board_readhit;
	}
	public void setBoard_readhit(int board_readhit) {
		this.board_readhit = board_readhit;
	}	
	public int getBoard_del_info() {
		return board_del_info;
	}
	public void setBoard_del_info(int board_del_info) {
		this.board_del_info = board_del_info;
	}
	public String getBoard_name() {
		return board_name;
	}
	public void setBoard_name(String board_name) {
		this.board_name = board_name;
	}
	public String getBoard_subject() {
		return board_subject;
	}
	public void setBoard_subject(String board_subject) {
		this.board_subject = board_subject;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getBoard_ip() {
		return board_ip;
	}
	public void setBoard_ip(String board_ip) {
		this.board_ip = board_ip;
	}
	public String getBoard_regdate() {
		return board_regdate;
	}
	public void setBoard_regdate(String board_regdate) {
		this.board_regdate = board_regdate;
	}
}
