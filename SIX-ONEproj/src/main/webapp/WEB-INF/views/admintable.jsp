<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>회원 관리</title>

    <!-- Bootstrap -->
    <link href="cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
    <link href='<c:url value="/resources/vendors/bootstrap/bootstrap.min.css"/>' rel='stylesheet' />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- NProgress -->
    <link href='<c:url value="/resources/vendors/nprogress/nprogress.css"/>' rel='stylesheet' />
    <!-- iCheck -->
    <link href='<c:url value="/resources/vendors/iCheck/flat/green.css"/>' rel='stylesheet' />
    <!-- Datatables -->
    <link href='<c:url value="/resources/vendors/datatables/netbs/dataTables.bootstrap.min.css"/>' rel='stylesheet' />
    <link href='<c:url value="/resources/vendors/datatables/net.button/buttons.bootstrap.min.css"/>' rel='stylesheet' />
    <link href='<c:url value="/resources/vendors/datatables/net.fixed/fixedHeader.bootstrap.min.css"/>' rel='stylesheet' />
    <link href='<c:url value="/resources/vendors/datatables/net.response/responsive.bootstrap.min.css"/>' rel='stylesheet' />
    <link href='<c:url value="/resources/vendors/datatables/net.scroller/scroller.bootstrap.min.css"/>' rel='stylesheet' />
    
    <!-- Custom Theme Style -->
    <link href='<c:url value="/resources/build/css/custom.min.css"/>' rel='stylesheet' />
