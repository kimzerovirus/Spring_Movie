package org.kzv.mapper;

import java.util.List;
import java.util.Map;

import org.kzv.domain.BoardVO;

public interface BoardMapper {
	int insertSelectKey(BoardVO board);
	void insert(BoardVO board);
	BoardVO read(int board_idx);
	int update(String memo);
	int delete(int board_idx);
	List<BoardVO> getList(int movieid);
}
