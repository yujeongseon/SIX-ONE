<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
.entry-forth .icon img{
   width:100px;
}
.teamImg {
   width:100%;
   height:300px;
}


</style>


      <aside id="colorlib-hero">
         <div class="flexslider">
            <ul class="slides">
               <li style="background-image: url(resources/images/img_bg_1.jpg);">
                  <div class="overlay"></div>
                  <div class="container-fluid">
                     <div class="row">
                        <div class="col-md-6 col-sm-12 col-md-offset-3 slider-text">
                           <div class="slider-text-inner text-center">
                              <h1>This is a Lifestyle<br/>There is no Finish Line</h1>
                              <p><a href="#" class="btn btn-primary btn-lg btn-learn">나의 운동 확인하기</a></p>
                           </div>
                        </div>
                     </div>
                  </div>
               </li>
               <li style="background-image: url(resources/images/img_bg_5.png);">
                  <div class="overlay"></div>
                  <div class="container-fluid">
                     <div class="row">
                        <div class="col-md-8 col-sm-12 col-md-offset-2 slider-text">
                           <div class="slider-text-inner text-center">
                              <h1>Don't Stop When it Hurts,<br/> Stop When You're Done</h1>
                              <p><a href="#" class="btn btn-primary btn-lg btn-learn">나의 운동 확인하기</a></p>
                           </div>
                        </div>
                     </div>
                  </div>
               </li>
               <li style="background-image: url(resources/images/img_bg_3.jpg);">
                  <div class="overlay"></div>
                  <div class="container-fluid">
                     <div class="row">
                        <div class="col-md-6 col-sm-12 col-md-offset-3 slider-text">
                           <div class="slider-text-inner text-center">
                              <h1>Stop Wishing, <br/>Start Doing</h1>
                              <p><a href="#" class="btn btn-primary btn-lg btn-learn">나의 운동 확인하기</a></p>
                           </div>
                        </div>
                     </div>
                  </div>
               </li>
               <li style="background-image: url(resources/images/img_bg_4.jpg);">
                  <div class="overlay"></div>
                  <div class="container-fluid">
                     <div class="row">
                        <div class="col-md-8 col-sm-12 col-md-offset-2 slider-text">
                           <div class="slider-text-inner text-center">
                              <h1>Working Out is a Reward <br/>not a Punishment</h1>
                              <p><a href="#" class="btn btn-primary btn-lg btn-learn">나의 운동 확인하기</a></p>
                           </div>
                        </div>
                     </div>
                  </div>
               </li>   
              </ul>
           </div>
      </aside>
      <div id="colorlib-intro">
         <div class="container">
            <div class="row">
               <div class="col-md-12 intro-wrap animate-box">
                  <div class="intro-flex">
                  
                     <div class="one-third intro-img" style="background-image: url(resources/images/intro-img-1.jpg)">
                        <div class="desc">
                           <h3>운동</h3>
                           <a href="<c:url value='/exercise.do'/>"><span class="price text-center">확인하기<br></span></a>
                        </div>
                     </div>
                     <div class="one-third intro-img" style="background-image: url(resources/images/intro-img-2.jpg)">
                        <div class="desc">
                           <h3>스케쥴</h3>
                           <a href="#;" onclick="javascript:isLogin(this);"><span class="price text-center">확인하기<br></span></a>
                        </div>
                     </div>
                     <div class="one-third intro-img" style="background-image: url(resources/images/intro-img-3.jpg)">
                        <div class="desc">
                           <h3>칼로리 계산</h3>
                           <a href="<c:url value='/food.do'/>"><span class="price text-center">확인하기<br></span></a>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>

      



      <div id="colorlib-schedule" class="colorlib-light-grey">
         <div class="container">
            <div class="row">
               <div class="col-md-8 col-md-offset-2 text-center colorlib-heading animate-box">
                  <h2>인기있는 루틴</h2>
                  <p>가장 많은 사람이 구독한 루틴으로 운동을 시작해보세요</p>
               </div>
            </div>
            
            
            <div class="best-member">
               <img src="<c:url value='/resources/images/trainer-4.jpg'/>"/>
               <span>${bestRoutine[0].id } | ${bestRoutine[0].routineName }</span>
               <c:if test="${not empty sessionScope.LoginSuccess}">
                  <c:if test="${TF}" var="gudokk">
                                <span class="glyphicon glyphicon-thumbs-up" style="color: red; float:right;">구독중</span>
                       </c:if>
                       <c:if test="${not gudokk}">
                          <button id="gugu" onclick="gudok(${bestRoutine[0].routineNo})" style="float:right;">
                             <span class="glyphicon glyphicon-thumbs-up" style="color: black;"><i id="gogo">구독하기</i></span>
                          </button>
                       </c:if>
                    </c:if>
            </div>


            <div class="row">
               <div class="schedule text-center animate-box">
                  <div class="col-md-12">
                     <div class="routine" >
                        <div class="col-md-1 week">
                           <div>1일차</div>
                           <c:forEach items="${bestRoutine }" var="list">
                              <c:if test="${list.routineDays == 1 }">
                                 <div class="entry-forth">
                                    <p class="icon"><span><img src="${list.exerciseMotions }"></img></span></p>
                                    <p class="time"><span>${list.goalCount }회 / ${list.goalSet }세트</span></p>
                                    <p class="trainer"><span>${list.exerciseName }</span></p>
                                 </div>
                              </c:if>   
                           </c:forEach>
                        </div>
                        <div class="col-md-1 week">
                           <div>2일차</div>
                           <c:forEach items="${bestRoutine }" var="list">
                              <c:if test="${list.routineDays == 2 }">
                                 <div class="entry-forth">
                                    <p class="icon"><span><img src="${list.exerciseMotions }"></img></span></p>
                                    <p class="time"><span>${list.goalCount }회 / ${list.goalSet }세트</span></p>
                                    <p class="trainer"><span>${list.exerciseName }</span></p>
                                 </div>
                              </c:if>   
                           </c:forEach>
                        </div>
                        <div class="col-md-1 week">
                           <div>3일차</div>
                           <c:forEach items="${bestRoutine }" var="list">
                              <c:if test="${list.routineDays == 3 }">
                                 <div class="entry-forth">
                                    <p class="icon"><span><img src="${list.exerciseMotions }"></img></span></p>
                                    <p class="time"><span>${list.goalCount }회 / ${list.goalSet }세트</span></p>
                                    <p class="trainer"><span>${list.exerciseName }</span></p>
                                 </div>
                              </c:if>   
                           </c:forEach>
                        </div>
                        <div class="col-md-1 week">
                           <div>4일차</div>
                           <c:forEach items="${bestRoutine }" var="list">
                              <c:if test="${list.routineDays == 4 }">
                                 <div class="entry-forth">
                                    <p class="icon"><span><img src="${list.exerciseMotions }"></img></span></p>
                                    <p class="time"><span>${list.goalCount }회 / ${list.goalSet }세트</span></p>
                                    <p class="trainer"><span>${list.exerciseName }</span></p>
                                 </div>
                              </c:if>   
                           </c:forEach>
                        </div>
                        <div class="col-md-1 week">
                           <div>5일차</div>
                           <c:forEach items="${bestRoutine }" var="list">
                              <c:if test="${list.routineDays == 5 }">
                                 <div class="entry-forth">
                                    <p class="icon"><span><img src="${list.exerciseMotions }"></img></span></p>
                                    <p class="time"><span>${list.goalCount }회 / ${list.goalSet }세트</span></p>
                                    <p class="trainer"><span>${list.exerciseName }</span></p>
                                 </div>
                              </c:if>   
                           </c:forEach>
                        </div>
                        <div class="col-md-1 week">
                           <div>6일차</div>
                           <c:forEach items="${bestRoutine }" var="list">
                              <c:if test="${list.routineDays == 6 }">
                                 <div class="entry-forth">
                                    <p class="icon"><span><img src="${list.exerciseMotions }"></img></span></p>
                                    <p class="time"><span>${list.goalCount }회 / ${list.goalSet }세트</span></p>
                                    <p class="trainer"><span>${list.exerciseName }</span></p>
                                 </div>
                              </c:if>   
                           </c:forEach>
                        </div>
                        <div class="col-md-1 week">
                           <div>7일차</div>
                           <c:forEach items="${bestRoutine }" var="list">
                              <c:if test="${list.routineDays == 7 }">
                                 <div class="entry-forth">
                                    <p class="icon"><span><img src="${list.exerciseMotions }"></img></span></p>
                                    <p class="time"><span>${list.goalCount }회 / ${list.goalSet }세트</span></p>
                                    <p class="trainer"><span>${list.exerciseName }</span></p>
                                 </div>
                              </c:if>   
                           </c:forEach>
                        </div>                           
                        
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      

      <div id="colorlib-testimony" class="testimony-img" style="background-image: url(resources/images/img_bg_4.jpg);" data-stellar-background-ratio="0.5">
         <div class="overlay"></div>
         <div class="colorlib-trainers">
            <div class="container member">
               <div class="row">
                  <div class="col-md-8 col-md-offset-2 text-center colorlib-heading animate-box">
                     <h1 style="margin-top: 20px">SIX-ONE</h1>
                  </div>
               </div>
               <div class="row">
                  <div class="col-md-2 col-sm-2 animate-box">
                     <div class="trainers-entry">
                        <div class="text-center">
                           <img class="teamImg" src="resources/images/deokjung.png"/>
                        </div>
                        <div class="desc">
                           <h3>김덕중</h3>
                           <span>팀원, 여행을 <br> 좋아합니다</span>
                        </div>
                     </div>
                  </div>
                  
                  <div class="col-md-2 col-sm-2 animate-box">
                     <div class="trainers-entry">
                        <div class="text-center">
                           <img class="teamImg" src="resources/images/jihyuk.png"/>
                        </div>
                        <div class="desc">
                           <h3>송지혁</h3>
                           <span>팀원, 홈 트레이닝을 <br> 하고 있습니다</span>
                        </div>
                     </div>
                  </div>

                  <div class="col-md-4 col-sm-4 animate-box">
                     <div class="trainers-entry">
                        <div class="text-center">
                           <img class="teamImg" src="resources/images/subin.png"/>
                        </div>
                        <div class="desc">
                           <h3>박수빈</h3>
                           <span>팀장, 취미는 자전거입니다 <br>　</span>
                        </div>
                     </div>
                  </div>

                  <div class="col-md-2 col-sm-2 animate-box">
                     <div class="trainers-entry">
                        <div class="text-center">
                           <img class="teamImg" src="resources/images/jeongseon.png"/>
                        </div>
                        <div class="desc">
                           <h3>유정선</h3>
                           <span>팀원, 취미는  <br>클라이밍 입니다</span>
                        </div>
                     </div>
                  </div>

                  <div class="col-md-2 col-sm-2 animate-box">
                     <div class="trainers-entry">
                        <div class="text-center">
                           <img class="teamImg" src="resources/images/seontae.png"/>
                        </div>
                        <div class="desc">
                           <h3>이선태</h3>
                           <span>팀원, 무에타이를 <br> 배우고 있습니다</span>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
<script>
function gudok(no){
   var ID = "<%=session.getAttribute("LoginSuccess")%>"
   var yd = document.getElementById("gogo");
   if(yd.innerHTML=="구독하기"){
   $.ajax({
         url:"<c:url value='/Ajax/gudok.do'/>",
         dataType:'text',
         data:{no:no,id:ID},
         success:function(data){
            var String = "<span class='glyphicon glyphicon-thumbs-up' style='color: red; float:right;'>구독중</span>"
               $('#gugu').html(String);
               alert("구독되었습니다");
         },
         error:function(request,error){
            console.log('상태코드:',request.status);
            console.log('서버로부터 받은 HTML데이타:',request.responseText);
            console.log('에러:',error);
         }
      });
   }//if
   
}
</script>