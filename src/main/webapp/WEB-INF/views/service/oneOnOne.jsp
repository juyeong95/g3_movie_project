<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="../default/header.jsp" />
	<h1 align="center"><a href="${contextPath }/service/qnaBoard">Q & A 게시판</a></h1><br>
	<h1 align="center"><a href="${contextPath }/service/oneOnOneQna">1 : 1 문 의</a></h1>
	<c:import url="../default/footer.jsp" />
</body>
</html>