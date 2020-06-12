<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE HTML>
<html>
   <head>
   <!-- 
   <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
   <link rel="stylesheet" href='<c:url value="/resources/Table_Responsive/vendor/bootstrap/css/bootstrap.min.css"/>'>
   <link rel="stylesheet" href='<c:url value="/resources/Table_Responsive/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>'>
   <link rel="stylesheet" href='<c:url value="/resources/Table_Responsive/vendor/animate/animate.css"/>'>
   <link rel="stylesheet" href='<c:url value="/resources/Table_Responsive/vendor/select2/select2.min.css"/>'>
   <link rel="stylesheet" href='<c:url value="/resources/Table_Responsive/vendor/perfect-scrollbar/perfect-scrollbar.css"/>'>
   <link rel="stylesheet" href='<c:url value="/resources/Table_Responsive/css/util.css"/>'>
   <link rel="stylesheet" href='<c:url value="/resources/Table_Responsive/css/main.css"/>'>
    -->
   <meta charset="utf-8">
   <title>모두다짐</title>
   
   
   <script>
   jQuery(document).ready(function($) {
      var followFlag = true;
      
      
      $( window ).resize( function() {
         if($(window).width()<970 && followFlag){
            $('.follow *').hide();
            followFlag = false;
         }else if($(window).width()>970 && !followFlag){
            $('.follow *').show();
            followFlag = true;
         }
      });   
   $(window)
   .scroll(
         function() {
            if ($(window).scrollTop() + 200 < ($(document).height() - $(window).height())) {
               $('.follow').attr('style',('padding-top :'+ $(window).scrollTop()+'px') );
            }
         })
         
      });
   
   $(function(){
      
      
       //3]AJAX사용-JSON데이타로 응답받기       
      $('#routine').click(function(){
         $.ajax({
            url:"<c:url value='/Ajax/Routine.do'/>",
            //data:{id:'rr'},//안줘도 돌아감 게시판구분용으로  window.onload 백그라운드 진행
            dataType:'json',
            success:function(data){successAjax(data,'list');},
            error:function(request,error){
               console.log('상태코드:',request.status);
               console.log('서버로부터 받은 HTML데이타:',request.responseText);
               console.log('에러:',error);
            }
            
         });
         
      });
               //var option="";
               //$.each(data,function(key,value){
                  //option+="<h2>"+value+"</h2>";
               //});
            //}
         //});
      //});
});
//ajax로 불러온 루틴 목록의 상세보기
function find(no){
   $.ajax({
      url:"<c:url value='/Ajax/RoutineOne.do'/>",
      dataType:'json',
      data:{no:no},
      success:function(data){successOneAjax(data,'list',no);},
      error:function(request,error){
         console.log('상태코드:',request.status);
         console.log('서버로부터 받은 HTML데이타:',request.responseText);
         console.log('에러:',error);
      }
      
   });
}


   var successOneAjax = function(data,id,no){
      console.log('no는 이거다',no)
      console.log('서버로부터 받은 루틴상세데이타:',data);
      var pbodyString="";
      var day=1;
      
      
      $.each(data,function(index,record){
         pbodyString+="<div class='col-md-1 week'>";
         pbodyString+="<div>"+day+"일차</div>";
         pbodyString+="<p class='icon'><span><i class='flaticon-arm'></i></span></p>";
         pbodyString+="<p class='time'><span>"+record['ru_count']+"회/"+record['set']+"세트</span></p>";
         pbodyString+="<p class='trainer'><span>"+record['exe_no']+"</span></p>";
         pbodyString+="</div>";
         pbodyString+="</div>";
         day++;
      });
      $('#showrou').html(pbodyString);
   }
   //<div class="col-md-1 week">
   //<div>월요일</div>
   //<div class="entry-forth">
      //<p class="icon"><span><i class="flaticon-arm"></i></span></p>
      //<p class="time"><span>10회/3세트</span></p>
      //<p class="trainer"><span>팔굽혀펴기</span></p>
   //</div>
   //</div>

   var successAjax = function(data,id){
      console.log('서버로부터 받은 루틴데이타:',data);   
       var tableString="<tr class='table100-head'style='text-size:15px;  border-bottom-style:solid; border-bottom-color: black; border-top-style: solid; border-top-color: black'>";
       tableString+="<th class='column1'>번호</th>";
       tableString+="<th class='column2'>제목</th>";
       tableString+="<th class='column3'>작성일</th>";
       tableString+="<th class='column4'>작성자</th>";
       tableString+="</tr>";
       $('#tthead').html(tableString);
       
       var bodyString=""
       var i=1
       var num
       $.each(data,function(index,record){
          bodyString+="<tr class='hoo' onclick='find("+record['no']+")'>";
          bodyString+="<td >"+record['no']+"</td>";
          bodyString+="<td >"+record['ru_name']+"</td>";
          bodyString+="<td >"+record['create_date']+"</td>";
          bodyString+="<td >"+record['name']+"</td>";
          bodyString+="</tr>";   
       });
       $('#ttbody').html(bodyString);
   };   
   
   </script>
   
   <style>
