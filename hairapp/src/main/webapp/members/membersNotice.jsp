<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>membersNotice.jsp</title>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script>
	function noticeWriteGo() {
		location.href = "membersNoticeWG.do";
}
</script>
</head>
<body>
<div class="contatiner">
<h3 class="page_title">공지사항</h3>
<table class="table table-hover">
<thead>
  <tr>
    <th>번호</th>
    <th>제목</th>
    <th>작성자</th>
    <th>날짜</th>
    <th>조회수</th>
  </tr>
</thead>
  <tbody>
  <c:forEach items="${list}" var="board">
  <tr>
  	<td>${board.no}</td>
  	<td>${board.poster}</td>
  	<td><a href="#">${board.subject}</a></td>
  	<td>${board.lastpost}</td>
  	<td>${board.views}</td>
  </c:forEach>
  </tbody>
</table>

 <hr/>
 <a class="btn btn-default pull-right" onclick="noticeWriteGo()">글쓰기</a>
 <div class="text-center">
 	<ul class="pagination">
 		<li><a href="#">1</a></li>
 		<li><a href="#">2</a></li>
 		<li><a href="#">3</a></li>
 		<li><a href="#">4</a></li>
 		<li><a href="#">5</a></li>
 	</ul>
 </div>
 </div>
</body>
</html>