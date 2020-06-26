<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>모두다짐</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="https://fonts.googleapis.com/css?family=BenchNine:700">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700">

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(".hover").mouseleave(
		  function() {
		    $(this).removeClass("hover");
		  }
		);
   
   
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
               $('.follow').attr('style',('padding-top :'+ $(window).scrollTop()+'px'));
            }
         })
         
      });
   
   $(function(){
       $( "#accordion" ).accordion({
            collapsible: true
          });
});

function delok(no){
	$.ajax({
	      url:"<c:url value='/Ajax/delok.do'/>",
	      dataType:'text',
	      data:{no:no},
	      success:function(){
	    		  alert("삭제 되었습니다")
	    		  location.reload();
	      },
	      error:function(request,error){
	         console.log('상태코드:',request.status);
	         console.log('서버로부터 받은 HTML데이타:',request.responseText);
	         console.log('에러:',error);
	      }
	   });
}


function gudok(no){
	var ID = "<%=session.getAttribute("LoginSuccess")%>"
	var id = document.getElementById("gudokbtn"+no);
	if(id.innerHTML=="구독"){
	$.ajax({
	      url:"<c:url value='/Ajax/gudok.do'/>",
	      dataType:'text',
	      data:{no:no,id:ID},
	      success:function(data){
	    	  
	    		  id.innerHTML="구독중";
	    		  alert("구독되었습니다")
	      },
	      error:function(request,error){
	         console.log('상태코드:',request.status);
	         console.log('서버로부터 받은 HTML데이타:',request.responseText);
	         console.log('에러:',error);
	      }
	   });
	}//if
	else {
		$.ajax({
		      url:"<c:url value='/Ajax/gudNO.do'/>",
		      dataType:'text',
		      data:{no:no,id:ID},
		      success:function(data){
		    		  id.innerHTML="구독";
		    		  alert("구독이 취소되었습니다")
		      },
		      error:function(request,error){
		         console.log('상태코드:',request.status);
		         console.log('서버로부터 받은 HTML데이타:',request.responseText);
		         console.log('에러:',error);
		      }
		   });
	}//else
	
}

   </script>

<style>
a.animated-button:link, a.animated-button:visited {
	position: relative;
	display: block;
	padding: 14px 15px;
	color: #fff;
	font-size:14px;
	font-weight: bold;
	text-align: center;
	text-decoration: none;
	text-transform: uppercase;
	overflow: hidden;
	letter-spacing: .08em;
	border-radius: 0;
	text-shadow: 0 0 1px rgba(0, 0, 0, 0.2), 0 1px 0 rgba(0, 0, 0, 0.2);
	-webkit-transition: all 1s ease;
	-moz-transition: all 1s ease;
	-o-transition: all 1s ease;
	transition: all 1s ease;
}
a.animated-button:link:after, a.animated-button:visited:after {
	content: "";
	position: absolute;
	height: 0%;
	left: 50%;
	top: 50%;
	width: 150%;
	z-index: -1;
	-webkit-transition: all 0.75s ease 0s;
	-moz-transition: all 0.75s ease 0s;
	-o-transition: all 0.75s ease 0s;
	transition: all 0.75s ease 0s;
}
a.animated-button:link:hover, a.animated-button:visited:hover {
	color: #fff;
	text-shadow: none;
}
a.animated-button:link:hover:after, a.animated-button:visited:hover:after {
	height: 450%;
}
a.animated-button:link, a.animated-button:visited {
	position: relative;
	display: block;
	padding: 14px 15px;
	color: #000000;
	font-size:19px;
	border-radius: 0;
	font-weight: bold;
	text-align: center;
	text-decoration: none;
	text-transform: uppercase;
	overflow: hidden;
	letter-spacing: .08em;
	text-shadow: 0 0 1px rgba(0, 0, 0, 0.2), 0 1px 0 rgba(0, 0, 0, 0.2);
	-webkit-transition: all 1s ease;
	-moz-transition: all 1s ease;
	-o-transition: all 1s ease;
	transition: all 1s ease;
}


a.animated-button.victoria-one {
	border: 2px solid #D24D57;
}
a.animated-button.victoria-one:after {
	background: #D24D57;
	-moz-transform: translateX(-50%) translateY(-50%) rotate(-25deg);
	-ms-transform: translateX(-50%) translateY(-50%) rotate(-25deg);
	-webkit-transform: translateX(-50%) translateY(-50%) rotate(-25deg);
	transform: translateX(-50%) translateY(-50%) rotate(-25deg);
}

.snip1535 {
  background-color: #013ADF;
  border: none;
  color: #ffffff;
  cursor: pointer;
  display: inline-block;
  font-family: 'BenchNine', Arial, sans-serif;
  font-size: 1em;
  font-size: 22px;
  line-height: 1em;
  margin: 15px 40px;
  outline: none;
  padding: 12px 40px 10px;
  position: relative;
  text-transform: uppercase;
  font-weight: 700;
}
.snip1535:before,
.snip1535:after {
  border-color: transparent;
  -webkit-transition: all 0.25s;
  transition: all 0.25s;
  border-style: solid;
  border-width: 0;
  content: "";
  height: 24px;
  position: absolute;
  width: 24px;
}
.snip1535:before {
  border-color: #013ADF;
  border-right-width: 2px;
  border-top-width: 2px;
  right: -5px;
  top: -5px;
}
.snip1535:after {
  border-bottom-width: 2px;
  border-color: #013ADF;
  border-left-width: 2px;
  bottom: -5px;
  left: -5px;
}
.snip1535:hover,
.snip1535.hover {
  background-color: #013ADF;
}
.snip1535:hover:before,
.snip1535.hover:before,
.snip1535:hover:after,
.snip1535.hover:after {
  height: 100%;
  width: 100%;
}


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

