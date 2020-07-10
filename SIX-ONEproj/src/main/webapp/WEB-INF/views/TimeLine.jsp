<%@page import="java.sql.Date"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.team.sixone.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="<c:url value='/resources/css/reset.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/common.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/TLstyle.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/new_post.css'/>">
<link rel="shortcut icon" href="imgs/instagram.png">

<img src="resources/images/black.jpg"
	style="width: 100%; height: 100px;" />
	<style>
	
hr {
 border-top: 0.8px dashed #444444;
 margin: 0.3em
}
body{ -ms-overflow-style: none; } ::-webkit-scrollbar { display: none; }


	</style>
<%
int j = 0;
DAO dao = new DAO(request.getSession().getServletContext());

Map map = new HashMap();
String id = (String)session.getAttribute("LoginSuccess");
String[] images = new String[1];
String[] ids = new String[1];
String[] content = new String[1];
String[] nos = new String[1];
String[] comcnt = new String[1];
String[] firid = new String[1];
String[] fircom = new String[1];
String[] likes = new String[1];
Date[] date = new Date[1];
if(request.getParameter("search")!=null){
	//뭔가 검색했을때
	map = dao.Search(request.getParameter("search"));
	images = (String[])(map.get("images"));
	ids = (String[])(map.get("ids"));
	content = (String[])(map.get("content")) ;
	date = (Date[])(map.get("date"));
	nos = (String[])(map.get("nos"));
	comcnt = (String[])(map.get("comcnt"));
	firid = (String[])(map.get("firid"));
	fircom = (String[])(map.get("fircom"));
	likes = (String[])(map.get("likes"));
}else{
	//String[] comment  = dao.comments();
	map = dao.timelines();
	images = (String[])(map.get("images"));
	ids = (String[])(map.get("ids"));
	content = (String[])(map.get("content")) ;
	date = (Date[])(map.get("date"));
	nos = (String[])(map.get("nos")) ;
	comcnt = (String[])(map.get("comcnt")) ;
	firid = (String[])(map.get("firid"));
	fircom = (String[])(map.get("fircom"));
	likes = (String[])(map.get("likes"));
}


%>
<script>

//이미지 올리기전 미리보기
function setThumbnail(event) { 
	var reader = new FileReader(); 
	
	reader.onload = function(event) { 
		var img = document.createElement("img"); 
		img.setAttribute("src", event.target.result); 
		img.setAttribute("style", "width:100%;height:100%"); 
		document.querySelector("#image_container").innerHTML = "";
		document.querySelector("#image_container").appendChild(img); 
		}; 
	reader.readAsDataURL(event.target.files[0]);
}


function isSaved(event){ //세이브 체크박스
	 if($("input:checkbox[name='saveRadio']").is(":checked")){
		 console.log('체크');
	 }else{
			document.querySelector("#image_container").innerHTML = "";
			$("#imgform")[0].reset();
	 }

}


</script>
<!--  본문 -->
<div class="col-md-3 col-md-offset-2 trainers-entry follow"
	style="padding-top: 100px; width: 250px;">
	<!-- Button trigger modal -->
	<button type="button" class="btn btn-primary " data-toggle="modal"
		data-target="#wirteModal">글 작성하기</button>
		

	<!-- Modal -->
	<div class="modal fade" id="wirteModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true" >
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">글 작성하기</h4>
				</div>
				<div class="modal-body">
					<!-- 글작성 폼 -->
					
					<div class="form-group">
					<form action="<c:url value='/upload.do'/>" enctype="multipart/form-data" method="POST" id="imgform">
						<!-- 아이디 연동 제대로(함) -->
						<input type="hidden" name="id" value="<%=id %>" id="id"/>
						<div id="image_container"></div>
						<label for="exampleInputFile">사진 업로드</label> 
						<input type="file" id="image" name="image" onchange="setThumbnail(event);" style="width:100%;height:50px">
						<p class="help-block">이미지 파일만 업로드 가능합니다</p>
					
					
						<div class="form-group">
							<label for="exampleInputEmail1">내용</label>
							<textarea name="inscontent" class="form-control" id="inscontent" rows="4" placeholder="내용 입력"></textarea>
						</div>
					
					<div class="checkbox">
					<label> <input type="checkbox" name="saveRadio" checked="checked"> 내용 임시 저장하기
					</label>
				</div>
				<div class="modal-footer">
					<input type="submit" class="btn btn-default"/>
					<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="isSaved();">취소하기</button>
				</div>
					<!-- 글작성 폼 끝 -->
					</form>
				</div>
				
				
				</div>
				
			</div>
		</div>
	</div>

	<!-- 모달끝 -->



	<form class="form-inline" style="padding-top: 5px" method="GET">
		<div class="form-group">
			<label class="sr-only" for="searchtxt">검색하기</label> 
			<input type="text" class="form-control" id="searchtxt" placeholder="검색..." name="search" style="width: 85%; height: 33px;"/> 
			
			<input type="submit" value="" style="width:27px; height:27px; padding-left:5px; background-image:url(resources/images/icon_search.png);background-size:27px 27px; background-color:white"></input>

		</div>
	</form>
	<p style="color: gray;">실시간 인기 검색어 </p>

