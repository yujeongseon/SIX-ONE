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
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
       $( "#accordion" ).accordion({
            collapsible: true
          });
});



function gudok(no){
	var ID = "<%=session.getAttribute("LoginSuccess")%>"
	var id = document.getElementById("gudokbtn"+no);
	if(id.innerHTML=="구독하기"){
	$.ajax({
	      url:"<c:url value='/Ajax/gudok.do'/>",
	      dataType:'text',
	      data:{no:no,id:ID},
	      success:function(data){
	    		  id.innerHTML="구독취소";
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
		    		  id.innerHTML="구독하기";
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
																<button id="gudokbtn${item.routine_no}"
																	style="float: center; font-style: italic; background-color: black; font-size: 30px; color: white; display: inline-block; margin: 4px 2px;"
																	onclick="gudok(${item.routine_no});">구독중</button>
															</c:if>
															<c:if test="${not gudok}">
																<button id="gudokbtn${item.routine_no}"
																	style="float: center; font-style: italic; background-color: black; font-size: 30px; color: white; display: inline-block; margin: 4px 2px;"
																	onclick="gudok(${item.routine_no});">구독하기</button>
															</c:if>
															<div>

																<div class="col-md-1 week">
																	<div>1일차</div>
																	<c:forEach items="${item.list}" var="list">
																		<c:if test="${list.days == 1}">
																			<div class="entry-forth">
																				<p class="icon">
																					<span><i class="flaticon-arm"></i></span>
																				</p>
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
																				<p class="icon">
																					<span><i class="flaticon-arm"></i></span>
																				</p>
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
																				<p class="icon">
																					<span><i class="flaticon-arm"></i></span>
																				</p>
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
																				<p class="icon">
																					<span><i class="flaticon-arm"></i></span>
																				</p>
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
																				<p class="icon">
																					<span><i class="flaticon-arm"></i></span>
																				</p>
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
																				<p class="icon">
																					<span><i class="flaticon-arm"></i></span>
																				</p>
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
																				<p class="icon">
																					<span><i class="flaticon-arm"></i></span>
																				</p>
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
						<button
							style="float: right; background-color: black; font-size: 30px; color: white; display: inline-block; margin: 4px 2px;"
							id="writeroutine">루틴작성</button>
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



		<div class="modal fade" tabindex="-1" role="dialog" id="firstmodal">
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
	<div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
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
													<p class="icon">
														<span><i class="flaticon-arm" ></i></span>
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
													<p class="icon">
														<span><i class="flaticon-arm" ></i></span>
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
													<p class="icon">
														<span><i class="flaticon-arm"></i></span>
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
													<p class="icon">
														<span><i class="flaticon-arm" ></i></span>
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
													<p class="icon">
														<span><i class="flaticon-arm"></i></span>
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
													<p class="icon">
														<span><i class="flaticon-arm" ></i></span>
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
													<p class="icon">
														<span><i class="flaticon-arm"></i></span>
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
													<p class="icon">
														<span><i class="flaticon-arm" ></i></span>
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
													<p class="icon">
														<span><i class="flaticon-arm"></i></span>
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
													<p class="icon">
														<span><i class="flaticon-arm" ></i></span>
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
													<p class="icon">
														<span><i class="flaticon-arm"></i></span>
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
													<p class="icon">
														<span><i class="flaticon-arm" ></i></span>
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
													<p class="icon">
														<span><i class="flaticon-arm"></i></span>
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
													<p class="icon">
														<span><i class="flaticon-arm" ></i></span>
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
		
		<div style="" id="exeno"></div>
		
		
		
		
		
		<!-- 선택할 운동 추가하는 모달 -->
		<div class="modal fade" tabindex="-1" role="dialog" id="exerciseModal">
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


							<div class="form-group">
								<label class="col-sm-2 control-label" for="exe-desc">설명</label>
								<div class="col-sm-10">
									<textarea rows="4" cols="50" class="form-control"
										name="exe-desc" id="exe-desc"></textarea>
									<span class="error" id="exe-desc-error"></span>
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
		//각각의 일차에 자신이 입력한 값 넣어주기
		console.log("노값:",no);
		document.getElementById("rouname"+no).innerText = $('#edit-title option:selected').val();//select로 선택된 값 가져오기
		document.getElementById("rouset"+no).innerText = $('#rouset').val();
		document.getElementById("roucount"+no).innerText = $('#roucount').val();
	});
	
	
	$("#edit-title").change(function(){
		if($(this).val() == 'add'){
			$('#exerciseModal').modal('show');
			$(this).val("").prop("selected", true);
		}
	});
	
	$("#writeroutine").click(function(){
		/*
		$.ajax({
		      url:"<c:url value='/Ajax/writeroutine'/>",
		      dataType:'json',
		      data:{no:no,id:ID},
		      success:function(data){
		    		  id.innerHTML="구독취소";
		    		  alert("구독되었습니다")
		      },
		      error:function(request,error){
		         console.log('상태코드:',request.status);
		         console.log('서버로부터 받은 HTML데이타:',request.responseText);
		         console.log('에러:',error);
		      }
		   });
		*/
		$('#firstmodal').modal('show');
		//$('#eventModal').modal('show');
		//$('#exerciseModal').modal('show');
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
    	$.each(exerciseList,function(index,element){
    		console.log("번호:",element.exerciseNo);
    		console.log("운동명:",element.exerciseName);
    		htmlString	+= '<option value="'+element.exerciseName+'">'+element.exerciseName+'</option>';
    		
    	});
   		htmlString += '<option value="add" >운동 추가하기</option>';
    	$('#edit-title').html(htmlString)
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
		
			
		

	
	
	
	</script>
</body>
</html>



