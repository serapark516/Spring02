<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** Jo List Spring_MVC2 **</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
		<script >
	$(function(){
		// 1) SearchType 이 '전체' 면 keyword 클리어
		$('#searchType').change(function(){
			if($(this).val()=='n') $('#keyword').val('');
		}); // change
		// 2) 검색 후 요청
		$('#searchBtn').click(function(){
			self.location = "jcrilist"
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
<h2>** Jo List Spring_MVC2 **</h2>
<br>
<c:if test="${not empty message}">
	${message}<br>
</c:if>
<hr>
<div id="searchBar">
	<select name="searchType" id="searchType">
		<option value="n" ${pageMaker.cri.searchType == null ? 'selected' : '' }>전체</option>
		<option value="j"  ${pageMaker.cri.searchType == j ? 'selected' : '' }>Jno</option>
		<option value="c"  ${pageMaker.cri.searchType == c ? 'selected' : '' }>Chief</option>
		<option value="jn"  ${pageMaker.cri.searchType == jn ? 'selected' : '' }>Jname</option>
		<option value="no"  ${pageMaker.cri.searchType == no ? 'selected' : '' }>Note</option>
 	</select> 
 	<input type="text" name="keyword" id="keyword" value="${pageMaker.cri.keyword}">
	<button id="searchBtn">Search</button>
</div>

<table width=100%> 
	<tr bgcolor="Gold" height="30">
		<th>Jno</th><th>Chief</th><th>C_Name</th><th>Jname</th><th>Note</th>
	</tr>
	<c:if test="${not empty banana}">
		<c:forEach  var="jo" items="${banana}" >
		<tr height="30">
			<td>
				<c:if test="${loginID=='admin'}">
					<a href="jdetail?jno=${jo.jno}">${jo.jno}</a>
				</c:if>
				<c:if test="${loginID!='admin'}">
					${jo.jno}
				</c:if>
			</td>
			<td>
				<c:if test="${loginID=='admin'}">
					<a href="mdetail?id=${jo.chief}">${jo.chief}</a>
				</c:if>
				<c:if test="${loginID!='admin'}">
					${jo.chief}
				</c:if>
			</td>
			<td>${jo.name}</td>
			<td>${jo.jname}</td>
			<td>${jo.note}</td>
		</tr>	
		</c:forEach>
	</c:if>
</table>
<!-- Cri_Page -->
<div align="center">
	<!-- First, Prev -->
	<c:choose>
		<c:when test="${pageMaker.prev && pageMaker.spageNo>1}">
			<a href="jcrilist${pageMaker.searchQuery(1)}">FP</a>&nbsp;     
			<a href="jcrilist${pageMaker.searchQuery(pageMaker.spageNo-1)}">&lt;</a>&nbsp;&nbsp;  
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
			<a href="jcrilist${pageMaker.searchQuery(i)}">${i}</a>&nbsp;
			
		</c:if>
	
	</c:forEach>


<!-- Next, Last -->
	<c:choose>
		<c:when test="${pageMaker.next && pageMaker.epageNo>0}">
			<a href="jcrilist${pageMaker.searchQuery(pageMaker.epageNo+1)}">&nbsp;&gt;</a>     
			<a href="jcrilist${pageMaker.searchQuery(pageMaker.lastPageNo)}">&nbsp;LP</a> 
		</c:when>
		<c:otherwise>
			<font color="Gray">&nbsp;&gt;&nbsp;LP</font>   
		</c:otherwise>
	</c:choose>	
</div>
<hr>
<c:if test="${not empty loginID}">
&nbsp;&nbsp;<a href="jinsertf">조등록</a>
</c:if>
&nbsp;&nbsp;<a href="javascript:history.go(-1)">이전으로</a>
&nbsp;&nbsp;<a href="home">[Home]</a>
</body>
</html>