li.active {
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
.entry-forth .icon img{
		width:90px;
	
	
	}
</style>

</head>
<body>
	<img src="resources/images/black.jpg"
		style="width: 100%; height: 100px;" />

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2 follow" style="padding-top: 100px;">
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
							<img src="resources/images/11.jpg" alt="바1"
								style="width: 100%; height: 400px;">
							<div class="carousel-caption"></div>
						</div>
						<div class="item">
							<img src="resources/images/22.jpg" alt="바2"
								style="width: 100%; height: 400px;">
							<div class="carousel-caption"></div>
						</div>
						<div class="item">
							<img src="resources/images/33.jpg" alt="바3"
								style="width: 100%; height: 400px;">
							<div class="carousel-caption"></div>
						</div>

					</div>
					<!-- Controls -->
					<a class="left carousel-control" href="#carousel" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#carousel" role="button"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
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
						<div class="side">
						
							<!-- 
						<c:if test="${fn:length(fn:split(split,','))==2}">
						나눔
						</c:if>
						 -->
						</div>
						<!-- 아코디언으로 뿌려주기 -->
					</div>



					<div class="row">
						<div class="col-md-12">

							<table id="hell"
								class="table table-bordered table-hover text-center"
								style="color: black; font-family: sans-serif;" id="tab">
								<thead id="tthead">
									<tr class="table100-head"
										style="text-size: 15px; border-bottom-style: solid; border-bottom-color: black; border-top-style: solid; border-top-color: black">
										<th class="column1">루틴 목록</th>
									</tr>
								</thead>
							</table>

							<div id="accordion">
								<c:if test="${empty list}" var="isEmpty">
									<div>등록된 루틴이 없습니다.</div>
								</c:if>
								<c:if test="${not isEmpty}">
									<c:forEach items="${list}" var="item" varStatus="loop">
										<!-- 아코디언 제목 -->
										<div>${item.routine_name}
											<span>${item.routine_no}</span> <span>${item.name}</span> <span
												style="float: right">${item.create_at}</span>
										</div>
										<!-- 실질 내용 -->
										<div>
											<div class="row">
												<div class="schedule text-center animate-box">
													<div class="col-md-12">
														<div class="routine">
															<!-- 이 안에 넣기 -->

															<c:if test="${item.gudok}" var="gudok">
																<div class="col-md-12">
																<c:if test="${item.id==sessionScope.LoginSuccess}">
																	<a href="#" class="btn btn-sm animated-button victoria-one"
																		onclick="updateok(${item.routine_no});"
																		style="height:50px; width: 100px; float : left">수정</a>
																	<a href="#" class="btn btn-sm animated-button victoria-one"
																		onclick="delok(${item.routine_no});"
																		style="height:50px; width: 100px; float : left">삭제</a>
															</c:if>
																	<a href="#"
																		class="btn btn-sm animated-button victoria-one"
																		id="gudokbtn${item.routine_no}"
																		onclick="gudok(${item.routine_no});"
																		style="height:50px; width: 100px; float : right">구독중</a>
																</div>
															</c:if>
															<c:if test="${not gudok}">
																<div class="col-md-12">
																<c:if test="${item.id==sessionScope.LoginSuccess}">
															<a href="#" class="btn btn-sm animated-button victoria-one"
																		onclick="updateok(${item.routine_no});"
																		style="height:50px; width: 100px; float : left">수정</a>
																	<a href="#" class="btn btn-sm animated-button victoria-one"
																		onclick="delok(${item.routine_no});"
																		style="height:50px; width: 100px; float : left">삭제</a>
															</c:if>
																	<a href="#"
																		class="btn btn-sm animated-button victoria-one"
																		id="gudokbtn${item.routine_no}"
																		onclick="gudok(${item.routine_no});"
																		style="height:50px; width: 100px; float: right;">구독</a>
																</div>
															</c:if>
															<div>
																<div class="col-md-1 week">
																	<div>1일차</div>
																	<c:forEach items="${item.list}" var="list">
																		<c:if test="${list.days == 1}">
																			<div class="entry-forth">
																				<p class="icon"><span><img src="${list.exercise_motions}"></img></span></p>
																				<p class="time">
																					<span>${list.count}회/${list.set}세트</span>
																				</p>
																				<p class="trainer">
																					<span>${list.exe_no}</span>
																				</p>
																			</div>
																		</c:if>
																	</c:forEach>
																</div>
																<div class="col-md-1 week">
																	<div>2일차</div>
																	<c:forEach items="${item.list}" var="list">
																		<c:if test="${list.days == 2}">
																			<div class="entry-forth">
																				<p class="icon"><span><img src="${list.exercise_motions}"></img></span></p>
																				<p class="time">
																					<span>${list.count}회/${list.set}세트</span>
																				</p>
																				<p class="trainer">
																					<span>${list.exe_no}</span>
																				</p>
																			</div>
																		</c:if>
																	</c:forEach>
																</div>
																<div class="col-md-1 week">
																	<div>3일차</div>
																	<c:forEach items="${item.list}" var="list">
																		<c:if test="${list.days == 3}">
																			<div class="entry-forth">
																				<p class="icon"><span><img src="${list.exercise_motions}"></img></span></p>
																				<p class="time">
																					<span>${list.count}회/${list.set}세트</span>
																				</p>
																				<p class="trainer">
																					<span>${list.exe_no}</span>
																				</p>
																			</div>
																		</c:if>
																	</c:forEach>
																</div>
																<div class="col-md-1 week">
																	<div>4일차</div>
																	<c:forEach items="${item.list}" var="list">
																		<c:if test="${list.days == 4}">
																			<div class="entry-forth">
																				<p class="icon"><span><img src="${list.exercise_motions}"></img></span></p>
																				<p class="time">
																					<span>${list.count}회/${list.set}세트</span>
																				</p>
																				<p class="trainer">
																					<span>${list.exe_no}</span>
																				</p>
																			</div>
																		</c:if>
																	</c:forEach>
																</div>
																<div class="col-md-1 week">
																	<div>5일차</div>
																	<c:forEach items="${item.list}" var="list">
																		<c:if test="${list.days == 5}">
																			<div class="entry-forth">
																				<p class="icon"><span><img src="${list.exercise_motions}"></img></span></p>
																				<p class="time">
																					<span>${list.count}회/${list.set}세트</span>
																				</p>
																				<p class="trainer">
																					<span>${list.exe_no}</span>
																				</p>
																			</div>
																		</c:if>
																	</c:forEach>
																</div>
																<div class="col-md-1 week">
																	<div>6일차</div>
																	<c:forEach items="${item.list}" var="list">
																		<c:if test="${list.days == 6}">
																			<div class="entry-forth">
																				<p class="icon"><span><img src="${list.exercise_motions}"></img></span></p>
																				<p class="time">
																					<span>${list.count}회/${list.set}세트</span>
																				</p>
																				<p class="trainer">
																					<span>${list.exe_no}</span>
																				</p>
																			</div>
																		</c:if>
																	</c:forEach>
																</div>
																<div class="col-md-1 week">
																	<div>7일차</div>
																	<c:forEach items="${item.list}" var="list">
																		<c:if test="${list.days == 7}">
																			<div class="entry-forth">
																				<p class="icon"><span><img src="${list.exercise_motions}"></img></span></p>
																				<p class="time">
																					<span>${list.count}회/${list.set}세트</span>
																				</p>
																				<p class="trainer">
																					<span>${list.exe_no}</span>
																				</p>
																			</div>
																		</c:if>
																	</c:forEach>
																</div>
															</div>
															<!-- 이 안에 넣기 -->
														</div>

													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</c:if>


							</div>

						</div>
						<button class="snip1535" id="writeroutine" style="float : right">루틴작성</button>
						
						<div class="row">
							<div class="col-md-12 text-center">${pagingString}</div>
						</div>

					</div>

					<!-- 검색용 UI -->
					<div class="row">
						<div class="text-center">
							<form class="form-inline" method="post"
								action="<c:url value='/routine.do'/>">
								<div class="form-group">
									<select name="searchColumn" class="form-control">
										<option value="routine_name">제목</option>
										<option value="name">작성자</option>
									</select>
								</div>
								<div class="form-group">
									<input type="text" name="searchWord" class="form-control" />
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
			<div class="col-md-2 follow" style="padding-top: 100px;">
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
							<img src="resources/images/44.jpg" alt="바4"
								style="width: 100%; height: 400px;">
							<div class="carousel-caption"></div>
						</div>
						<div class="item">
							<img src="resources/images/55.jpg" alt="바5"
								style="width: 100%; height: 400px;">
							<div class="carousel-caption"></div>
						</div>
						<div class="item">
							<img src="resources/images/66.jpg" alt="바6"
								style="width: 100%; height: 400px;">
							<div class="carousel-caption"></div>
						</div>
						...
					</div>
					<!-- Controls -->
					<a class="left carousel-control" href="#carousel2"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#carousel2" role="button"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
		</div>
		<!-- row -->
		<!-- 카루셀 -->



		<div class="modal fade" tabindex="-1" role="dialog" id="firstmodal" data-backdrop="static">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="form-horizontal">
							<div class="form-group">
								<label class="col-sm-8 control-label" style="float: left;">먼저 루틴 이름을 입력하세요</label>
							</div>
							<div class="col-sm-12">
									<input class="form-control" type="text" 
										id="rou_title" /> <span class="error" id="exe-name-error"></span>
							</div>
						</div>
						<div class="modal-footer modalBtnContainer-addEvent">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-primary" id="next-exe">NEXT</button>

						</div>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>



		<!-- 루틴추가 클릭시 나오는 모달 -->
	<div class="modal fade" tabindex="-1" role="dialog" id="eventModal" data-backdrop="static">
      <div class="modal-dialog modal-lg" role="document" style="width: 70%; min-height:380px;">
          <div class="modal-content">
              <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                          aria-hidden="true">&times;</span></button>
                  <h4 class="modal-title"></h4>
              </div>
					<div class="modal-body">
						<div class="form-horizontal">
							<div class="row">
								<div class="schedule text-center animate-box">
									<div class="col-md-9">
										<div class="routine">
											<div class="col-md-1 week"style="cursor:pointer">
												<h4 style="text: center;" id="roudays1">1일차</h4>
												<div class="entry-forth" onclick="showin(1)">
													<p class="icon" id="iconin1">
														<span><img src='/sixone/resources/images/rest.png'></img></span>
													</p>
													<p class="time">
														<span id=roucount1></span><span>회/</span>
														<span id="rouset1"></span><span>세트</span>
													</p>
													<p class="trainer">
														<span id="rouname1"></span>
													</p>
												</div>
												<div class="entry-forth" onclick="showin(8)">
													<p class="icon" id="iconin8">
														<span><img src='/sixone/resources/images/rest.png'></img></span>
													</p>
													<p class="time">
														<span id=roucount8></span><span>회/</span>
														<span id="rouset8"></span><span>세트</span>
													</p>
													<p class="trainer">
														<span id="rouname8"></span>
													</p>
												</div>
											</div>
											<div class="col-md-1 week"style="cursor:pointer">
												<h4 style="text: center;" id="roudays2">2일차</h4>
												<div class="entry-forth" onclick="showin(2)">
													<p class="icon" id="iconin2">
														<span><img src='/sixone/resources/images/rest.png'></img></span>
													</p>
													<p class="time">
														<span id=roucount2></span><span>회/</span><span
															id="rouset2"></span><span>세트</span>
													</p>
													<p class="trainer">
														<span id="rouname2"></span>
													</p>
												</div>
												<div class="entry-forth" onclick="showin(9)">
													<p class="icon" id="iconin9">
														<span><img src='/sixone/resources/images/rest.png'></img></span>
													</p>
													<p class="time">
														<span id=roucount9></span><span>회/</span>
														<span id="rouset9"></span><span>세트</span>
													</p>
													<p class="trainer">
														<span id="rouname9"></span>
													</p>
												</div>
											</div>
											<div class="col-md-1 week"style="cursor:pointer">
												<h4 style="text: center;" id="roudays3">3일차</h4>
												<div class="entry-forth" onclick="showin(3)">
													<p class="icon" id="iconin3">
														<span><img src='/sixone/resources/images/rest.png'></img></span>
													</p>
													<p class="time">
														<span id=roucount3></span><span>회/</span><span
															id="rouset3"></span><span>세트</span>
													</p>
													<p class="trainer">
														<span id="rouname3"></span>
													</p>
												</div>
												<div class="entry-forth" onclick="showin(10)">
													<p class="icon" id="iconin10">
														<span><img src='/sixone/resources/images/rest.png'></img></span>
													</p>
													<p class="time">
														<span id=roucount10></span><span>회/</span>
														<span id="rouset10"></span><span>세트</span>
													</p>
													<p class="trainer">
														<span id="rouname10"></span>
													</p>
												</div>
											</div>
											<div class="col-md-1 week"style="cursor:pointer">
												<h4 style="text: center;" id="roudays4">4일차</h4>
												<div class="entry-forth" onclick="showin(4)">
													<p class="icon" id="iconin4">
														<span><img src='/sixone/resources/images/rest.png'></img></span>
													</p>
													<p class="time">
														<span id=roucount4></span><span>회/</span><span
															id="rouset4"></span><span>세트</span>
													</p>
													<p class="trainer">
														<span id="rouname4"></span>
													</p>
												</div>
												<div class="entry-forth" onclick="showin(11)">
													<p class="icon" id="iconin11">
														<span><img src='/sixone/resources/images/rest.png'></img></span>
													</p>
													<p class="time">
														<span id=roucount11></span><span>회/</span>
														<span id="rouset11"></span><span>세트</span>
													</p>
													<p class="trainer">
														<span id="rouname11"></span>
													</p>
												</div>
											</div>
											<div class="col-md-1 week"style="cursor:pointer">
												<h4 style="text: center;" id="roudays5">5일차</h4>
												<div class="entry-forth" onclick="showin(5)">
													<p class="icon" id="iconin5">
														<span><img src='/sixone/resources/images/rest.png'></img></span>
													</p>
													<p class="time">
														<span id=roucount5></span><span>회/</span><span
															id="rouset5"></span><span>세트</span>
													</p>
													<p class="trainer">
														<span id="rouname5"></span>
													</p>
												</div>
												<div class="entry-forth" onclick="showin(12)">
													<p class="icon" id="iconin12">
														<span><img src='/sixone/resources/images/rest.png'></img></span>
													</p>
													<p class="time">
														<span id=roucount12></span><span>회/</span>
														<span id="rouset12"></span><span>세트</span>
													</p>
													<p class="trainer">
														<span id="rouname12"></span>
													</p>
												</div>
											</div>
											<div class="col-md-1 week"style="cursor:pointer">
												<h4 style="text: center;" id="roudays6">6일차</h4>
												<div class="entry-forth" onclick="showin(6)">
													<p class="icon" id="iconin6">
														<span><img src='/sixone/resources/images/rest.png'></img></span>
													</p>
													<p class="time">
														<span id=roucount6></span><span>회/</span><span
															id="rouset6"></span><span>세트</span>
													</p>
													<p class="trainer">
														<span id="rouname6"></span>
													</p>
												</div>
												<div class="entry-forth" onclick="showin(13)">
													<p class="icon" id="iconin13">
														<span><img src='/sixone/resources/images/rest.png'></img></span>
													</p>
													<p class="time">
														<span id=roucount13></span><span>회/</span>
														<span id="rouset13"></span><span>세트</span>
													</p>
													<p class="trainer">
														<span id="rouname13"></span>
													</p>
												</div>
											</div>
											<div class="col-md-1 week"style="cursor:pointer">
												<h4 style="text: center;" id="roudays7">7일차</h4>
												<div class="entry-forth" onclick="showin(7)">
													<p class="icon" id="iconin7">
														<span><img src='/sixone/resources/images/rest.png'></img></span>
													</p>
													<p class="time">
														<span id=roucount7></span><span>회/</span><span
															id="rouset7"></span><span>세트</span>
													</p>
													<p class="trainer">
														<span id="rouname7"></span>
													</p>
												</div>
												<div class="entry-forth" onclick="showin(14)">
													<p class="icon" id="iconin14">
														<span><img src='/sixone/resources/images/rest.png'></img></span>
													</p>
													<p class="time">
														<span id=roucount14></span><span>회/</span>
														<span id="rouset14"></span><span>세트</span>
													</p>
													<p class="trainer">
														<span id="rouname14"></span>
													</p>
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-3" style="display:none" id="disp">
										<div class="form-group">
										<h3 id="roudays"></h3>
											<label class="col-sm-2 control-label" for="edit-title">운동명</label>
											<div class="col-sm-10">
												<select class="form-control" name="edit-title"
													id="edit-title" required="required">
													<option value="">운동을 선택하세요</option>
													<c:forEach items="${exerciseList}" var="item">
														<option value="${item.exerciseName}">${item.exerciseName}</option>
													</c:forEach>
													<option value="add">운동 추가하기</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="edit-count">운동횟수</label>
											<div class="col-sm-4">
												<input class="form-control" type="text" name="edit-count"
													id="roucount" />
											</div>
											<label class="col-sm-2 control-label" for="edit-setcount">세트수</label>
											<div class="col-sm-4">
												<input class="form-control" type="text" name="edit-setcount"
													id="rouset" />
											</div>
										</div>
										<div>
											<button type="button" class="btn btn-success" id="dayout" style="float:right">지우기</button>
											<button type="button" class="btn btn-success" id="dayin" style="float:right">입력</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer modalBtnContainer-addEvent">
                  <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                  <button type="button" class="btn btn-primary" id="save-event">저장</button>
              </div>
          </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->
		
		
	<!-- 루틴수정 클릭시 나오는 모달 -->
	<div class="modal fade" tabindex="-1" role="dialog" id="updateModal" data-backdrop="static">
      <div class="modal-dialog modal-lg" role="document" style="width: 70%; min-height:380px;">
          <div class="modal-content">
              <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                          aria-hidden="true">&times;</span></button>
                  <h4 class="modal-title"></h4>
              </div>
					<div class="modal-body">
						<div class="form-horizontal">
							<div class="row">
								<div class="schedule text-center animate-box">
									<div class="col-md-9">
										<div class="routine">
										<div class="col-md-1 week" style="cursor:pointer">
											<h4 style="text: center;" id="roudaysup1">1일차</h4>
											<div id="1">
											<div class="entry-forth" onclick="showup(1)">
													<p class="icon" id="icon1">
														<span id="roucon1"><i class="flaticon-arm"></i></span>
													</p>
													<p class="time">
														<span id="roucountup1"></span><span>회/</span><span
															id="rousetup1"></span><span>세트</span>
													</p>
													<p class="trainer">
														<span id="rounameup1"></span>
													</p>
												</div>
												</div>
												<div id="2">
												<div class="entry-forth" onclick="showup(2)">
													<p class="icon" id="icon2">
														<span id="roucon2"><i class="flaticon-arm"></i></span>
													</p>
													<p class="time">
														<span id="roucountup2"></span><span>회/</span><span
															id="rousetup2"></span><span>세트</span>
													</p>
													<p class="trainer">
														<span id="rounameup2"></span>
													</p>
												</div>
												</div>
											</div>
										<div class="col-md-1 week" style="cursor:pointer">
											<h4 style="text: center;" id="roudaysup2">2일차</h4>
											<div id="3">
											<div class="entry-forth" onclick="showup(3)">
											<p class="icon" id="icon3">
														<span id="rouicon3"><i class="flaticon-arm"></i></span>
													</p>
													<p class="time">
														<span id="roucountup3"></span><span>회/</span><span
															id="rousetup3"></span><span>세트</span>
													</p>
													<p class="trainer">
														<span id="rounameup3"></span>
													</p>
											</div>
											</div>
											<div id="4">
											<div class="entry-forth" onclick="showup(4)">
											<p class="icon" id="icon4">
														<span id="rouicon4"><i class="flaticon-arm"></i></span>
													</p>
													<p class="time">
														<span id="roucountup4"></span><span>회/</span><span
															id="rousetup4"></span><span>세트</span>
													</p>
													<p class="trainer">
														<span id="rounameup4"></span>
													</p>
											</div>
											</div>
										</div>
										<div class="col-md-1 week" style="cursor:pointer">
											<h4 style="text: center;" id="roudaysup3">3일차</h4>
											<div id="5">
											<div class="entry-forth" onclick="showup(5)">
													<p class="icon" id="icon5">
														<span id="rouicon5"><i class="flaticon-arm"></i></span>
													</p>
													<p class="time">
														<span id="roucountup5"></span><span>회/</span><span
															id="rousetup5"></span><span>세트</span>
													</p>
													<p class="trainer">
														<span id="rounameup5"></span>
													</p>
												</div>
												</div>
											<div id="6">
											<div class="entry-forth" onclick="showup(6)">
											<p class="icon" id="icon6">
														<span id="rouicon6"><i class="flaticon-arm"></i></span>
													</p>
													<p class="time">
														<span id="roucountup6"></span><span>회/</span><span
															id="rousetup6"></span><span>세트</span>
													</p>
													<p class="trainer">
														<span id="rounameup6"></span>
													</p>
											</div>
											</div>
										</div>
										<div class="col-md-1 week" style="cursor:pointer">
											<h4 style="text: center;" id="roudaysup4">4일차</h4>
											<div id="7">
											<div class="entry-forth" onclick="showup(7)">
											<p class="icon" id="icon7">
														<span id="rouicon7"><i class="flaticon-arm"></i></span>
													</p>
													<p class="time">
														<span id="roucountup7"></span><span>회/</span><span
															id="rousetup7"></span><span>세트</span>
													</p>
													<p class="trainer">
														<span id="rounameup7"></span>
													</p>
											</div>
											</div>
											<div id="8">
											<div class="entry-forth" onclick="showup(8)">
											<p class="icon" id="icon8">
														<span id="rouicon8"><i class="flaticon-arm"></i></span>
													</p>
													<p class="time">
														<span id="roucountup8"></span><span>회/</span><span
															id="rousetup8"></span><span>세트</span>
													</p>
													<p class="trainer">
														<span id="rounameup8"></span>
													</p>
											</div>
											</div>
										</div>
										<div class="col-md-1 week" style="cursor:pointer">
											<h4 style="text: center;" id="roudaysup5">5일차</h4>
											<div id="9">
											<div class="entry-forth" onclick="showup(9)">
											<p class="icon" id="icon9">
														<span id="rouicon9"><i class="flaticon-arm"></i></span>
													</p>
													<p class="time">
														<span id="roucountup9"></span><span>회/</span><span
															id="rousetup9"></span><span>세트</span>
													</p>
													<p class="trainer">
														<span id="rounameup9"></span>
													</p>
											</div>
											</div>
											<div id="10">
											<div class="entry-forth" onclick="showup(10)">
											<p class="icon" id="icon10">
														<span id="rouicon10"><i class="flaticon-arm"></i></span>
													</p>
													<p class="time">
														<span id="roucountup10"></span><span>회/</span><span
															id="rousetup10"></span><span>세트</span>
													</p>
													<p class="trainer">
														<span id="rounameup10"></span>
													</p>
											</div>
											</div>
										</div>
										<div class="col-md-1 week" style="cursor:pointer">
											<h4 style="text: center;" id="roudaysup6">6일차</h4>
											<div id="11">
											<div class="entry-forth" onclick="showup(11)">
											<p class="icon" id="icon11">
														<span id="rouicon11"><i class="flaticon-arm"></i></span>
													</p>
													<p class="time">
														<span id="roucountup11"></span><span>회/</span><span
															id="rousetup11"></span><span>세트</span>
													</p>
													<p class="trainer">
														<span id="rounameup11"></span>
													</p>
											</div>
											</div>
											<div id="12">
											<div class="entry-forth" onclick="showup(12)">
											<p class="icon" id="icon12">
														<span id="rouicon12"><i class="flaticon-arm"></i></span>
													</p>
													<p class="time">
														<span id="roucountup12"></span><span>회/</span><span
															id="rousetup12"></span><span>세트</span>
													</p>
													<p class="trainer">
														<span id="rounameup12"></span>
													</p>
											</div>
										</div>
										</div>
										<div class="col-md-1 week" style="cursor:pointer">
											<h4 style="text: center;" id="roudaysup7">7일차</h4>
											<div id="13">
											<div class="entry-forth" onclick="showup(13)">
											<p class="icon" id="icon13">
														<span id="rouicon13"><i class="flaticon-arm"></i></span>
													</p>
													<p class="time">
														<span id="roucountup13"></span><span>회/</span><span
															id="rousetup13"></span><span>세트</span>
													</p>
													<p class="trainer">
														<span id="rounameup13"></span>
													</p>
											</div>
											</div>
											<div id="14">
											<div class="entry-forth" onclick="showup(14)">
											<p class="icon" id="icon14">
														<span id="rouicon14"><i class="flaticon-arm"></i></span>
													</p>
													<p class="time">
														<span id="roucountup14"></span><span>회/</span><span
															id="rousetup14"></span><span>세트</span>
													</p>
													<p class="trainer">
														<span id="rounameup14"></span>
													</p>
											</div>
											</div>
										</div>
										</div>
									</div>
									<div class="col-md-3" style="display:none" id="disp2">
										<div class="form-group">
										<h3 id="roudaysup"></h3>
											<label class="col-sm-2 control-label" for="edit-titleup">운동명</label>
											<div class="col-sm-10">
												<select class="form-control" name="edit-titleup"
													id="edit-titleup" required="required">
													<option value="">운동을 선택하세요</option>
													<c:forEach items="${exerciseList}" var="item">
														<option value="${item.exerciseName}">${item.exerciseName}</option>
													</c:forEach>
													<option value="addd">운동 추가하기</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="edit-count">운동횟수</label>
											<div class="col-sm-4">
												<input class="form-control" type="text" name="edit-count"
													id="roucountup" />
											</div>
											<label class="col-sm-2 control-label" for="edit-setcount">세트수</label>
											<div class="col-sm-4">
												<input class="form-control" type="text" name="edit-setcount"
													id="rousetup" />
											</div>
										</div>
										<div>
											<button type="button" class="btn btn-success" id="dayoutup" style="float:right">지우기</button>
											<button type="button" class="btn btn-success" id="dayinup" style="float:right">입력</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer modalBtnContainer-addEvent" id="savebtn">
                  
              </div>
          </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->
		
		
		
		
		<!-- 선택할 운동 추가하는 모달 -->
		<div class="modal fade" tabindex="-1" role="dialog" id="exerciseModal" data-backdrop="static">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="exemodal-title">운동추가</h4>
					</div>
					<div class="modal-body">
						<div class="form-horizontal">

							<div class="form-group">
								<label class="col-sm-2 control-label" for="exe-name">운동명</label>
								<div class="col-sm-10">
									<input class="form-control" type="text" name="exe-name"
										id="exe-name" /> <span class="error" id="exe-name-error"></span>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-2 control-label" for="exe-part">운동부위</label>
								<div class="col-sm-10">
									<select class="form-control" id="exe-part">
										<option value="" style="color: black">운동부위를 선택하세요</option>
										<option value="상체" style="color: #d92027">상체</option>
										<option value="하체" style="color: #ff9234">하체</option>
										<option value="전신" style="color: #ffcd3c">전신</option>
										<option value="유산소" style="color: #35d0ba">유산소</option>
										<option value="기타" style="color: #10375c">기타</option>
									</select> <span class="error" id="exe-part-error"></span>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-danger" id="delete-exe">삭제</button>
							<button type="button" class="btn btn-primary" id="save-exe">저장</button>
						</div>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->



	</div>
<c:set var="a" value="abcd" scope="request"></c:set>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up2"></i></a>
	</div>

	<!-- 
   <script src='<c:url value="/resources/Table_Responsive/vendor/bootstrap/js/popper.js"/>'></script>
   <script src='<c:url value="/resources/Table_Responsive/vendor/bootstrap/js/bootstrap.min.js"/>'></script>
   <script src='<c:url value="/resources/Table_Responsive/vendor/select2/select2.min.js"/>'></script>
 -->
	
	<script type="text/javascript">
	//수정모달에 수정할 정보 띄워주기
	function updateok(no){
		
		for(i=1; i<15; i++){
			document.getElementById("rounameup"+i).innerText = "";
			document.getElementById("roucountup"+i).innerText = "";
			document.getElementById("rousetup"+i).innerText = "";
			var icon=document.getElementById("icon"+i);
			var reString = "<span><img src='/sixone/resources/images/rest.png'></img></span>";
			icon.innerHTML = reString;
		}
		
		var btn="";
		btn += "<button type='button' class='btn btn-default' data-dismiss='modal'>취소</button>"
		btn += "<button type='button' class='btn btn-primary' onclick='updaterou("+no+")' >저장</button>"
        $('#savebtn').html(btn);
        
		$.ajax({//루틴 상세정보 작성
		      url:"<c:url value='/Ajax/selectone.do'/>",
		      dataType:'json',
		      data:{no:no},
		      success:function(data){
		    	  successOneAjax(data,'list');
		    	  $('#updateModal').modal('show'); //수정 모달 띄우기
		      },
		      error:function(request,error){
		         console.log('상태코드:',request.status);
		         console.log('서버로부터 받은 HTML데이타:',request.responseText);
		         console.log('에러:',error);
		      }
		   });
		
	}////
	
	var successOneAjax = function(data){
	      var a=0,b=0,c=0,d=0,e=0,f=0,g=0;
	      $.each(data,function(index,record){
	    	  if(record['days']==1 && a==1) index=2;
	    	  if(record['days']==1 && a==0){index=1; a++;}
	    	  if(record['days']==2 && b==1) index=4;
	    	  if(record['days']==2 && b==0){index=3; b++;}
	    	  if(record['days']==3 && c==1) index=6;
	    	  if(record['days']==3 && c==0){index=5; c++;}
	    	  if(record['days']==4 && d==1) index=8;
	    	  if(record['days']==4 && d==0){index=7; d++;}
	    	  if(record['days']==5 && e==1) index=10;
	    	  if(record['days']==5 && e==0){index=9; e++;}
	    	  if(record['days']==6 && f==1) index=12;
	    	  if(record['days']==6 && f==0){index=11; f++;}
	    	  if(record['days']==7 && g==1) index=14;
	    	  if(record['days']==7 && g==0){index=13; g++;}
	    	  var pbodyString="";
	    	 id= document.getElementById(index)
	         pbodyString+="<div class='entry-forth'onclick='showup("+index+")'>"
	         pbodyString+="<p class='icon' id='icon"+index+"'><span id='rouicon"+index+"'><img src='"+record['motions']+"'></img></span></p>";
	         pbodyString+="<p class='time'><span id='roucountup"+index+"'>"+record['count']+"</span><span>회/</span><span id='rousetup"+index+"'>"+record['set']+"</span><span>세트</span></p>";
	         pbodyString+="<p class='trainer'><span id='rounameup"+index+"'>"+record['exename']+"</span></p>";
	         pbodyString+="</div>";
	         id.innerHTML=pbodyString;
	         
	      });
	   }
	 /*
		<div class="entry-forth" onclick="showup(1)">
			<p class="icon">
				<span><i class="flaticon-arm" ></i></span>
			</p>
			<p class="time"><span id=roucountup1></span><span>회/</span><span id="rousetup1"></span><span>세트</span></p>
			<p class="trainer"><span id="rounameup1"></span></p>
		</div>
	*/
	function showup(no){
		$('#disp2').show();
			switch(no){
			case 1 : $('#roudaysup').text($('#roudaysup1').text()+" 첫번째");
					 $('#roucountup').val($('#roucountup1').text());
					 $('#rousetup').val($('#rousetup1').text());
					 if($('#rounameup1').text()==""){
						 $('#edit-titleup option:first').prop("selected", true); break;
					 }
					 $('#edit-titleup').val($('#rounameup1').text()).prop("selected", true); break;
			case 2 : $('#roudaysup').text($('#roudaysup1').text()+" 두번째");
					 $('#roucountup').val($('#roucountup2').text());
					 $('#rousetup').val($('#rousetup2').text());
					 if($('#rounameup2').text()==""){
						 $('#edit-titleup option:first').prop("selected", true); break;
					 }
					 $('#edit-titleup').val($('#rounameup2').text()).prop("selected", true); break;	
			case 3 : $('#roudaysup').text($('#roudaysup2').text()+" 첫번째");
					 $('#roucountup').val($('#roucountup3').text());
					 $('#rousetup').val($('#rousetup3').text());
					 if($('#rounameup3').text()==""){
						 $('#edit-titleup option:first').prop("selected", true); break;
					 }
					 $('#edit-titleup').val($('#rounameup3').text()).prop("selected", true); break;
			case 4 : $('#roudaysup').text($('#roudaysup2').text()+" 두번째");
					 $('#roucountup').val($('#roucountup4').text());
					 $('#rousetup').val($('#rousetup4').text());
					 if($('#rounameup4').text()==""){
						 $('#edit-titleup option:first').prop("selected", true); break;
					 }
					 $('#edit-titleup').val($('#rounameup4').text()).prop("selected", true); break;
			case 5 : $('#roudaysup').text($('#roudaysup3').text()+" 첫번째");
					 $('#roucountup').val($('#roucountup5').text());
					 $('#rousetup').val($('#rousetup5').text());
					 if($('#rounameup5').text()==""){
						 $('#edit-titleup option:first').prop("selected", true); break;
					 }
					 $('#edit-titleup').val($('#rounameup5').text()).prop("selected", true); break;
			case 6 : $('#roudaysup').text($('#roudaysup3').text()+" 두번째");
					 $('#roucountup').val($('#roucountup6').text());
					 $('#rousetup').val($('#rousetup6').text());
					 if($('#rounameup6').text()==""){
						 $('#edit-titleup option:first').prop("selected", true); break;
					 }
					 $('#edit-titleup').val($('#rounameup6').text()).prop("selected", true); break;
			case 7 : $('#roudaysup').text($('#roudaysup4').text()+" 첫번째");
					 $('#roucountup').val($('#roucountup7').text());
					 $('#rousetup').val($('#rousetup7').text());
					 if($('#rounameup7').text()==""){
						 $('#edit-titleup option:first').prop("selected", true); break;
					 }
					 $('#edit-titleup').val($('#rounameup7').text()).prop("selected", true); break;
			case 8 : $('#roudaysup').text($('#roudaysup4').text()+" 두번째");
					 $('#roucountup').val($('#roucountup8').text());
					 $('#rousetup').val($('#rousetup8').text());
					 if($('#rounameup8').text()==""){
						 $('#edit-titleup option:first').prop("selected", true); break;
					 }
					 $('#edit-titleup').val($('#rounameup8').text()).prop("selected", true); break;
			case 9 : $('#roudaysup').text($('#roudaysup5').text()+" 첫번째");
					 $('#roucountup').val($('#roucountup9').text());
					 $('#rousetup').val($('#rousetup9').text());
					 if($('#rounameup9').text()==""){
						 $('#edit-titleup option:first').prop("selected", true); break;
					 }
					 $('#edit-titleup').val($('#rounameup9').text()).prop("selected", true); break;
			case 10 : $('#roudaysup').text($('#roudaysup5').text()+" 두번째");
					 $('#roucountup').val($('#roucountup10').text());
					 $('#rousetup').val($('#rousetup10').text());
					 if($('#rounameup10').text()==""){
						 $('#edit-titleup option:first').prop("selected", true); break;
					 }
					 $('#edit-titleup').val($('#rounameup10').text()).prop("selected", true); break;
			case 11 : $('#roudaysup').text($('#roudaysup6').text()+" 첫번째");
					 $('#roucountup').val($('#roucountup11').text());
					 $('#rousetup').val($('#rousetup11').text());
					 if($('#rounameup11').text()==""){
						 $('#edit-titleup option:first').prop("selected", true); break;
					 }
					 $('#edit-titleup').val($('#rounameup11').text()).prop("selected", true); break;
			case 12 : $('#roudaysup').text($('#roudaysup6').text()+" 두번째");
					 $('#roucountup').val($('#roucountup12').text());
					 $('#rousetup').val($('#rousetup12').text());
					 if($('#rounameup12').text()==""){
						 $('#edit-titleup option:first').prop("selected", true); break;
					 }
					 $('#edit-titleup').val($('#rounameup12').text()).prop("selected", true); break;
			case 13 : $('#roudaysup').text($('#roudaysup7').text()+" 첫번째");
					 $('#roucountup').val($('#roucountup13').text());
					 $('#rousetup').val($('#rousetup13').text());
					 if($('#rounameup13').text()==""){
						 $('#edit-titleup option:first').prop("selected", true); break;
					 }
					 $('#edit-titleup').val($('#rounameup13').text()).prop("selected", true); break;
			case 14 : $('#roudaysup').text($('#roudaysup7').text()+" 두번째");
					 $('#roucountup').val($('#roucountup14').text());
					 $('#rousetup').val($('#rousetup14').text());
					 if($('#rounameup14').text()==""){
						 $('#edit-titleup option:first').prop("selected", true); break;
					 }
					 $('#edit-titleup').val($('#rounameup14').text()).prop("selected", true); break;
			
					 
			default :
			}
			
		}/////글쓰기 일차 누르면 입력칸에 해당일자 내용으로 변경
	
	
	
	
	
	function showin(no){
	$('#disp').show();
		switch(no){
		case 1 : $('#roudays').text($('#roudays1').text()+" 첫번째");
				 $('#roucount').val($('#roucount1').text());
				 $('#rouset').val($('#rouset1').text());
				 if($('#rouname1').text()==""){
					 $('#edit-title option:first').prop("selected", true); break;
				 }
				 $('#edit-title').val($('#rouname1').text()).prop("selected", true); break;
		case 8 : $('#roudays').text($('#roudays1').text()+" 두번째");
				 $('#roucount').val($('#roucount8').text());
				 $('#rouset').val($('#rouset8').text());
				 if($('#rouname8').text()==""){
					 $('#edit-title option:first').prop("selected", true); break;
				 }
				 $('#edit-title').val($('#rouname8').text()).prop("selected", true); break;	
		case 2 : $('#roudays').text($('#roudays2').text()+" 첫번째");
				 $('#roucount').val($('#roucount2').text());
				 $('#rouset').val($('#rouset2').text());
				 if($('#rouname2').text()==""){
					 $('#edit-title option:first').prop("selected", true); break;
				 }
				 $('#edit-title').val($('#rouname2').text()).prop("selected", true); break;
		case 9 : $('#roudays').text($('#roudays2').text()+" 두번째");
				 $('#roucount').val($('#roucount9').text());
				 $('#rouset').val($('#rouset9').text());
				 if($('#rouname9').text()==""){
					 $('#edit-title option:first').prop("selected", true); break;
				 }
				 $('#edit-title').val($('#rouname9').text()).prop("selected", true); break;
		case 3 : $('#roudays').text($('#roudays3').text()+" 첫번째");
				 $('#roucount').val($('#roucount3').text());
				 $('#rouset').val($('#rouset3').text());
				 if($('#rouname3').text()==""){
					 $('#edit-title option:first').prop("selected", true); break;
				 }
				 $('#edit-title').val($('#rouname3').text()).prop("selected", true); break;
		case 10 : $('#roudays').text($('#roudays3').text()+" 두번째");
				 $('#roucount').val($('#roucount10').text());
				 $('#rouset').val($('#rouset10').text());
				 if($('#rouname10').text()==""){
					 $('#edit-title option:first').prop("selected", true); break;
				 }
				 $('#edit-title').val($('#rouname10').text()).prop("selected", true); break;
		case 4 : $('#roudays').text($('#roudays4').text()+" 첫번째");
				 $('#roucount').val($('#roucount4').text());
				 $('#rouset').val($('#rouset4').text());
				 if($('#rouname4').text()==""){
					 $('#edit-title option:first').prop("selected", true); break;
				 }
				 $('#edit-title').val($('#rouname4').text()).prop("selected", true); break;
		case 11 : $('#roudays').text($('#roudays4').text()+" 두번째");
				 $('#roucount').val($('#roucount11').text());
				 $('#rouset').val($('#rouset11').text());
				 if($('#rouname11').text()==""){
					 $('#edit-title option:first').prop("selected", true); break;
				 }
				 $('#edit-title').val($('#rouname11').text()).prop("selected", true); break;
		case 5 : $('#roudays').text($('#roudays5').text()+" 첫번째");
				 $('#roucount').val($('#roucount5').text());
				 $('#rouset').val($('#rouset5').text());
				 if($('#rouname5').text()==""){
					 $('#edit-title option:first').prop("selected", true); break;
				 }
				 $('#edit-title').val($('#rouname5').text()).prop("selected", true); break;
		case 12 : $('#roudays').text($('#roudays5').text()+" 두번째");
				 $('#roucount').val($('#roucount12').text());
				 $('#rouset').val($('#rouset12').text());
				 if($('#rouname12').text()==""){
					 $('#edit-title option:first').prop("selected", true); break;
				 }
				 $('#edit-title').val($('#rouname12').text()).prop("selected", true); break;
		case 6 : $('#roudays').text($('#roudays6').text()+" 첫번째");
				 $('#roucount').val($('#roucount6').text());
				 $('#rouset').val($('#rouset6').text());
				 if($('#rouname6').text()==""){
					 $('#edit-title option:first').prop("selected", true); break;
				 }
				 $('#edit-title').val($('#rouname6').text()).prop("selected", true); break;
		case 13 : $('#roudays').text($('#roudays6').text()+" 두번째");
				 $('#roucount').val($('#roucount13').text());
				 $('#rouset').val($('#rouset13').text());
				 if($('#rouname13').text()==""){
					 $('#edit-title option:first').prop("selected", true); break;
				 }
				 $('#edit-title').val($('#rouname13').text()).prop("selected", true); break;
		case 7 : $('#roudays').text($('#roudays7').text()+" 첫번째");
				 $('#roucount').val($('#roucount7').text());
				 $('#rouset').val($('#rouset7').text());
				 if($('#rouname7').text()==""){
					 $('#edit-title option:first').prop("selected", true); break;
				 }
				 $('#edit-title').val($('#rouname7').text()).prop("selected", true); break;
		case 14 : $('#roudays').text($('#roudays7').text()+" 두번째");
				 $('#roucount').val($('#roucount14').text());
				 $('#rouset').val($('#rouset14').text());
				 if($('#rouname14').text()==""){
					 $('#edit-title option:first').prop("selected", true); break;
				 }
				 $('#edit-title').val($('#rouname14').text()).prop("selected", true); break;
		default :
		}
		
	}/////글쓰기 일차 누르면 입력칸에 해당일자 내용으로 변경
	
	
	$("#dayin").click(function(){
		console.log("트루냐?",isNaN($('#rouset').val()));
		
			if($('#edit-title option:selected').val()==""){
				$('#edit-title').focus();
				alert("운동을 선택해주세요");
				return false;
			}
			else if($('#roucount').val()==""){
				alert("몇회 수행할지 입력하세요");
				$('#roucount').focus();
				return false;
			}
			else if($('#rouset').val()==""){
				$('#rouset').focus();
				alert("몇 세트를 할지 입력하세요");
				return false;
			}
			else if(isNaN($('#roucount').val())){
				alert("횟수는 숫자만 입력해주세요");
				$('#roucount').focus();
				return false;
			}
			else if(isNaN($('#rouset').val())){
				alert("세트는 숫자만 입력해주세요");
				$('#rouset').focus();
				return false;
			}
			
		var days = $('#roudays').text();
		var no;
		switch(days){
		case "1일차 첫번째" : no=1; break;
		case "1일차 두번째" : no=8; break;
		case "2일차 첫번째" : no=2; break;
		case "2일차 두번째" : no=9; break;
		case "3일차 첫번째" : no=3; break;
		case "3일차 두번째" : no=10; break;
		case "4일차 첫번째" : no=4; break;
		case "4일차 두번째" : no=11; break;
		case "5일차 첫번째" : no=5; break;
		case "5일차 두번째" : no=12; break;
		case "6일차 첫번째" : no=6; break;
		case "6일차 두번째" : no=13; break;
		case "7일차 첫번째" : no=7; break;
		case "7일차 두번째" : no=14; break;
		default :
		}
		var exername =$('#edit-title option:selected').val();
		console.log("운동명",exername);
		
		$.ajax({
	        url: "<c:url value='/Ajax/exeimage.do'/>",
	        data: {name:exername},
	        dataType:'text',
	        success:function(data){
	        	var iconString=""
	        	var image = document.getElementById("iconin"+no)
	        	iconString += "<span><img src='"+data+"'></img></span>";
	        	image.innerHTML=iconString;
	        },
	        error:function(request,error){
					console.log('상태코드:',request.status);
					console.log('서버로 부터 받은 HTML 데이타:',request.responseText);
					console.log('에러:',error);
				}
	      });
		
		//각각의 일차에 자신이 입력한 값 넣어주기
		document.getElementById("rouname"+no).innerText = $('#edit-title option:selected').val();//select로 선택된 값 가져오기
		document.getElementById("rouset"+no).innerText = $('#rouset').val();
		document.getElementById("roucount"+no).innerText = $('#roucount').val();
	});
	
	//수정 폼 입력
	$("#dayinup").click(function(){
		console.log("트루냐?",isNaN($('#rousetup').val()));
		
			if($('#edit-titleup option:selected').val()==""){
				$('#edit-titleup').focus();
				alert("수정할 운동을 선택해주세요");
				return false;
			}
			else if($('#roucountup').val()==""){
				alert("몇회 수행할지 입력하세요");
				$('#roucountup').focus();
				return false;
			}
			else if($('#rousetup').val()==""){
				$('#rousetup').focus();
				alert("몇 세트를 할지 입력하세요");
				return false;
			}
			else if(isNaN($('#roucountup').val())){
				alert("횟수는 숫자만 입력해주세요");
				$('#roucountup').focus();
				return false;
			}
			else if(isNaN($('#rousetup').val())){
				alert("세트는 숫자만 입력해주세요");
				$('#rousetup').focus();
				return false;
			}
			
		var days = $('#roudaysup').text();
		var no;
		switch(days){
		case "1일차 첫번째" : no=1; break;
		case "1일차 두번째" : no=2; break;
		case "2일차 첫번째" : no=3; break;
		case "2일차 두번째" : no=4; break;
		case "3일차 첫번째" : no=5; break;
		case "3일차 두번째" : no=6; break;
		case "4일차 첫번째" : no=7; break;
		case "4일차 두번째" : no=8; break;
		case "5일차 첫번째" : no=9; break;
		case "5일차 두번째" : no=10; break;
		case "6일차 첫번째" : no=11; break;
		case "6일차 두번째" : no=12; break;
		case "7일차 첫번째" : no=13; break;
		case "7일차 두번째" : no=14; break;
		default :
		}
		
		var exername = $('#edit-titleup option:selected').val();
		console.log("운동명",exername);
		
		$.ajax({
	        url: "<c:url value='/Ajax/exeimage.do'/>",
	        data: {name:exername},
	        dataType:'text',
	        success:function(data){
	        	var iconString=""
	        	var image = document.getElementById("icon"+no)
	        	iconString += "<span><img src='"+data+"'></img></span>";
	        	image.innerHTML=iconString;
	        },
	        error:function(request,error){
					console.log('상태코드:',request.status);
					console.log('서버로 부터 받은 HTML 데이타:',request.responseText);
					console.log('에러:',error);
				}
	      });
		//각각의 일차에 자신이 입력한 값 넣어주기
		console.log("노값:",no);
		document.getElementById("rounameup"+no).innerText = $('#edit-titleup option:selected').val();//select로 선택된 값 가져오기
		document.getElementById("rousetup"+no).innerText = $('#rousetup').val();
		document.getElementById("roucountup"+no).innerText = $('#roucountup').val();
	});//수정폼 입력
	
	
	
	
	
	//적은 루틴상세데이터 빈칸으로 만들어주기
	$("#dayout").click(function(){
		var days = $('#roudays').text();
		var no;
		switch(days){
		case "1일차 첫번째" : no=1; break;
		case "1일차 두번째" : no=8; break;
		case "2일차 첫번째" : no=2; break;
		case "2일차 두번째" : no=9; break;
		case "3일차 첫번째" : no=3; break;
		case "3일차 두번째" : no=10; break;
		case "4일차 첫번째" : no=4; break;
		case "4일차 두번째" : no=11; break;
		case "5일차 첫번째" : no=5; break;
		case "5일차 두번째" : no=12; break;
		case "6일차 첫번째" : no=6; break;
		case "6일차 두번째" : no=13; break;
		case "7일차 첫번째" : no=7; break;
		case "7일차 두번째" : no=14; break;
		default :
		}
		//해당하는 일차에 적용된 내용 지워주기
		$('#roucount').val("");
		$('#rouset').val("");
		$('#edit-title option:first').prop("selected", true);
		document.getElementById("iconin"+no).innerHTML = "<span><img src='/sixone/resources/images/rest.png'></img></span>";
		document.getElementById("rouname"+no).innerText = "";
		document.getElementById("rouset"+no).innerText = "";
		document.getElementById("roucount"+no).innerText = "";
	});
	
	//수정폼 루틴상세데이터 빈칸으로 만들어주기
	$("#dayoutup").click(function(){
		var days = $('#roudaysup').text();
		var no;
		switch(days){
		case "1일차 첫번째" : no=1; break;
		case "1일차 두번째" : no=2; break;
		case "2일차 첫번째" : no=3; break;
		case "2일차 두번째" : no=4; break;
		case "3일차 첫번째" : no=5; break;
		case "3일차 두번째" : no=6; break;
		case "4일차 첫번째" : no=7; break;
		case "4일차 두번째" : no=8; break;
		case "5일차 첫번째" : no=9; break;
		case "5일차 두번째" : no=10; break;
		case "6일차 첫번째" : no=11; break;
		case "6일차 두번째" : no=12; break;
		case "7일차 첫번째" : no=13; break;
		case "7일차 두번째" : no=14; break;
		default :
		}
		//해당하는 일차에 적용된 내용 지워주기
		$('#roucountup').val("");
		$('#rousetup').val("");
		$('#edit-titleup option:first').prop("selected", true);
		document.getElementById("icon"+no).innerHTML = "<span><img src='/sixone/resources/images/rest.png'></img></span>";
		document.getElementById("rounameup"+no).innerText = "";
		document.getElementById("rousetup"+no).innerText = "";
		document.getElementById("roucountup"+no).innerText = "";
	});
	
	
	$("#edit-title").change(function(){
		if($(this).val() == 'add'){
			$('#exerciseModal').modal('show');
			$(this).val("").prop("selected", true);
		}
	});
	$("#edit-titleup").change(function(){
		if($(this).val() == 'addd'){
			$('#exerciseModal').modal('show');
			$(this).val("").prop("selected", true);
		}
	});
	
	$("#writeroutine").click(function(){
		$('#firstmodal').modal('show');
	});
	$("#next-exe").click(function(){
		if($('#rou_name').val()==""){
			alert("먼저 루틴 이름을 정해주세요");
			$('#rou_name').focus();
			return false;
		}
		$('#eventModal').modal('show');
	});
	
	// 운동 등록
	   $("#save-exe").click(function(){
	      var exerciseName = $('#exe-name').val();
	      var exercisePartials = $('#exe-part option:selected').val();
	      
	      
	      if(exerciseName == ''){
	         $('#exe-name-error').html('운동명을 입력하세요');
	         return;
	      }
	      else{
	         $('#exe-name-error').html('');
	      }
	      
	      if(exercisePartials == ''){
	         $('#exe-part-error').html('운동 부위를 선택하세요');
	         return;
	      }
	      else{
	         $('#exe-part-error').html('');
	      }
	      
	      var exerciseMotions = '';
	      if(exercisePartials == '상체'){
	         exerciseMotions = "<c:url value='/resources/images/up_exercise.png'/>"
	      }
	      else if(exercisePartials == '하체'){
	         exerciseMotions = "<c:url value='/resources/images/low_exercise.png'/>"
	      }
	      else if(exercisePartials == '전신'){
	         exerciseMotions = "<c:url value='/resources/images/whole_exercise.png'/>"
	      }
	      else if(exercisePartials == '유산소'){
	         exerciseMotions = "<c:url value='/resources/images/aerobic_exercise.png'/>"
	      }
	      else{
	         exerciseMotions = "<c:url value='/resources/images/etc_exercise.png'/>"
	      }
	      
	      
	      $.ajax({
	             type: "get",
	             url: "/sixone/exercise.insert",
	             data: {
	               "exerciseName":exerciseName,"exercisePartials":exercisePartials,"exerciseMotions":exerciseMotions
	             },
	             success: function (response) {
	                if(response == 1){
	                   $('#exerciseModal').modal('hide');
	                   alert('새로운 운동이 등록되었습니다');
	                   $.ajax({
	                        type: "get",
	                        url: "/sixone/exercise.read",
	                        data: {
	                        },
	                        dataType:'json',
	                        success: addOption_,
	                        error:function(request,error){
	                            console.log('상태코드:',request.status);
	                            console.log('서버로 부터 받은 HTML 데이타:',request.responseText);
	                            console.log('에러:',error);
	                         
	                         }
	                      });
	                }
	             },
	             error:function(request,error){
	               console.log('상태코드:',request.status);
	               console.log('서버로 부터 받은 HTML 데이타:',request.responseText);
	               console.log('에러:',error);
	            
	            }
	           });
	   });
	
	$.ajax({
        type: "get",
        url: "/sixone/exercise.read",
        data: {
        },
        dataType:'json',
        success: addOption_,
        error:function(request,error){
				console.log('상태코드:',request.status);
				console.log('서버로 부터 받은 HTML 데이타:',request.responseText);
				console.log('에러:',error);
			}
      });
	
	function addOption_(exerciseList) {
    	var htmlString = '<option value="" >운동을 선택하세요</option>';
    	var htmlStringup = '<option value="" >운동을 선택하세요</option>';
    	$.each(exerciseList,function(index,element){
    		console.log("번호:",element.exerciseNo);
    		console.log("운동명:",element.exerciseName);
    		htmlString	+= '<option value="'+element.exerciseName+'">'+element.exerciseName+'</option>';
    		htmlStringup += '<option value="'+element.exerciseName+'">'+element.exerciseName+'</option>';
    	});
   		htmlString += '<option value="add" >운동 추가하기</option>';
   		htmlStringup += '<option value="addd" >운동 추가하기</option>';
    	$('#edit-title').html(htmlString);
    	$('#edit-titleup').html(htmlStringup);
    }
	
	
	
	$('#save-event').click(function(){
		var Title = document.getElementById("rou_title").value;
		var ID = "<%=session.getAttribute("LoginSuccess")%>";
		
		$.ajax({//루틴 글부터 작성
		      url:"<c:url value='/Ajax/writerou.do'/>",
		      dataType:'text',
		      data:{title:Title,id:ID},
		      success:function(){
		    		  alert("루틴 명 먼저 입력됨");
		    		  for(i=1; i<15; i++){
		    				console.log("도큐먼트 루네임 이너텍스트:",document.getElementById("rouname"+i).innerText);
		    				if(document.getElementById("rouname"+i).innerText==""){
		    					console.log("null확인하고 if문으로 들어옴"+i)
		    					//return;
		    				}
		    				else {
		    					exename = document.getElementById("rouname"+i).innerText;
		    					roucount = document.getElementById("roucount"+i).innerText;
		    					rouset = document.getElementById("rouset"+i).innerText;
		    					days = i;
		    					$.ajax({//루틴 상세정보 작성
		    					      url:"<c:url value='/Ajax/writedetail.do'/>",
		    					      dataType:'text',
		    					      data:{exename:exename,roucount:roucount,rouset:rouset,days:days},
		    					      success:function(){
		    					    		  console.log("번째글 작성",i);
		    					      },
		    					      error:function(request,error){
		    					         console.log('상태코드:',request.status);
		    					         console.log('서버로부터 받은 HTML데이타:',request.responseText);
		    					         console.log('에러:',error);
		    					      }
		    					   });
		    				}
		    			}
		    		  alert("작성끝");
		    		  location.reload();
		      },
		      error:function(request,error){
		         console.log('상태코드:',request.status);
		         console.log('서버로부터 받은 HTML데이타:',request.responseText);
		         console.log('에러:',error);
		      },
		      
		   });
	  
	});
	
		
	 function updaterou(no){
		 
		 $.ajax({
		        url: "<c:url value='/Ajax/roudelete.do'/>",
		        data: {no:no},
		        dataType:'text',
		        success: alert("수정을 위한 먼저 삭제"),
		        error:function(request,error){
						console.log('상태코드:',request.status);
						console.log('서버로 부터 받은 HTML 데이타:',request.responseText);
						console.log('에러:',error);
					}
		      });
		    		 for(i=1; i<15; i++){
		    				if(document.getElementById("rounameup"+i).innerText==""){
		    					console.log("null확인하고 if문으로 들어옴"+i)
		    					//return;
		    				}
		    				else {
		    					exename = document.getElementById("rounameup"+i).innerText;
		    					roucount = document.getElementById("roucountup"+i).innerText;
		    					rouset = document.getElementById("rousetup"+i).innerText;
		    					days = i;
		    					$.ajax({//루틴 상세정보 작성
		    					      url:"<c:url value='/Ajax/rouupdate.do'/>",
		    					      dataType:'text',
		    					      data:{exename:exename,roucount:roucount,rouset:rouset,days:days,no:no},
		    					      success:function(){
		    					    		  console.log("번째글 수정",i);
		    					      },
		    					      error:function(request,error){
		    					         console.log('상태코드:',request.status);
		    					         console.log('서버로부터 받은 HTML데이타:',request.responseText);
		    					         console.log('에러:',error);
		    					      }
		    					   });
		    				}
		    			}
		    		  alert("수정끝");
		    		  location.reload();
		   };

	</script>
</body>


</html>



