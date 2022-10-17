package vo;

import lombok.Data;

//** VO 작성
//=> private 변수 : Table의 컬럼명과 동일
//=> setter , getter , toString()


// VO class 끼리 상속받아 데이터 사용하면 됨
// ID와 name 을 같이 출력하고 싶은 경우
// memberVO 를 extends


@Data
public class BoardVO {
	private int seq;
	private String id;
	private String title;
	private String content;
	private String regdate;
	private int cnt;
	private int root;
	private int step;
	private int indent;
	
} //class
