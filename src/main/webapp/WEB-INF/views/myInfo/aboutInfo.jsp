<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#table {
	margin: auto;
	width: 100%;
	border-top-style: solid;
	border-collapse: collapse;
}

a {
	text-decoration: none;
	color: black;
}

td, th {
	padding: 10px;
	border-bottom: 1px solid #444444;
}

td {
	text-align: center;
}

th {
	background-color: white;
	padding: 15px;
}

thead tr {
	background-color: #0d47a1;
	color: #ffffff;
}

tbody tr:nth-child(2n) {
	background-color: rgb(233, 233, 233);
}

tbody tr:nth-child(2n+1) {
	background-color: white;
}

#num {
	padding: 10px 100px;
	margin-left: 360px;
}

.tt {
	width: 270px;
}
</style>
</head>
<body>
	<c:import url="../default/header.jsp" />
	<div class = modifyForm align="center">
	<h1 align="center">${loginUser }님의 정보</h1>
	<form action="${contextPath }/myInfo/memberInfo" name="memberInfo" method="get" onsubmit="return CheckPassword()">
		<table border="1">
			<tr><th>아이디</th>
			<td><input type="text" name="id" value="${loginUser }" readonly /></td></tr>
			<tr><th>이	름</th>
			<td><input type="text" name="name" value="${List.name }" readonly /></td></tr>
			<tr><th>연락처</th>
			<td><input type="text" name="phoneNumber" value="${List.phonenumber }" readonly/></td></tr>
			<tr><th>이메일</th>
			<td><input type="text" name="email" value="${List.email }" readonly/></td></tr>
		</table>
		<br>
			<input type="submit" value="정보변경" onclick="${contextPath}/memberInfo"/>
			<input type="button" value="뒤 로" onclick="history.back()"/>
	</form>
	</div>
	<c:import url="../default/footer.jsp" />
</body>
</html>