<style>
    tr.aa:hover {
	text-decoration: underline;
	font-weight: bold;
	font-style: normal;
	cursor : pointer;
}
</style>
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0; ">
            <a id="menu_toggle" ><i class="fa fa-bars"></i></a>
              <a href='<c:url value="/admin.do"/>' class="site_title"><span>SIX-ONE 관리소</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
                <img src='<c:url value="/resources/images/관리자.png"/>' alt="..." class="img-circle profile_img">
              </div>
              <div class="profile_info">
                <span>어서오세요 관리자님</span>
                <h2>일하자</h2>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3>항목</h3>
                <ul class="nav side-menu">
                  <li><a href='<c:url value="/admin.do"/>'><i class="fa fa-home"></i> 관리 메인 </a></li>
                  <li><a href='<c:url value="/table.do"/>'><i class="fa fa-table"></i>회원정보</a></li>
                  <li><a href='<c:url value="/icon.do"/>'><i class="fa fa-desktop"></i> UI 아이콘</a></li>
                </ul>
              </div>
            </div>
            <!-- /sidebar menu -->

            
          </div>
        </div>
        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>회원정보 리스트</h3>
              </div>

              <div class="title_right">
               
              </div>
            </div>

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 ">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>회원테이블</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item" href="#">Settings 1</a>
                            <a class="dropdown-item" href="#">Settings 2</a>
                          </div>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                      <div class="row">
                          <div class="col-sm-12">
                            <div class="card-box table-responsive">
                    <table id="datatable" class="table table-striped table-bordered" style="width:100%">
                      <thead>
                        <tr>
                          <th>ID</th>
                          <th>이름</th>
                          <th>성별</th>
                          <th>가입일</th>
                        </tr>
                      </thead>

                      <tbody>
                      <c:if test="${empty list}" var="isEmpty">
                            <tr>
                               <td colspan="6">등록된 게시물이 없습니다.</td>
                            </tr>
                      </c:if>
                      <c:if test="${not isEmpty}">
                      	<c:forEach items="${list}" var="item" varStatus="loop">
		                    <tr class="aa" onclick="showdetail('${item.id}');">
		                       <td><i class="fa fa-user">&nbsp;&nbsp;</i>${item.id}</td>
		                       <td>${item.name}</td>
		                       <c:if test="${item.gender eq '남'}">
		                       <td><i class="fa fa-male">&nbsp;&nbsp;남</i></td>
		                       </c:if>
		                       <c:if test="${item.gender eq '여'}">
		                       <td><i class="fa fa-female">&nbsp;&nbsp;여</i></td>
		                       </c:if>
		                       <td><i class="fa fa-calculator">&nbsp;&nbsp;</i>${item.create_at}</td>
		                    </tr>
	                     </c:forEach>
                       </c:if>
                        
                      </tbody>
                    </table>
                  </div>
                  </div>
              </div>
            </div>
                </div>
              </div>

              
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->


		<!-- 선택할 운동 추가하는 모달 -->
		<div class="modal fade" tabindex="-1" role="dialog" id="ShowdetailModal">
			<div class="modal-dialog modal-lg" role="document" style="width: 70%; min-height:380px;">
				<div class="modal-content">
					<div class="modal-header">
					<h4 class="exemodal-title" id="mainname">길동</h4><h4>님의 정보</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="form-horizontal">
							<div class="col-md-3">
							<img id="myprofile" class=img-circle
								style="margin: 0 auto; height: 150px; width: 150px; margin-top: 50px; margin-bottom: 10px;"
								src="#" alt="..."
								onerror="this.src='resources/images/profile.jpg'"
								data-toggle="modal" data-target="#ProfileModal">
						</div><!-- col-md-9 -->
							
							<div class="col-md-9">
							<div class="form-group">
								<label class="col-sm-5 control-label" for="exe-name"><h4>ID</h4></label>
								<label class="col-sm-7 control-label" for="exe-name"><h4 id="id">kilddong</h4></label>
							</div>
							<div class="form-group">
								<label class="col-sm-5 control-label" for="exe-part"><h4>비밀번호</h4></label>
								<label class="col-sm-7 control-label" for="exe-name"><h4>******</h4></label>
							</div>

							<div class="form-group">
								<label class="col-sm-5 control-label" for="exe-part"><h4>이름</h4></label>
								<label class="col-sm-7 control-label" for="exe-name"><h4 id="name">김길동</h4></label>
							</div>
							<div class="form-group">
								<label class="col-sm-5 control-label" for="exe-part"><h4>성별</h4></label>
								<label class="col-sm-7 control-label" for="exe-name"><h4 id="gender">남</h4></label>
							</div>
							<div class="form-group">
								<label class="col-sm-5 control-label" for="exe-part"><h4>가입일</h4></label>
								<label class="col-sm-7 control-label" for="exe-name"><h4 id="create_at">2020-06-07</h4></label>
							</div>
							<div class="form-group">
								<label class="col-sm-5 control-label" for="exe-part"><h4>작성한 타임라인</h4></label>
								<label class="col-sm-7 control-label" for="exe-part"><h4 id="time">5개</h4></label>
							</div>
							<div class="form-group">
								<label class="col-sm-5 control-label" for="exe-part"><h4>작성한 댓글</h4></label>
								<label class="col-sm-7 control-label" for="exe-part"><h4 id="comment">5개</h4></label>
							</div>
							<div class="form-group">
								<label class="col-sm-5 control-label" for="exe-part"><h4>작성한 루틴</h4></label>
								<label class="col-sm-7 control-label" for="exe-part"><h4 id="routine">5개</h4></label>
							</div>
						</div>
						</div><!-- col-md-9 -->
						
						
						<!-- 모달 푸터
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-danger" id="delete-exe">삭제</button>
							<button type="button" class="btn btn-primary" id="save-exe">저장</button>
						</div>
						 -->
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->




        <!-- footer content -->
        <footer>
          <div class="pull-right">
            Gentelella - Bootstrap Admin Template by <a href="https://colorlib.com">Colorlib</a>
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      

    <!-- jQuery -->
    <script src='<c:url value="/resources/vendors/jquery/jquery.min.js"/>'></script>
    <!-- Bootstrap -->
    <script src='<c:url value="/resources/vendors/bootstrap/bootstrap.bundle.min.js"/>'></script>
    <!-- FastClick -->
    <script src='<c:url value="/resources/vendors/fastclick/fastclick.js"/>'></script>
    <!-- NProgress -->
    <script src='<c:url value="/resources/vendors/nprogress/nprogress.js"/>'></script>
    <!-- iCheck -->
    <script src='<c:url value="/resources/vendors/iCheck/icheck.min.js"/>'></script>
    <!-- Datatables -->
    
    <script src='<c:url value="/resources/vendors/datatables/jquery.dataTables.min.js"/>'></script>
    <script src='<c:url value="/resources/vendors/datatables/netbs/dataTables.bootstrap.min.js"/>'></script>
    <script src='<c:url value="/resources/vendors/datatables/net.button/dataTables.buttons.min.js"/>'></script>
    <script src='<c:url value="/resources/vendors/datatables/net.button/buttons.bootstrap.min.js"/>'></script>
    <script src='<c:url value="/resources/vendors/datatables/net.button/buttons.flash.min.js"/>'></script>
    <script src='<c:url value="/resources/vendors/datatables/net.button/buttons.html5.min.js"/>'></script>
    <script src='<c:url value="/resources/vendors/datatables/net.button/buttons.print.min.js"/>'></script>
    <script src='<c:url value="/resources/vendors/datatables/net.fixed/dataTables.fixedHeader.min.js"/>'></script>
    <script src='<c:url value="/resources/vendors/datatables/net.keytable/dataTables.keyTable.min.js"/>'></script>
    <script src='<c:url value="/resources/vendors/datatables/net.response/dataTables.responsive.min.js"/>'></script>
    <script src='<c:url value="/resources/vendors/datatables/net.response/responsive.bootstrap.js"/>'></script>
    <script src='<c:url value="/resources/vendors/datatables/net.scroller/dataTables.scroller.min.js"/>'></script>
    <script src='<c:url value="/resources/vendors/datatables/jszip/jszip.min.js"/>'></script>
    <script src='<c:url value="/resources/vendors/datatables/pdfmake/pdfmake.min.js"/>'></script>
    <script src='<c:url value="/resources/vendors/datatables/pdfmake/vfs_fonts.js"/>'></script>

    <!-- Custom Theme Scripts -->
    <script src='<c:url value="/resources/build/js/custom.min.js"/>'></script>
    <script>
   
    function showdetail(id){
    	
    	$.ajax({//회원 상세정보 받아오기
		      url:"<c:url value='/Ajax/profile.do'/>",
		      dataType:'json',
		      data:{id:id},
		      success:function(data){
		    	  successOneAjax(data,'list');
		    	  $('#ShowdetailModal').modal('show'); //회원정보 모달 띄우기
		      },
		      error:function(request,error){
		         console.log('상태코드:',request.status);
		         console.log('서버로부터 받은 HTML데이타:',request.responseText);
		         console.log('에러:',error);
		      }
		   });
    	//$('#ShowdetailModal').modal('show'); //회원정보 모달 띄우기
    	
    }
    
    var successOneAjax = function(data){
	      $.each(data,function(index,record){
	    	  document.getElementById("id").innerText = record['id'];
	    	  document.getElementById("name").innerText = record['name'];
	    	  document.getElementById("mainname").innerText = record['name'];
	    	  var profile = "resources/Profile/";
		    	  profile += record['profile'];
	    	  document.getElementById("myprofile").src = profile;
	    	  document.getElementById("time").innerText = record['timelinecount'];
	    	  document.getElementById("routine").innerText = record['roucount'];
	    	  document.getElementById("create_at").innerText = record['create_at'];
	    	  document.getElementById("comment").innerText = record['comment'];
	    	  document.getElementById("gender").innerText = record['gender'];
	       
	     });
    }
	     
    </script>

  </body>
</html>