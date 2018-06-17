package com.nuritelecom.persistence;

import java.util.List;

import com.nuritelecom.domain.BoardVO;
import com.nuritelecom.domain.Criteria;

public interface BoardDAO {

	public void create(BoardVO vo) throws Exception;

	public BoardVO read(Integer bno) throws Exception;

	public void update(BoardVO vo) throws Exception;

	public void delete(Integer bno) throws Exception;

	public List<BoardVO> listAll() throws Exception;

	public List<BoardVO> listCriteria(Criteria cri) throws Exception;

	public Integer getTotal() throws Exception;

}
