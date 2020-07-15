<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>벤 페이지</title>
</head>
<body>
<div class="container">
<h2>당신은 해당 사유에 의해 제제되었습니다</h2>
<h3>제제사유: ${sessionScope.ban}</h3>
<h2>자세한 사항은 six_one@gmail.com으로 문의해주십시오</h2>
</div>
</body>
</html>