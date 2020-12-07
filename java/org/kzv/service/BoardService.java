package org.kzv.service;

import java.util.List;
import java.util.Map;

import org.kzv.domain.BoardVO;

public interface BoardService {

	void write(BoardVO board);
	
	BoardVO get(int board_idx);
	
	boolean update(String memo);
	
	boolean delete(int board_idx);
	
	List<BoardVO> getList(Integer movieid);
}/////////////////////////////////////