.button {
   background-color: black;
   color: white;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 16px;
   margin: 4px 2px;
   cursor: pointer;
}
li.active{
background-color: black;
}

a.aa:hover {
   text-decoration: underline;
   font-weight: bold;
   color: blue;
   font-style: normal;
}

a:link {
   color: black;
   text-decoration: none;
}
 
</style>

   <style type="text/css">
</style>

   </head>
   <body>
   <img src="resources/images/black.jpg" style="width: 100%; height: 100px;" />
   
   <div class="container-fluid">
   <div class="row">
   <div class="col-md-2 follow" style="padding-top:100px;">
      <!-- 카루셀 -->
      <div id="carousel" class="carousel slide" data-ride="carousel">
         <!-- Indicators -->
         <ol class="carousel-indicators">
            <li data-target="#carousel" data-slide-to="0" class="active"></li>
            <li data-target="#carousel" data-slide-to="1"></li>
            <li data-target="#carousel" data-slide-to="2"></li>
         </ol>

         <!-- Wrapper for slides -->
         <div class="carousel-inner">
            <div class="item active">
               <img src="resources/images/11.jpg" alt="바1" style="width:100%;height:400px;">
               <div class="carousel-caption">
               </div>
            </div>
            <div class="item">
               <img src="resources/images/22.jpg" alt="바2" style="width:100%;height:400px;">
               <div class="carousel-caption">
               </div>
               </div>
               <div class="item">
               <img src="resources/images/33.jpg" alt="바3" style="width:100%;height:400px;">
               <div class="carousel-caption">
               </div>
               </div>
            ...
         </div>
         <!-- Controls -->
         <a class="left carousel-control" href="#carousel" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
         </a> <a class="right carousel-control" href="#carousel"
            role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
         </a>
      </div>
      </div>
      <!-- 카루셀1 -->
      
      <div class="col-md-8">
      <div class="col-md-1"></div>
         <div class="col-md-10">
         <div id="header_box">
               <div class="bbs_title">
                  <p></p>
               </div>
               
               <div class="desc"></div>
               <div class="side"></div>
               <!-- 아코디언으로 뿌려주기 -->
               
            </div>


            
            <div class="row">
               <div class="col-md-12">
               <ul class="nav nav-pills">
               <li id="1num" style="background-color: black; border-style:solid; "><a href="<c:url value='/freeboard.do?id=fr'/>">자유게시판</a></li>
               <li id="3num" style="background-color: white;border-style: solid;"><a id="an" href="<c:url value='/freeboard.do?id=an'/>">익명게시판</a></li>
               </ul>
                  <table id="hell" class="table table-bordered table-hover text-center" style="color:black; font-family:sans-serif;" id="tab">
                  <thead id="tthead">         
                     <tr class="table100-head"style="text-size:15px;  border-bottom-style:solid; border-bottom-color: black; border-top-style: solid; border-top-color: black">
                        <th class="column1">번호</th>
                        <th class="column2">제목</th>
                        <th class="column3">작성자</th>
                        <th class="column4">작성일</th>
                        <th class="column5">조회수</th>
                        <th class="column6">추천</th>
                     </tr>
                     </thead>
                     <tbody id="ttbody">
                           <c:if test="${empty list}" var="isEmpty">
                              <tr>
                                 <td colspan="6">등록된 게시물이 없습니다.</td>
                              </tr>
                           </c:if>
                           
                           <c:if test="${not isEmpty}">
                           <tr class="hoo">
                              <td><span class="blink" style="font-family: Fantasy">HOT</span></td>
                              <td class="text-left"><a class="aa"
                                 href="<c:url value='#'/>">초보자 루틴 추천해준다</a></td>
                              <td>다짐하자</td>
                              <td>20-05-15</td>
                              <td>27</td>
                              <td>5</td>
                           </tr>
                              <c:forEach items="${list}" var="item" varStatus="loop">
                                 <tr class="hoo">
                                    <td>${item.board_no}</td>
                                    <td class="text-left">
                                    <a class="aa" href='<c:url value="/view.do?no=${item.board_no}&nowPage=${nowPage}"/>'>${item.title}</a>
                                    </td>
                                    <td>${item.name}</td>
                                    <td>${item.create_at}</td>
                                    <td>${item.count}</td>
                                    <td>0</td>
                                 </tr>
                              </c:forEach>
                           </c:if>
                        </tbody>
                  </table>
                  <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                  
                  </div>
                  
                  
                  <ul class="nav nav-pills">
               
               <c:if test="${empty LoginSuccess}" var="aa">
               <li style="float: right"><a href="<c:url value='#'/>" class="btn btn-danger">로그인하세요</a></li>
               </c:if>
               <c:if test="${!aa}">
               <li style="float: right"><a href="<c:url value='/write.do'/>" class="btn btn-success">글쓰기</a></li>
               </c:if>
            </ul>
               </div>
            <div class="row">
               <div class="col-md-12 text-center">${pagingString}</div>
            </div>
            </div>
            
         <!-- 검색용 UI -->
   <div class="row">
      <div class="text-center">
         <form class="form-inline" method="post"
            action="<c:url value='/freeboard.do'/>">
            <div class="form-group">
               <select name="searchColumn" class="form-control">
                  <option value="title">제목</option>
                  <option value="name">작성자</option>
                  <option value="content">내용</option>
               </select>
            </div>
            <div class="form-group">
               <input type="text" name="searchWord" class="form-control"/>
            </div>
            <button type="submit" class="btn btn-success">검색</button>
         </form>
      </div>
      <!-- 공백용 -->
      <div>.</div>
      <div>.</div>
      <div>.</div>
   </div>
   
         </div>
         
         </div>
         
      <!-- 카루셀 -->
      <div class="col-md-2 follow" style="padding-top:100px;">
      <div id="carousel" class="carousel slide" data-ride="carousel">
         <!-- Indicators -->
         <ol class="carousel-indicators">
            <li data-target="#carousel2" data-slide-to="3" class="active"></li>
            <li data-target="#carousel2" data-slide-to="4"></li>
            <li data-target="#carousel2" data-slide-to="5"></li>
         </ol>

         <!-- Wrapper for slides -->
         <div class="carousel-inner">
            <div class="item active">
               <img src="resources/images/44.jpg" alt="바4" style="width:100%;height:400px;">
               <div class="carousel-caption">
               </div>
            </div>
            <div class="item">
               <img src="resources/images/55.jpg" alt="바5" style="width:100%;height:400px;">
               <div class="carousel-caption">
               </div>
               </div>
               <div class="item">
               <img src="resources/images/66.jpg" alt="바6" style="width:100%;height:400px;">
               <div class="carousel-caption">
               </div>
               </div>
            ...
         </div>
         <!-- Controls -->
         <a class="left carousel-control" href="#carousel2" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
         </a> <a class="right carousel-control" href="#carousel2"
            role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
         </a>
      </div>
      </div>
      </div><!-- row -->
      <!-- 카루셀 -->
      
      
      
      
      
      
         
         </div>
   

   <div class="gototop js-top">
      <a href="#" class="js-gotop"><i class="icon-arrow-up2"></i></a>
   </div>
   
<!-- 
   <script src='<c:url value="/resources/Table_Responsive/vendor/bootstrap/js/popper.js"/>'></script>
   <script src='<c:url value="/resources/Table_Responsive/vendor/bootstrap/js/bootstrap.min.js"/>'></script>
   <script src='<c:url value="/resources/Table_Responsive/vendor/select2/select2.min.js"/>'></script>
 -->
   
   
   </body>
</html>



