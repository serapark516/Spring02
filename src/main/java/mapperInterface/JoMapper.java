package mapperInterface;

import java.util.List;

import criTest.Criteria;
import criTest.SearchCriteria;
import vo.BoardVO;
import vo.JoVO;
import vo.MemberVO;

public interface JoMapper {

	// ** selectList
	List<JoVO> selectList();
	
	// ** Criteria PageList
	// ver02
	List<JoVO> searchList(SearchCriteria cri);
	int searchCount(SearchCriteria cri);
	
	
	// ** Insert
	int insert(JoVO vo);

	// ** Update
	int update(JoVO vo);

	// ** Delete
	int delete(JoVO vo);	
	
	// ** selectOne
	JoVO selectOne(JoVO vo);

} //interface
