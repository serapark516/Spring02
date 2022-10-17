package service;

import java.util.List;

import criTest.SearchCriteria;
import vo.JoVO;

public interface JoService {
	// ** Criteria PageList
	// ver02
	List<JoVO> searchList(SearchCriteria cri);
	int searchCount(SearchCriteria cri);
	
	// ** selectList
	List<JoVO> selectList();
	
	// ** Insert
	int insert(JoVO vo);
	
	// ** Update
	int update(JoVO vo);

	// ** Delete
	int delete(JoVO vo);	
	
	// ** selectOne
	JoVO selectOne(JoVO vo);

}