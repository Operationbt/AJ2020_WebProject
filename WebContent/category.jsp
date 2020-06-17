<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<a href="${pageContext.request.contextPath}/project/ListViewAction?cat=0" class="btn btn-info" role="button">All</a>
<a href="${pageContext.request.contextPath}/project/ListViewAction?cat=1" class="btn btn-info" role="button">Child/Elder</a>
<a href="${pageContext.request.contextPath}/project/ListViewAction?cat=2" class="btn btn-info" role="button">Disabled</a>
<a href="${pageContext.request.contextPath}/project/ListViewAction?cat=3" class="btn btn-info" role="button">Animal</a>
<a href="${pageContext.request.contextPath}/project/ListViewAction?cat=4" class="btn btn-info" role="button">Environment</a>
<a href="${pageContext.request.contextPath}/project/ListViewAction?cat=5" class="btn btn-info" role="button">Family</a>
</body>
</html>