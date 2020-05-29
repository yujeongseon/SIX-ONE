<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

		<img src="resources/images/black.jpg" style="width: 100%; height: 100px;" />
<%String[] images = (String[])request.getAttribute("images"); %>

<!--  본문 -->
<div class="col-md-3 col-md-offset-1 trainers-entry follow" style="padding-top:30px; width: 300px">  
							<img src="${aaa }" style="width: 100%; height: 500px;" />
							<p style="color: black;">대충 따라오는 메s뉴</p>
				</div>
		<div class="col-md-6 col-md-offset-1 appendd" style="padding-top: 20px;">
			<div class="animate-box">
				<div class="trainers-entry">
					<div class="trainer-img"
						style="background-image: url(${bbb}); height: 600px"></div>
					<div class="desc">
						<h3>처음에 로딩되는 게시물 아이디 들어갈곳</h3>
						<span> 내용 </br>들어갈 곳
						</span>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	


	
	</div>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up2"></i></a>
	</div>



<script>
	jQuery(document).ready(function($) {

	var images = Array();
	//자바코드로 배열받은거 => JS배열로 변환
	<%for(int i=0;i<10;i++){%>
		images[<%=i%>] = '<%=images[i]%>';
	<%}%>
	
	var page = 1;
	var followFlag = true;
	
	//화면 크기 줄일때 오른쪽 메뉴 삭제, 늘리면 다시 추가
	$( window ).resize( function() {
		if($(window).width()<970 && followFlag){
		//	$('.follow *').remove();
			$('.follow *').hide();
			followFlag = false;
		}else if($(window).width()>970 && !followFlag){
			$('.follow *').show();
			//$('.follow').append('<img src="${aaa }" style="width: 100%; height: 500px;" /><p style="color: black;">대충 따라오는 메뉴</p>');
			followFlag = true;
		}
	});	
	//클릭할때 사진보여줄예정(SelectOne)
	$('.appendd').click(function() {
		console.log($(this).attr());
				
				
			});
	
	

	$(window)
			.scroll(
					function() {
						//스크롤 따라오는 좌측메뉴
						if ($(window).scrollTop() + 500 < ($(document).height() - $(window).height())) {
							$('.follow').attr('style',('padding-top :'+ $(window).scrollTop()+'px; width: 300px') );
						}
						
						console.log($(window).scrollTop(),
								$(document).height(), $(window).height());
						//페이징 해서 붙이기
						if (page < 10) {
							if ($(window).scrollTop() + 800 > ($(document)
									.height() - $(window).height())) {
								
								$(".appendd") //카루셀도..대응시켜야..하는p
										.append(
												'<div class="animate-bos"><div class="trainers-entry"><div class="trainer-img" style="background-image: url('
														+ images[(page-1)]
														+ '); height:600px"></div><div class="desc"><h3>'
														+ page
														+ '번 게시물 아이디 들어갈곳</h3><span>'
														+ page++
														+ '번 내용 </br>들어갈 곳</span></div></div></div></div>');
							}

						} else if (page == 10) { // 로딩이 끝났을때, 실제 DB연동에서는 page == images.size()-1
							$(".appendd")
									.append(
											'<div class="trainers-entry"><h2>　</h2><h2>페이지의 끝입니다</h2></div></div>');
							page++

						}

					});
	});
</script>
</html>

