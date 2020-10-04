<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.share-button { 
  margin: auto;
  position: absolute; 
  top: 0; 
  left: 0;
  bottom: 0;
  right: 0;
  width:6em;
  height:2em;
  line-height:2em;
 }

.social-toggle {
  display:block;
  font-weight:bold;
  font-size:90%;
  text-align:center;
  text-transform:uppercase;
  transition:all 0.25s;
  color:rgb(200,200,200);
  background:rgba(200,200,200,.05);
  border: 2px solid rgb(200,200,200);
}

.social-toggle:hover {
  background:rgb(200,200,200);
  color:#333;
}

.no-js .social-toggle, .no-js .social-toggle:hover {
  cursor: default;
  border:none;
  background:transparent;
  color:rgb(200,200,200);
  pointer-events:none;
}
</style>
</head>
<body>
<div class="share-button">
  <a href="#" class="social-toggle">더보기</a>
 </div>
</body>
</html>