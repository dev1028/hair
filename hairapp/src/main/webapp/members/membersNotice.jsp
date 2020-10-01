<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>membersNotice.jsp</title>
<link href="bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
  <style>
    #container {
      width: 70%;
      margin: 0 auto;     /* 가로로 중앙에 배치 */
      padding-top: 10%;   /* 테두리와 내용 사이의 패딩 여백 */
    }
     
    #list {
      text-align: center;
    }
   
    #write {
      text-align: right;
    }
     
    /* Bootstrap 수정 */
    .table > thead {
      background-color: #b3c6ff;
    }
    .table > thead > tr > th {
      text-align: center;
    }
    .table-hover > tbody > tr:hover {
      background-color: #e6ecff;
    }
    .table > tbody > tr > td {
      text-align: center;
    }
    .table > tbody > tr > #title {
      text-align: left;
    }
     
    #paging {
      text-align: center;
    }
     
    .hit {
      animation-name: blink;
      animation-duration: 1.5s;
      animation-timing-function: ease;
      animation-iteration-count: infinite;
      /* 위 속성들을 한 줄로 표기하기 */
      /* -webkit-animation: blink 1.5s ease infinite; */
    }
     
    /* 애니메이션 지점 설정하기 */
    /* 익스플로러 10 이상, 최신 모던 브라우저에서 지원 */
    @keyframes blink {
      from {color: white;}
      30% {color: yellow;}
      to {color: red; font-weight: bold;}
      /* 0% {color:white;}
      30% {color: yellow;}
      100% {color:red; font-weight: bold;} */
    }
  </style>


<script>
	function noticeWriteGo() {
		location.href = "membersNoticeWG.do";
}
</script>
</head>
<body>


<br><br><br><br>
<div class="contatiner">
<form method="post" name="frm2" id="frm2" action="membersNoticeV.do">

<div id="list">
<h3 class="page_title">공지사항</h3>
</div>

<hr>
<br><br>
<table class="table table-striped table-bordered table-hover">
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
  <!--여기보면 반복문으로 input 이 반복되니까 values() 하는거. 불편하다 commit해줘 고쳐줄게 넹-->
  <c:forEach items="${write}" var="board">
<%--   <input type="hidden" name="noticeNo" value="${board.notice_no}"> --%>
<%--   <input type="hidden" name="noticeHit" value="${board.notice_hits}"> --%>
  <tr>
  	<td>${board.notice_no}</td>
  	<td><a href="membersNoticeV.do?notice_no=${board.notice_no}&notice_hit=${board.notice_hits}">${board.notice_title}</a></td>
  	<td>관리자</td>
  	<td>${board.notice_writedate}</td>
  	<td>${board.notice_hits}</td>
  <tr>
  </c:forEach>
  </tbody>
</table>

 <hr/>
 <div id="write">
 <a class="btn btn-default pull-right" onclick="noticeWriteGo()">글쓰기</a>
 </div>
 
 </form>
 
 <!-- 페이징 -->
 <form method="post" name="frm" id="frm">
 <input type="hidden" name="p" value="1">	<!-- value에는 페이지번호 적었음 -->
  <div id="paging">
 <my:paging paging="${paging}" jsfunc="gopage" />
 </div>
 </form>
 <!-- 페이징끝 -->
 
 </div>
 
<script>
	function gopage(p) {
		frm.p.value = p;		// 페이지번호 받아와서 submit에 넘김
		frm.submit();
		
	}
</script>
</body>
</html>