package org.kzv.domain;

import lombok.Data;

@Data
public class BoardVO {
	private int board_idx; //댓글 번호
	private int movieid; //영화 번호
	private String userid;
	private String memo;
	private java.sql.Date reg_date;
}