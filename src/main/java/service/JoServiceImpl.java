package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import criTest.SearchCriteria;
import mapperInterface.JoMapper;
import vo.BoardVO;
import vo.JoVO;
import vo.MemberVO;

//** interface 자동완성 
//=> Alt + Shift + T  
//=> 또는 마우스우클릭 PopUp Menu 의  Refactor - Extract Interface...

@Service
public class JoServiceImpl implements JoService {
	
	@Autowired
	JoMapper mapper;

	@Override
	// ** selectList
	public List<JoVO> selectList(){
		return mapper.selectList();
	}
	
	// ** Criteria PageList
	// ver02
	@Override
	public List<JoVO> searchList(SearchCriteria cri){
		return mapper.searchList(cri);
	}
	@Override
	public int searchCount(SearchCriteria cri){
		return mapper.searchCount(cri);
	}

	@Override
	// ** Insert
	public int insert(JoVO vo) {
		return mapper.insert(vo);
	}
	
	// ** selectOne
	@Override
	public JoVO selectOne(JoVO vo) {
		return mapper.selectOne(vo);
	}

	// ** Update
	@Override
	public int update(JoVO vo) {
		return mapper.update(vo);
	}
	// ** Delete
	@Override
	public int delete(JoVO vo) {
		return mapper.delete(vo);
	}

} //class