</div>




<div class="col-md-7 appendd col-xs-12 " style="padding-top: 10px;">
	
		<section id="container" >
      <section id="main_container" style="padding-top: 10px">
         <div class="inner">
            <div class="contents_box">
               <article class="contents">
                  <header class="top">
                     <div class="user_container">
                        <div class="profile_img">
                           <img src="resources/Profile/a.jpg" alt="123">
                        </div>
                        <div class="user_name">
                           <div class="nick_name m_text" style="margin-top: 8px;"><%=ids[0]%></div>
                        </div>
                     </div>

                     <div class="sprite_more_icon" data-name="more">
                        <ul class="toggle_box">
                           <li><input type="submit" class="follow" value="팔로우"
                              data-name="follow"></li>
                           <li>수정</li>
                           <li>삭제</li>
                        </ul>
                     </div>
                  </header>

                  <div class="img_section">
                     <div class="trans_inner">
                        <div>
                           <img alt="이미지 표현" src="/sixone<%=images[0]%>" style="height: 500px;">
                        </div>
                     </div>
                  </div>

                  <div class="bottom_icons">
                     <div class="glyphicon glyphicon-heart" id="heartbtn"style="color: red;" onclick="location.href='tlgood.do?no=<%=nos[0]%>'" ><span style="color: gray;">&nbsp;수정</span>&nbsp;<span style="color: gray;"value="sss" onclick="location.href='del.do?img=<%=images[0]%>' ">삭제</span></div>
                  </div>
                  </br></br>
                  <div style="margin-left: 20px;"><span style="color: black;"><%=content[0]%></span></div>
					</br>
                  <div class="likes m_text">
                     좋아요 <span id="like-count-39"><%=likes[0] %></span> <span id="bookmark-count-39"></span> 개</br>
                  </div>

                  <div class="comment_container">
                     <div class="comment" id="comment-list-ajax-post37">
                        <div class="comment-detail">
                           <div class="nick_name m_text"><%=firid[0]%></div> 
                           <div><%=fircom[0] %></div>
                        </div>
                     </div>
                     <div class="small_heart">
                        <div class="sprite_small_heart_icon_outline"></div>
                     </div>
                     <span style="color:red"><a href="./tl_full.do?tlno=<%=nos[0] %>">댓글 <%=comcnt[0] %>개 전체보기....      </a></span> 
                  </div>
                  <div class="timer"><%=date[0]%></div>
                  
                  
                  <div class="comment_field" id="add-comment-post37" style="padding-top:0">
                     <div class="form-group">
                     <form action="<c:url value='/tlcom.do'/>"  method="POST" id="commentform">
                     <input type="hidden" name="tlcomid" value="<%=id %>" id="id"/>
                     <input type="hidden" name="tlno" value="<%=nos[0] %>" id="tlno"/>
                     <input type="text" placeholder="댓글달기..." class="col-md-9" name="tlcom" class="ftlcom" id="tlcom">
                     <div class="upload_btn m_text" id="commentbtn">게시</div>
                     </form>
                  </div>
                  </div>
               </article>   
            </div>
         </div>
      </section>
   </section>
			<!-- /a-->
	

	</div>
	
	
	
</div>
</div>





<div class="gototop js-top">
	<a href="#" class="js-gotop"><i class="icon-arrow-up2"></i></a>
</div>



<script>




