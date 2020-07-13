<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>

@media screen and (max-width: 1000px) {
	#proteinMain{
		width:800px;
	
	}
}

@media screen and (max-width: 768px) {
	#proteinMain{
		width:500px;
	
	}
}
      






</style>	

	<aside id="colorlib-hero">
		<div class="flexslider col-md-12">
			<ul class="slides">
		   	<li style="background-image: url(resources/images/img_bg_2.jpg);">
		   		<div class="overlay"></div>
		   		<div class="container-fluid">
		   			<div class="row">
			   			<div class="col-md-6 col-sm-12 col-md-offset-3 slider-text">
			   				<div class="slider-text-inner text-center">
			   					<h1>보충제</h1>
								<h2><span><a href="<c:url value='/'/>">Home</a> | <a href="#Exercise" class="scroll" style="color:white">바로가기</a></span></h2>
			   				</div>
			   			</div>
			   		</div>
		   		</div>
		   	</li>
		  	</ul>
	  	</div>
	</aside>
	<!-- 나중에 크롤링 같은거 배우면 여기에 적용하자 -->
	
	<div class="colorlib-blog">
			<div class="container">
				<div class="row" style="margin-bottom: 100px">
					<div class="col-md-12 text-center">
						<img id="proteinMain" src="<c:url value="/resources/images/protein_word_cloud.png"/>"style="margin-bottom: 30px;" alt=""/>
						<h2 style="font-size:3em; font-weight: bold">"운동은 끝나고 먹는거 까지가 운동이다"</h2>
						<p style="font-size:2em">용도에 맞는 보충제를 선택하세요
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-12 text-center" style="margin-bottom: 30px">
						<h2><b style="color: #f50057; font-size: 65px;">단백질</b>보충제/쉐이크</h2>
						<h3>근육성장의 3요소중 근육을 보강을 가져다 주는 역활을 하는 보충제!</h3>
					</div>
					<!-- 단백질 쉐이크 -->
					
					<div class="col-md-4 animate-box">
						<article class="article-entry">
							<a href="${list[0].proteinUrl }" class="blog-img" target="_blank" style="background-image:url('${list[0].proteinImage}');">
								<img src="<c:url value='/resources/images/btn_rank1.png'/>"/>
							</a>
							<div class="desc">
								<p class="admin"><span>${list[0].proteinName }</span>
								<h2><a href="blog.html">￦${list[0].proteinPrice }</a></h2>
								<p>바로가기</p>
							</div>
						</article>
					</div>
					<div class="col-md-4 animate-box">
						<article class="article-entry">
							<a href="${list[1].proteinUrl }" class="blog-img" target="_blank" style="background-image:url('${list[1].proteinImage}');">
								<img src="<c:url value='/resources/images/btn_rank2.png'/>"/>
							</a>
							<div class="desc">
								<p class="admin"><span>${list[1].proteinName }</span>
								<h2><a href="blog.html">￦${list[1].proteinPrice }</a></h2>
								<p>바로가기</p>
							</div>
						</article>
					</div>
					<div class="col-md-4 animate-box">
						<article class="article-entry">
							<a href="${list[2].proteinUrl }" class="blog-img" target="_blank" style="background-image:url('${list[2].proteinImage}');">
								<img src="<c:url value='/resources/images/btn_rank3.png'/>"/>
							</a>
							<div class="desc">
								<p class="admin"><span>${list[2].proteinName }</span>
								<h2><a href="blog.html">￦${list[2].proteinPrice }</a></h2>
								<p>바로가기</p>
							</div>
						</article>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4 animate-box">
						<article class="article-entry">
							<a href="${list[3].proteinUrl }" class="blog-img" target="_blank" style="background-image:url('${list[3].proteinImage}');">
								<img src="<c:url value='/resources/images/btn_rank4.png'/>"/>
							</a>
							<div class="desc">
								<p class="admin"><span>${list[3].proteinName }</span>
								<h2><a href="blog.html">￦${list[3].proteinPrice }</a></h2>
								<p>바로가기</p>
							</div>
						</article>
					</div>
					<div class="col-md-4 animate-box">
						<article class="article-entry">
							<a href="${list[4].proteinUrl }" class="blog-img" target="_blank" style="background-image:url('${list[4].proteinImage}');">
								<img src="<c:url value='/resources/images/btn_rank5.png'/>"/>
							</a>
							<div class="desc">
								<p class="admin"><span>${list[4].proteinName }</span>
								<h2><a href="blog.html">￦${list[4].proteinPrice }</a></h2>
								<p>바로가기</p>
							</div>
						</article>
					</div>
					<div class="col-md-4 animate-box">
						<article class="article-entry">
							<a href="${list[5].proteinUrl }" class="blog-img" target="_blank" style="background-image:url('${list[5].proteinImage}');">
								<img src="<c:url value='/resources/images/btn_rank6.png'/>"/>
							</a>
							<div class="desc">
								<p class="admin"><span>${list[5].proteinName }</span>
								<h2><a href="blog.html">￦${list[5].proteinPrice }</a></h2>
								<p>바로가기</p>
							</div>
						</article>
					</div>
				</div> <!-- row -->
				
				<hr>
				
				<!-- 다이어트 쉐이크 -->
				<div class="row">
					<div class="col-md-12 text-center" style="margin-bottom: 30px">
						<h2><b style="color: #f50057; font-size: 65px;">다이어트</b>보조제</h2>
						<h3>지방을 컷트해주는 효과적인 다이어트 방법!</h3>
					</div>
					
					
					<div class="col-md-4 animate-box">
						<article class="article-entry">
							<a href="${list[6].proteinUrl }" class="blog-img" target="_blank" style="background-image:url('${list[6].proteinImage}');">
								<img src="<c:url value='/resources/images/btn_rank1.png'/>"/>
							</a>
							<div class="desc">
								<p class="admin"><span>${list[6].proteinName }</span> 
								<h2><a href="blog.html">￦${list[6].proteinPrice }</a></h2>
								<p>바로가기</p>
							</div>
						</article>
					</div>
					<div class="col-md-4 animate-box">
						<article class="article-entry">
							<a href="${list[7].proteinUrl }" class="blog-img" target="_blank" style="background-image:url('${list[7].proteinImage}');">
								<img src="<c:url value='/resources/images/btn_rank2.png'/>"/>
							</a>
							<div class="desc">
								<p class="admin"><span>${list[7].proteinName }</span>
								<h2><a href="blog.html">￦${list[7].proteinPrice }</a></h2>
								<p>바로가기</p>
							</div>
						</article>
					</div>
					<div class="col-md-4 animate-box">
						<article class="article-entry">
							<a href="${list[8].proteinUrl }" class="blog-img" target="_blank" style="background-image:url('${list[8].proteinImage}');">
								<img src="<c:url value='/resources/images/btn_rank3.png'/>"/>
							</a>
							<div class="desc">
								<p class="admin"><span>${list[8].proteinName }</span> 
								<h2><a href="blog.html">￦${list[8].proteinPrice }</a></h2>
								<p>바로가기</p>
							</div>
						</article>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4 animate-box">
						<article class="article-entry">
							<a href="${list[9].proteinUrl }" class="blog-img" target="_blank" style="background-image:url('${list[9].proteinImage}');">
								<img src="<c:url value='/resources/images/btn_rank4.png'/>"/>
							</a>
							<div class="desc">
								<p class="admin"><span>${list[9].proteinName }</span> 
								<h2><a href="blog.html">￦${list[9].proteinPrice }</a></h2>
								<p>바로가기</p>
							</div>
						</article>
					</div>
					<div class="col-md-4 animate-box">
						<article class="article-entry">
							<a href="${list[10].proteinUrl }" class="blog-img" target="_blank" style="background-image:url('${list[10].proteinImage}');">
								<img src="<c:url value='/resources/images/btn_rank5.png'/>"/>
							</a>
							<div class="desc">
								<p class="admin"><span>${list[10].proteinName }</span> 
								<h2><a href="blog.html">￦${list[10].proteinPrice }</a></h2>
								<p>바로가기</p>
							</div>
						</article>
					</div>
					<div class="col-md-4 animate-box">
						<article class="article-entry">
							<a href="${list[11].proteinUrl }" class="blog-img" target="_blank" style="background-image:url('${list[11].proteinImage}');">
								<img src="<c:url value='/resources/images/btn_rank6.png'/>"/>
							</a>
							<div class="desc">
								<p class="admin"><span>${list[11].proteinName }</span>
								<h2><a href="blog.html">￦${list[11].proteinPrice }</a></h2>
								<p>바로가기</p>
							</div>
						</article>
					</div>
				</div> <!-- row -->
				
				
				
				
				
				
				
				
				
			</div><!-- container -->
		</div>

	
		
	
			
			
</html>

