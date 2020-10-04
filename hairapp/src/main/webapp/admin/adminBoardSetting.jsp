<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>board list</h2>



	<table border="1">

		<thead>
			<tr>
				<th>분류</th>
				<th>page</th>
				<th>id</th>
				<th>권한(쓰기/읽기)</th>
				<th>새글/총개수</th>
				<th>게시물관리</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list }" var = "i">
			<tr>
				<td>${ i.type}</td>
				<c:if >
				<td>${i.who }</td>
				</c:if>
				<td>${i.id }</td>
				<td>${ i.readable}/${i.writtable}</td>
				<td>${i.nevv }/${i.total }</td>
				<td><button>글보기</button>
					<button>글삭제</button>
					<button>고정</button></td>
			</tr>
		</c:forEach>
			<%-- <tr>
				<td>공지사항</td>
				<td>hairshop</td>
				<td>admin/hairshop</td>
				<td>${new }/${total }</td>
				<td><button>글보기</button>
					<button>글삭제</button>
					<button>고정</button></td>
			</tr>
			<tr>
				<td>공지사항</td>
				<td>designer</td>
				<td>admin/designer</td>
				<td>${new }/${total }</td>
				<td><button>글보기</button>
					<button>글삭제</button>
					<button>고정</button></td>
			</tr>
			<tr>
				<td>공지사항</td>
				<td>admin</td>
				<td>root/admin</td>
				<td>${new }/${total }</td>
				<td><button>글보기</button>
					<button>글삭제</button>
					<button>고정</button></td>
			</tr>
			<tr>
				<td>qna</td>
				<td>customer</td>
				<td>member/member</td>
				<td>${new }/${total }</td>
				<td><button>글보기</button>
					<button>글삭제</button>
					<button>고정</button></td>
			</tr>
			<tr>
				<td>qna</td>
				<td>hairshop</td>
				<td>hairshop/hairshop</td>
				<td>${new }/${total }</td>
				<td><button>글보기</button>
					<button>글삭제</button>
					<button>고정</button></td>
			</tr>
			<tr>
				<td>qna</td>
				<td>designer</td>
				<td>designer/designer</td>
				<td>${new }/${total }</td>
				<td><button>글보기</button>
					<button>글삭제</button>
					<button>고정</button></td>
			</tr>
			<tr>
				<td>qna</td>
				<td>admin</td>
				<td>비회원/비회원</td>
				<td>${new }/${total }</td>
				<td><button>글보기</button>
					<button>글삭제</button>
					<button>고정</button></td>
			</tr> --%>
			<tr>
				<td>이용안내FAQ</td>
				<td>hairshop</td>
				<td>admin/hairshop</td>
				<%-- <td>${new }/${total }</td> --%>
				<td><button>글보기</button>
					<button>글삭제</button>
					<button>고정</button></td>
			</tr>
		</tbody>

	</table>
</body>
</html>