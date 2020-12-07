package org.kzv.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import org.kzv.domain.BoardVO;
import org.kzv.mapper.BoardMapper;

@Service("boardServiceImpl")
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardMapper boardMapper;

	@Override
	public void write(BoardVO board) {
		boardMapper.insert(board);
	};
	
	@Override
	public BoardVO get(int board_idx) {
		return boardMapper.read(board_idx);
	};
	
	@Override
	public boolean update(String memo) {
		return boardMapper.update(memo) == 1;
	};
	
	@Override
	public boolean delete(int board_idx) {
		return boardMapper.delete(board_idx) == 1;
	};
	
	@Override
	public List<BoardVO> getList(Integer movieid){
		return boardMapper.getList(movieid);
	};

}
