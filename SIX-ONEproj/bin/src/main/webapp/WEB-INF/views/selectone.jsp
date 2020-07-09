<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<meta charset="UTF-8">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>${tlone[4]} 님의 게시물 :  ${tlone[1]}</title>
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
    <!-- Header part end-->

   <!-- breadcrumb start-->
   <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner text-center">
                        <div class="breadcrumb_iner_item">
                            <h2><a href="<c:url value='/TimeLine.do'/>" style="color:black;">돌아가기</a></h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->

   <!--================Blog Area =================-->
   <section class="blog_area single-post-area section_padding">
      <div class="container">
         <div class="row">
            <div class="col-md-8 posts-list">
             
			<img src="${tlone[2] }" style="width:85%">
            </div>
            <div class="col-md-4">
            </br>
            ${tlone[1]}
            </br> 
           
            좋아요 수  : 
            </br>
            <div style="position:absolute; margin-bottom:0; background:#ccc;">
            <c:forEach var="item" items="${ids}" varStatus="idx">
            </br>
            <hr style="padding:0;margin:0.2em">
            ${item } : ${comments[idx.index] }
            </c:forEach>
            </div>
            </div>
         </div>
      </div>
   </section>
   <!--================Blog Area end =================-->

<!-- ---------------------- -->



<c:forEach var="item" items="${tlone}" varStatus="idx">
	${idx.index}, ${item} <br />
</c:forEach> 

<div class="dept_main_info white-bg">
                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane " id="home" role="tabpanel" aria-labelledby="home-tab">
                        <!-- single_content  -->
                        <div class="row align-items-center no-gutters">
                            <div class="col-lg-7">
                                <div class="dept_info">
                                    <h3>Dentist with surgical mask holding <br> scaler near patient</h3>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. </p>
                                    <a href="#" class="dep-btn">Appointment<i class="ti-arrow-right"></i></a>
                                </div>
                            </div>
                            <div class="col-lg-5">
                                <div class="dept_thumb">
                                    <img src="resources/images/black.jpg" alt="">
                                </div>
                            </div>
                        </div>
                        <!-- single_content  -->
                    </div>
                    <div  id="Astrology" role="tabpanel" aria-labelledby="Astrology-tab">
                        <!-- single_content  -->
                        <div class="row align-items-center no-gutters">
                            <div class="col-lg-7">
                                <div class="dept_info">
                                    <h3>Dentist with surgical mask holding <br> scaler near patient</h3>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. </p>
                                    <a href="#" class="dep-btn">Appointment<i class="ti-arrow-right"></i></a>
                                </div>
                            </div>
                            <div class="col-lg-5">
                                <div class="dept_thumb">
                                    <img src="resources/images/black.jpg" alt="">
                                </div>
                            </div>
                        </div>
                        <!-- single_content  -->
                    </div>
                    <div class="tab-pane  " id="Neuroanatomy" role="tabpanel" aria-labelledby="Neuroanatomy-tab">
                        <!-- single_content  -->
                        <div class="row align-items-center no-gutters">
                            <div class="col-lg-7">
                                <div class="dept_info">
                                    <h3>Dentist with surgical mask holding <br> scaler near patient</h3>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. </p>
                                    <a href="#" class="dep-btn">Appointment<i class="ti-arrow-right"></i></a>
                                </div>
                            </div>
                            <div class="col-lg-5">
                                <div class="dept_thumb">
                                    <img src="resources/images/black.jpg" alt="">
                                </div>
                            </div>
                        </div>
                        <!-- single_content  -->
                    </div>
                    <div class="tab-pane  " id="Blood" role="tabpanel" aria-labelledby="Blood-tab">
                        <!-- single_content  -->
                        <div class="row align-items-center no-gutters">
                            <div class="col-lg-7">
                                <div class="dept_info">
                                    <h3>Dentist with surgical mask holding <br> scaler near patient</h3>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. </p>
                                    <a href="#" class="dep-btn">Appointment<i class="ti-arrow-right"></i></a>
                                </div>
                            </div>
                            <div class="col-lg-5">
                                <div class="dept_thumb">
                                    <img src="resources/images/black.jpg" alt="">
                                </div>
                            </div>
                        </div>
                        <!-- single_content  -->
                    </div>
                </div>
            </div>



</body>
</html>