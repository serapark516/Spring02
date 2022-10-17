package criTest;

import lombok.Data;

//VO class 끼리 상속받아 데이터 사용하면 됨
//ID와 name 을 같이 출력하고 싶은 경우
//member vo용 class 를 만들고 searchCritera에 extends 하면 searchCritera cri 로 불러 올 수 있음(?)


@Data
public class SearchCriteria extends Criteria{
	private String searchType;
	private String keyword;
	
} //class