jQuery(document).ready(function($) {
	
	  var followFlag = true;
	   if(window.innerWidth<970){
		   console.log('작음');
			 $('.follow *').hide();
			 followFlag = false;
			 
		 }

	var images = Array();
	var ids = Array();
	var content = Array();
	var date = Array();
	var nos = Array();
	var comcnt = Array();
	var firid = Array();
	var fircom = Array();
	var likes = Array();
	var id = "<%=id%>";
	
	//자바코드로 배열받은거 => JS배열로 변환
	<%for (int i = 0; i < images.length; i++) {%>
		images[<%=i%>] = '<%=images[i]%>';
		ids[<%=i%>] = '<%=ids[i]%>';
		content[<%=i%>] = '<%=content[i]%>';
		date[<%=i%>] = '<%=date[i]%>';
		nos[<%=i%>] = '<%=nos[i]%>';
		comcnt[<%=i%>] = '<%=comcnt[i]%>';
		firid[<%=i%>] = '<%=firid[i]%>';
		fircom[<%=i%>] = '<%=fircom[i]%>';
		likes[<%=i%>] = '<%=likes[i]%>';
		
<%}%>
console.log(ids);
	var page = 1;

						//화면 크기 줄일때 오른쪽 메뉴 삭제, 늘리면 다시 추가
						$(window).resize(function() {
							if ($(window).width() < 1091 && followFlag) {
								//	$('.follow *').remove();
								$('.follow').attr('style', 'width:0px');
								$('.follow *').hide();
								followFlag = false;
							} else if ($(window).width() > 1091 && !followFlag) {
								$('.follow').attr('style', 'width:100%');
								$('.follow *').show();
								//$('.follow').append('<img src="${aaa }" style="width: 100%; height: 500px;" /><p style="color: black;">대충 따라오는 메뉴</p>');
								followFlag = true;
							}
						});
						//클릭할때 사진보여줄예정(SelectOne)
						$('.appendd').click(function() {
							

						});

						$(window)
								.scroll(
										function() {
									
											//스크롤 따라오는 좌측메뉴 $(window).scrollTop()+30'px' 넣으면 왠진 모르겟는데 애가 미쳐돌아감
											if (($(window).scrollTop() + 500 < ($(document).height() - $(window).height()) && followFlag)
													&& $('.follow').is(":visible")) {$('.follow').attr(
																'style',
																('padding-top :'
																		+ ($(
																				window)
																				.scrollTop() + 100) + 'px; width: 250px'));
											}

											console.log($(window).scrollTop(),
													$(document).height(), $(
															window).height(), followFlag);
											//페이징 해서 붙이기
											if (page <<%=images.length%>) {
												if ($(window).scrollTop() + 800 > ($(
														document).height() - $(
														window).height())) {
													if(id==ids[(page)]){
														
													/*$(".appendd")
															//카루셀도..대응시켜야..하는p
															.append('<div class="animate-bos" style="padding-top:30px"><div class="trainers-entry"><div class="trainer-img" style="background-image: url('+images[(page)]+'); height: 600px"></div><div class="desc"><h3 style="color:black;">'+ids[(page)]
													+'<button class="btn btn-primary" value="sss" style=" float: right">del</button> '
													+'</h3><span> '+content[(page)]+'</br>'+date[(page)]+'</span></br></br></br><hr><span style=""><h4>　'+firid[page]+'  '+fircom[page]+'</h4></span><h5 style="margin: 0"><span style="color:red"> <a href="./tl_full.do?tlno='+nos[(page)]+'"> 댓글 ('+comcnt[page]+')개 보기...		</a></span> </h5><hr>'
													+'<div class="form-group"><form action="./tlcom.do"  method="POST" id="commentform"><input type="hidden" name="tlcomid" value="'+id+'" id="id"/><input type="hidden" name="tlno" value="'+nos[(page++)]+'" id="tlno"/>'
													+ '<input type="text" class="col-md-9" name="tlcom" class="ftlcom" id="tlcom" placeholder="댓글 입력" style="border-radius:10px;"></input><input type="submit"/></form></div></div></div></div>');
													*/
													$(".appendd").append('<section id="container"><section id="main_container" style="padding-top: 0px"> <div class="inner"><div class="contents_box"><article class="contents"> <header class="top">  <div class="user_container"> <div class="profile_img">  <img src="'+'resources/Profile/a.jpg'+'" alt="프로필 사진"> </div> <div class="user_name">  <div class="nick_name m_text" style="margin-top: 8px;">'+ids[page]+'></div>  </div> </div>'
													+' <div class="sprite_more_icon" data-name="more"><ul class="toggle_box"> <li><input type="submit" class="follow" value="팔로우" data-name="follow"></li> <li>수정</li> <li>삭제</li> </ul>  </div>  </header> <div class="img_section"><div class="trans_inner"> <div>'
													+' <div alt="sdasacascasc" style="height: 600px;  background-image:url(/sixone'+images[page]+');background-repeat : no-repeat;background-size : cover;"> </div </div> </div> </div>   <div class="bottom_icons">  <div class="glyphicon glyphicon-heart" id="heartbtn"style="color: red;" onclick="location.href=\'tlgood.do?no='+nos[page]+'\'" ><span style="color: gray;">&nbsp;수정</span>&nbsp;<span style="color: gray;"value="sss" onclick="location.href=\'del.do?img='+images[page]+'\'">삭제</span></div> </div> <div style="margin-left: 20px;"><span style="color: black;">'+content[page]+'</span></div>'
													+' <div class="likes m_text">좋아요 <span id="like-count-39">'+likes[page]+'</span> <span id="bookmark-count-39"></span> 개 </div> <div class="comment_container"><div class="comment" id="comment-list-ajax-post37"> <div class="comment-detail"><div class="nick_name m_text">'+firid[page]+'</div>  <div>'+fircom[page]+' </div>   </div></div><div class="small_heart"> <div class="sprite_small_heart_icon_outline"></div> </div>'
													+' <span style="color:red"><a href="./tl_full.do?tlno='+nos[page]+'">댓글 '+comcnt[page]+' 개 전체보기....      </a></span> </div>  <div class="timer">'+date[page]+'</div>     <div class="comment_field" id="add-comment-post37">   <div class="form-group">  <form action="./tlcom.do"  method="POST" id="commentform"> <input type="hidden" name="tlcomid" value="<%=id %>" id="id"/>'
															+'<input type="hidden" name="tlno" value="'+nos[page++]+'" id="tlno"/> <input type="text" placeholder="댓글달기..." class="col-md-9" name="tlcom" class="ftlcom" id="tlcom" > <div class="upload_btn m_text" id="commentbtn">게시</div></form> </div></div></article>    </div></div> </section> </section>');
													
													
													}else{
														$(".appendd").append('<section id="container"><section id="main_container" style="padding-top: 0px"> <div class="inner"><div class="contents_box"><article class="contents"> <header class="top">  <div class="user_container"> <div class="profile_img">  <img src="'+'resources/Profile/a.jpg'+'" alt="프로필 사진"> </div> <div class="user_name">  <div class="nick_name m_text" style="margin-top: 8px;">'+ids[page]+'></div>  </div> </div>'
																+' <div class="sprite_more_icon" data-name="more"><ul class="toggle_box"> <li><input type="submit" class="follow" value="팔로우" data-name="follow"></li> </ul>  </div>  </header> <div class="img_section"><div class="trans_inner"> <div>'
																+' <div style="height: 600px; background-image:url(/sixone'+images[page]+');background-repeat : no-repeat;background-size : cover;"></div>  </div> </div> </div>   <div class="bottom_icons">  <div class="glyphicon glyphicon-heart" id="heartbtn"style="color: red;"></div> </div> <div style="margin-left: 20px;"><span style="color: black;">'+content[page]+'</span></div>'
																+' <div class="likes m_text">좋아요 <span id="like-count-39">'+likes[page]+'</span> <span id="bookmark-count-39"></span> 개 </div> <div class="comment_container"><div class="comment" id="comment-list-ajax-post37"> <div class="comment-detail"><div class="nick_name m_text">'+firid[page]+'</div>  <div>'+fircom[page]+' </div>   </div></div><div class="small_heart"> <div class="sprite_small_heart_icon_outline"></div> </div>'
																+' <span style="color:red"><a href="./tl_full.do?tlno='+nos[page]+'">댓글 '+comcnt[page]+' 개 전체보기....      </a></span> </div>  <div class="timer">'+date[page]+'</div>     <div class="comment_field" id="add-comment-post37">   <div class="form-group">  <form action="./tlcom.do"  method="POST" id="commentform"> <input type="hidden" name="tlcomid" value="<%=id %>" id="id"/>'
																		+'<input type="hidden" name="tlno" value="'+nos[page++]+'" id="tlno"/> <input type="text" placeholder="댓글달기..." class="col-md-9" name="tlcom" class="ftlcom" id="tlcom" > <div class="upload_btn m_text" id="commentbtn">게시</div></form> </div></div></article>    </div></div> </section> </section>');
																}
													
													
												}

											} else if (page ==
<%=images.length%>
	) { // 로딩이 끝났을때
												$(".appendd")
														.append(
																'<div class="trainers-entry col-md-offset-3"><h2>페이지의 끝입니다</h2></br></br></div></div>');
												page++

											}

										});
					});
</script>
</html>

