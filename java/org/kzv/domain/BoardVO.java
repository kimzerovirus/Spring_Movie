package org.kzv.domain;

import lombok.Data;

@Data
public class BoardVO {
	private int board_idx; //��� ��ȣ
	private int movieid; //��ȭ ��ȣ
	private String userid;
	private String memo;
	private java.sql.Date reg_date;
}