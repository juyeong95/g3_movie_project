<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/1bd9eb3151.js"
	crossorigin="anonymous"></script>
<style type="text/css">
a {
	text-decoration-line: none;
}


h1{
		font-size: 20px;
}
table{
	border-spacing: 70px;
	margin: auto;
	padding: auto;
}


</style>
<script type="text/javascript">
	function login() {
		pn = $
		{
			loginUser
		}
		return pn
	}
</script>

</head>
<body>
	<c:import url="../default/header.jsp" />
	<br>
	<table>
	<tr>
	<td><a href="${contextPath }/myInfo/information">
		<div class="memberInfo">
			<h1 align="center">
				<i class="far fa-user fa-5x"></i><br> 회 원 정 보
			</h1>
		</div>
	</a></td>
	<td><a href="${contextPath }/myInfo/bookInfo?pn=${loginUser}"> <!-- pn으로 세션값 넘김 -->
		<div class="bookInfo">
			<h1 align="center" >
				<i class="fas fa-ticket-alt fa-5x"></i><br> 나 의 예 매
			</h1>
		</div>
	</a></td>
	<td><a href="${contextPath }/myInfo/myQna">
		<div class="myOneOnOne">
			<h1 align="center">
				<i class="far fa-question-circle fa-5x"></i><br> 나 의 문 의
			</h1>
		</div>
	</a></td>
	</tr>
	</table>
	
	
	
	<c:import url="../default/footer.jsp" />
</body>
</html>