<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>membersQnaView.jsp</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<!-- <link href="bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet"> -->
<style>
    #container {
      width: 70%;
      margin: 0 auto;     /* 가로로 중앙에 배치 */
      padding-top: 10%;   /* 테두리와 내용 사이의 패딩 여백 */
    }
     
    #list {
      text-align: center;
    }
   
    #upde {
      text-align: right;
    }
     
    /* Bootstrap 수정 */
    .table > tbody > tr > th {
      background-color: #b3c6ff;
    }
    .table > tbody > tr > th {
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
	function qnaModifyGo() {
		location.href = "membersNoticeMG.do";
}
	
	function qnaDeleteGo() {
		location.href = "membersNoticeD.do";
}
	
	function qnaGo() {
		location.href = "membersQna.do";
}
	
	function qnaRe() {
		location.href = "membersQnaReG.do?num=${view.qna_no}&page=${pageNum}";
}
	
	$('#myModal').on('shown.bs.modal', function () {
		  $('#myInput').trigger('focus')
})

</script>
</head>
<body>


<br><br><br><br>
<div class="contatiner">
<form method="post" name="frm" id="frm" action="">

<div id="list">
<h3 class="page_title">QnA 글 보기</h3>
</div>

<hr>
<br><br>
<table class="table table-striped table-bordered table-hover">
<thead>
</thead>
  <tbody>
  <tr>
  	<th>번호</th>
  	<td>${view.qna_no}</td>
  </tr>
  
  <tr>
  	<th>날짜</th>
    <td>${view.qna_writedate}</td>
  </tr>
  
  <tr>
  	<th>문의유형</th>
  	<c:if test="${view.qna_category == 'm1'}">
  	<td>예약 관련 문의</td>
  	</c:if>
  	<c:if test="${view.qna_category == 'm2'}">
  	<td>사이트 관련 문의</td>
  	</c:if>
  	<c:if test="${view.qna_category == 'm3'}">
  	<td>이벤트 관련 문의</td>
  	</c:if>
  	<c:if test="${view.qna_category == 'm4'}">
  	<td>고객의 소리</td>
  	</c:if>
  	<c:if test="${view.qna_category == 'm5'}">
  	<td>답변</td>
  	</c:if>
  </tr>
  
  <tr>
  	<th>조회수</th>
    <td>${view.qna_hits}</td>
  </tr>
  
  <tr>
  	<th>작성자</th>
    <td>${view.qna_writer}</td>
  </tr>
  
  <tr>
  	<th>제목</th>
    <td>${view.qna_title}</td>
  </tr>
  
  <tr>
  	<th>내용</th>
    <td>${view.qna_contents}</td>
  </tr>
  
  </tbody>
</table>
 
</form>

<button type="button" class="btn btn-outline-primary" onclick="qnaGo()">목록으로</button>
<c:if test="${admin == '2'}">
	<button type="button" class="btn btn-outline-primary" onclick="qnaRe()">답변달기</button>
</c:if>
 
<c:if test="${sessionScope.loginid !=null}">
<c:if test="${sessionScope.loginid == view.qna_writer}">
<div id="upde">
<button type="button" class="btn btn-outline-primary" onclick="qnaModifyGo()">수정</button>
<button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#staticBackdrop">
삭제
</button>
</div>
</c:if>
</c:if>

<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">삭제 여부 확인</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        삭제하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" onclick="qnaDeleteGo()">삭제</button>
      </div>
    </div>
  </div>
</div>
<!-- Modal 끝 -->
 
 
 </div>
</body>
</html>