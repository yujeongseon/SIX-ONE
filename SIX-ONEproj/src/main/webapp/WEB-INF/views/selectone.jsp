<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<meta charset="UTF-8">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>${tlone[4]}님의게시물 : ${tlone[1]}</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="resources/css/bootstrap.css">
<!-- animate CSS -->
<link rel="stylesheet" href="resources/css/animate.css">
<!-- owl carousel CSS -->
<link rel="stylesheet" href="resources/css/owl.carousel.min.css">
<!-- themify CSS -->
<link rel="stylesheet" href="resources/css/themify-icons.css">
<!-- nice select CSS -->
<link rel="stylesheet" href="resources/css/nice-select.css">
<!-- font awesome CSS -->
<link rel="stylesheet" href="resources/css/magnific-popup.css">
<!-- style CSS -->
<link rel="stylesheet" href="resources/css/style.css">
</head>
<body>
	
</br>
	
	
	<div class="col-md-10 col-md-offset-1" style="border: 0.2px dotted #909090;margin-top:100px;"> 
	<div class="col-md-8">
	<img src="resources/Profile/${tlone[2]}" style="width:100%; height:700px; position: static; padding-top: 90px"/>
	</div>
	<div class="col-md-4 ">
　	<div style="padding-top: 30px"></div><img src="/resources/Profile/${tlone[5]}" style="width:13%"/><span style="font-size: 2.0em">&nbsp;${tlone[4]} </span>
<hr style="padding: 0; margin: 0.2em">

</br>
<h3>${tlone[1]}</h3>
<hr style="padding: 0; margin: 0.2em">
</br>
<div style="overflow:auto; width:100%; height:450px;">
	<c:forEach var="item" items="${ids}" varStatus="idx">
		
						
							<hr style="padding: 0; margin: 0.2em">
            　${item } : ${comments[idx.index] }
            	</br>
            </c:forEach>
            </div>
		</div>
	</div>





</body>
</html>