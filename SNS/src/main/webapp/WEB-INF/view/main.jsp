<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WeSee</title>
<style>
body {
	width: 1024px;
	height: 860px;
	margin: 10px auto;
	overflow: auto;
	max-height: 860px;
}

h1 {
	text-align: center;
	text-decoration-line: none;
	color: black;
	font-size: 50px;
	border-bottom: 5px solid;
	padding-bottom: 30px;
}

a {
	text-decoration-line: none;
	color: black;
	font-size: 50px;
}

table {
	border: 1px solid;
}

table>tr>th {
	border: 1px solid;
}

.scroll::-webkit-scrollbar {
	display: none;
}

.test {
	width: 900px;
	height: 1000px;
	border: 1px solid;
}
</style>
</head>
<body class="scroll">

	<h1>
		<a href="/WeSee/">WeSee</a>
	</h1>

	<div>
		<button style="border: none; background-color: white;">
			<img src="Resource/Bell.png">
		</button>
		<button style="border: none; background-color: white;">
			<img src="Resource/Search.png">
		</button>

		<!-- write로 -->
		<a href=<c:url value="/add.do"/>>
			<button style="border: none; background-color: white;">
				<img src="Resource/Pencil.png">
			</button>
		</a>

		<!-- sendMessage로 -->
		<a href=<c:url value="/message.do"/>>
			<button style="border: none; background-color: white;">
				<img src="Resource/Message.png">
			</button>
			
		<!-- mypage로 -->
		</a> <a href=<c:url value="/member/mypage.do"/>>
			<button style="border: none; background-color: white;">
				<img src="Resource/Person.png">
			</button>
		</a>
	</div>

	<p>Welcome, ${userId}!</p>
	<c:if test="${empty boardList}">
		<p class="no-data">데이터가 없습니다.</p>
	</c:if>

	<c:if test="${not empty boardList}">

		<c:forEach var="board" items="${boardList}">
			<div
				style="display: flex; justify-content: space-evenly; margin-top: 30px;">
				<table style="width: 400px; height: 650px; background-color: black;">
					<tr style="width: 400px; height: 20px;">
						<th style="display: flex; color: white;">
							<div>
								<label>${board.id}</label>
							</div>
							<div style="margin-left: 170px;">
								<label>${board.date}</label>
							</div>
						</th>
						<!-- 글쓴 시간이 빠를수록 위쪽으로 배치  -->
					</tr>
					<tr>
						<th style="background-color: white; height: 450px;"><div
								class="scroll" style="max-height: 450px; overflow: auto;">${board.contents}</div></th>
					</tr>
					<tr>
						<th style="display: flex; height: 28px; background-color: white;">
							<div>
								<button style="border: 0px; background-color: white;">
									<img src="Resource/Good.png">
								</button>
							</div>
							<div>좋아요</div>
							<div>${board.like}</div> <!-- 자동숫자올라감. 1000이 넘어가면1.0k로 변경 소수점 둘째짜리 삭제 가능?-->
							<div style="margin-left: 150px;">
								<label>조회수</label>
							</div>
							<div style="margin-left: 20px;">${board.hits}</div> <!--  자동숫자올라감.1000이 넘어가면 1.0k로 변경..소수점 둘째짜리 삭제 가능?? -->
						</th>
					</tr>
					<tr class='scroll'
						style="background-color: white; height: 90px; overflow: auto;">
						<td style="display: flex;">
							<div style="position: relative;">mango456</div>
							<div class='scroll'
								style="position: relative; margin-left: 5px; max-width: 190px; max-height: 21px; overflow: auto;">나는
								망고입니다ffaddgdfsgsffas..</div> <!--DB 게시물의 댓글중 빨리적은 순서대로  -->
							<div style="position: relative; margin-left: 10px;">02.02.01
								15:30</div> <!-- nowdate(date)  -->
						</td>
						<td style="display: flex;">
							<div style="position: relative;">Durumi</div>
							<div class='scroll'
								style="position: relative; margin-left: 5px; max-width: 190px; max-height: 21px; overflow: auto;">나는두루미입니다.fas..</div>
							<!--DB 게시물의 댓글중 빨리적은 순서대로  -->
							<div style="position: relative; margin-left: 10px;">02.02.01
								15:30</div> <!-- nowdate(date)  -->
						</td>
						<td style="display: flex;">
							<div style="position: relative;">mango456</div>
							<div class='scroll'
								style="position: relative; margin-left: 5px; max-width: 190px; max-height: 21px; overflow: auto;">나는
								망고입니다ffaddgdfsgsffas..</div> <!--DB 게시물의 댓글중 빨리적은 순서대로  -->
							<div style="position: relative; margin-left: 10px;">02.02.01
								15:30</div> <!-- nowdate(date)  -->
						</td>
						<td style="display: flex;">
							<div style="position: relative;">mango456</div>
							<div class='scroll'
								style="position: relative; margin-left: 5px; max-width: 190px; max-height: 21px; overflow: auto;">나는
								망고입니다ffaddgdfsgsffas..</div> <!--DB 게시물의 댓글중 빨리적은 순서대로  -->
							<div style="position: relative; margin-left: 10px;">02.02.01
								15:30</div> <!-- nowdate(date)  -->
						</td>
						<td style="display: flex;">
							<div style="position: relative;">mango456</div>
							<div class='scroll'
								style="position: relative; margin-left: 5px; max-width: 190px; max-height: 21px; overflow: auto;">나는
								망고입니다ffaddgdfsgsffas..</div> <!--DB 게시물의 댓글중 빨리적은 순서대로  -->
							<div style="position: relative; margin-left: 10px;">02.02.01
								15:30</div> <!-- nowdate(date)  -->
						</td>



					</tr>

					<tr style="background-color: white;">
						<th>
							<div>
								<textarea class='scroll' placeholder="댓글을 입력하세요."
									style="border: none; resize: none; width: 380px; outline: none;"></textarea>
							</div>
						</th>
					</tr>

					</c:forEach>







					<%-- 		<tr>
					<td>${board.number}</td>
					<td>${board.id}</td>
				 	<td>${board.contents}</td> 
					<td>${board.date}</td>
					<td>${board.hits}</td>
					<td>${board.like}</td>
				</tr> --%>

				</table>
	</c:if>
	<br />
	<br />
	<br />
	<br />
	<br />

</body>
</html>