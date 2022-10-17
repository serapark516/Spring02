<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>** Member Cri_PageList Spring_MVC2 **</title>
	<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<script >
	// ** JS 에서 함수사용
	// => 최상위 객체 window 는 생략가능
	//    window.doument.write("....");
	// => jQuery 호출
	//    - window.jQuery('선택자_id, class, Tag..').click(function(){......})
	//    - 늘 사용해야되는 jQuery 대신 $ 기호를 사용
	// => ready 이벤트
	//    - script 구문이 body 보다 위쪽에 위치하면 Tag 인식이 불가능
	//    - Body 가 Tag 들을 모두 load 한 후 실행 되도록 ready이벤트를 적용
	//    - Js : window.onload
	//    - JQuery : ready -> $(doument).ready(function(){.....}); 매개변수로 익명함수 사용
	//                     -> 이때 (doument).ready 는 생략가능 -> $(function(){ 이렇게 사용
	
	//    
	$(function(){
		// 1) SearchType 이 '전체' 면 keyword 클리어
		$('#searchType').change(function(){
			if($(this).val()=='n') $('#keyword').val('');
		}); // change
		// 2) 검색 후 요청
		// => 검색 조건 입력 후 첫 page 요청
		//    이때는 서버에 searchType, keyword 가 전달되기 이전이므로 makeQuery 메서드 사용
		// => self.location="bcrilist?currPage=?????" : 해당 요청을 서버로 전달
		$('#searchBtn').click(function(){
			self.location = "mcrilist"
			+"${pageMaker.makeQuery(1)}"
			+"&searchType="
			+$('#searchType').val()
			+"&keyword="
			+$('#keyword').val()
		}); //click
	}) //ready
	
	</script>
</head>
<body>
<h2>** Member Cri_PageList Spring_MVC2 **</h2>
<br>
<c:if test="${not empty message}">
	${message}<br>
</c:if>
<hr>
<div id="searchBar">
	<select name="searchType" id="searchType">
		<option value="n" ${pageMaker.cri.searchType == null ? 'selected' : '' }>전체</option>
		<option value="i"  ${pageMaker.cri.searchType == i ? 'selected' : '' }>ID</option>
		<option value="a"  ${pageMaker.cri.searchType == a ? 'selected' : '' }>Name</option>
		<option value="f"  ${pageMaker.cri.searchType == f ? 'selected' : '' }>Info</option>
		<option value="j"  ${pageMaker.cri.searchType == j ? 'selected' : '' }>Jno</option>
		<option value="b"  ${pageMaker.cri.searchType == b ? 'selected' : '' }>Birthday</option>
		<option value="in"  ${pageMaker.cri.searchType == in ? 'selected' : '' }>ID or Name</option>
 	</select> 
 	<input type="text" name="keyword" id="keyword" value="${pageMaker.cri.keyword}">
	<button id="searchBtn">Search</button>


</div>
<br><hr>
<table width=100%> 
	<tr bgcolor="Gold" height="30">
		<th>I D</th><th>Password</th><th>Name</th><th>Info</th><th>Birthday</th><th>Jno</th><th>Age</th><th>Point</th>
	</tr>
	<c:if test="${not empty banana}">
		<c:forEach  var="member" items="${banana}" >
			<tr height="30">
				<td>
				<c:if test="${loginID=='admin'}">
					<a href="mdetail?id=${member.id}">${member.id}</a>
				</c:if> 
				<c:if test="${loginID!='admin'}">
				    ${member.id}
				</c:if>      
				</td>
				<td>${member.password}</td><td>${member.name}</td>
				<td>${member.info}</td><td>${member.birthday}</td>
				<td>${member.jno}</td><td>${member.age}</td><td>${member.point}</td>
			</tr>	
		</c:forEach>
	</c:if>
</table>
<hr>
<!-- Cri_Page -->
<div align="center">
	<!-- First, Prev -->
	<c:choose>
		<c:when test="${pageMaker.prev && pageMaker.spageNo>1}">
			<!-- New_ver01_Cri : pageMaker.makeQuery(1) -->
			<!-- New_ver02_SearchCri : pageMaker.searchQuery(1) -->
			<a href="mcrilist${pageMaker.searchQuery(1)}">FP</a>&nbsp;     
			<a href="mcrilist${pageMaker.searchQuery(pageMaker.spageNo-1)}">&lt;</a>&nbsp;&nbsp;  
			<!-- OLD_version 
			<a href="bcrilist?currPage=1&rowsPerPage=5">FP</a>&nbsp; 
			<a href="bcrilist${pageMaker.spageNo-1}&rowsPerPage=5">&lt;</a>&nbsp; 
			-->
		</c:when>
		<c:otherwise>
			<font color="Gray">FP&nbsp;&lt;&nbsp;&nbsp;</font>   
		</c:otherwise>
	</c:choose>	

<!-- Display PageNo -->
	<c:forEach var="i" begin="${pageMaker.spageNo}" end="${pageMaker.epageNo}">
		<c:if test="${i == pageMaker.cri.currPage}">
			<font size="5" color="orange">${i}</font>&nbsp;
		</c:if>
		<c:if test="${i != pageMaker.cri.currPage}">
			<!-- New_ver01_Cri -->
			<a href="mcrilist${pageMaker.searchQuery(i)}">${i}</a>&nbsp;
			
			<!-- OLD_version 
			<a href="bcrilist?currPage=${i}&rowsPerPage=5">${i}</a>&nbsp; -->
			
		</c:if>
	
	</c:forEach>


<!-- Next, Last -->
	<c:choose>
		<c:when test="${pageMaker.next && pageMaker.epageNo>0}">
			<!-- New_ver01_Cri -->
			<a href="mcrilist${pageMaker.searchQuery(pageMaker.epageNo+1)}">&nbsp;&gt;</a>     
			<a href="mcrilist${pageMaker.searchQuery(pageMaker.lastPageNo)}">&nbsp;LP</a> 
			 <!-- OLD_version
			<a href="bcrilist?currPage=${pageMaker.epageNo+1}&rowsPerPage=5">&nbsp;&nbsp;&gt;</a>&nbsp;     
			<a href="bcrilist?currPage=${pageMaker.lastPageNo}&rowsPerPage=5">&nbsp;LP</a>&nbsp;&nbsp;  
			-->
		</c:when>
		<c:otherwise>
			<font color="Gray">&nbsp;&gt;&nbsp;LP</font>   
		</c:otherwise>
	</c:choose>	
</div>

<hr>
&nbsp;&nbsp;<a href="javascript:history.go(-1)">이전으로</a>
&nbsp;&nbsp;<a href="home">[Home]</a>
</body>
</html>