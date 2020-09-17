<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<!DOCTYPE html>
<html>
	
<head>
<style>
div.container {
    width: 100%;
    border: 1px solid gray;
}

header, footer {
    padding: 1em;
    color: white;
    background-color: black;
    clear: left;
    text-align: center;
}

nav {
    float: left;
    max-width: 160px;
    margin: 0;
    padding: 1em;
}

nav ul {
    list-style-type: none;
    padding: 0;
}
   
nav ul a {
    text-decoration: none;
}

article {
    margin-left: 170px;
    border-left: 1px solid gray;
    padding: 1em;
    overflow: hidden;
}
</style>
<decorator:head></decorator:head>
</head>
<body>

<div class="container">

<header>
   <h1>텟,ㅌ,으ㅏㄴ트</h1>
</header>
  
<nav>
  <ul>
    <li><a href="../login/login.jsp">로그인</a></li>
    <li>홍길동님<a href="#">로그아웃</a>
    <li><a href="../emp/empSelectAll.jsp">사원</a></li>
    <li><a href="../dept/deptSelectAll.jsp">부서</a></li>
    <li><a href="../board/boardSelectAll.jsp">게시판</a></li>
  </ul>
</nav>

<article>
	<!-- 바디 영역 -->
	<decorator:body></decorator:body>
</article>

<footer>Copyright &copy; W3Schools.com</footer>

</div>

</body>
</html>
