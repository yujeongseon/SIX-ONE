<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	
	

    <title>관리자 페이지</title>
    <!-- 예시
	<link href='<c:url value="/resources/calendar/core_main.css"/>' rel='stylesheet' />
	 -->
	
	
    <!-- Bootstrap -->
    <link href='<c:url value="/resources/vendors/bootstrap/bootstrap.min.css"/>' rel='stylesheet' />
    <!-- 중복되서 주석처리함
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
     -->
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- 
    <link href='<c:url value="/resources/vendors/fontawesome/font-awesome.css"/>' rel='stylesheet' />
     -->
    <!-- NProgress -->
    <link href='<c:url value="/resources/vendors/nprogress/nprogress.css"/>' rel='stylesheet' />
    <!-- iCheck -->
    <link href='<c:url value="/resources/vendors/iCheck/flat/green.css"/>' rel='stylesheet' />
    <!-- bootstrap-progressbar -->
    <link href='<c:url value="/resources/vendors/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css"/>' rel='stylesheet' />
    <!-- JQVMap -->
    <link href='<c:url value="/resources/vendors/jqvmap/jqvmap.min.css"/>' rel='stylesheet' />
    <!-- bootstrap-daterangepicker -->
    <link href='<c:url value="/resources/vendors/bootstrap-daterangepicker/daterangepicker.css"/>' rel='stylesheet' />
    
    


    <!-- Custom Theme Style -->
    <link href='<c:url value="/resources/build/css/custom.min.css"/>' rel='stylesheet' />
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
            <a id="menu_toggle" style="float:right"><i class="fa fa-bars"></i></a>
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
                  <li><a href='<c:url value="/Logout.do"/>'><i class="fa fa-power-off"></i>six-one 메인페이지로</a></li>
                </ul>
              </div>
            </div>
            <!-- /sidebar menu -->

            
          </div>
        </div>

        

        <!-- page content -->
        <div class="right_col" role="main">
          <!-- top tiles -->
          <div class="row" style="display: inline-block;" >
          <div class="tile_count">
            <div class="col-md-2 col-sm-4  tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i>전체 회원</span>
              <div class="count">${memberhap}명</div>
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>4% </i>지난주 대비 증가</span>
            </div>
            <div class="col-md-2 col-sm-4  tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i>남성회원 비율</span>
              <div class="count">${man}명</div>
              <span class="count_bottom"><i class="green">${manpersent}%</i> 차지</span>
            </div>
            <div class="col-md-2 col-sm-4  tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i>여성회원 비율</span>
              <div class="count">${woman}명</div>
              <span class="count_bottom"><i class="red">${womanpersent}%</i> 차지 </span>
            </div>
            <div class="col-md-2 col-sm-4  tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i>전체 타임라인</span>
              <div class="count">${timeline}</div>
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>17%</i>증가</span>
            </div>
            <div class="col-md-2 col-sm-4  tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i>전체 루틴</span>
              <div class="count">${routinehap}</div>
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>11%</i>증가</span>
            </div>
            <div class="col-md-2 col-sm-4  tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i>전체 게시글</span>
              <div class="count">${totalhap}</div>
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>15% </i>지난주 대비 증가</span>
            </div>
          </div>
        </div>
     
          <!-- /top tiles -->

         
          <br/>
          <div class="row">
            <div class="col-md-6 col-sm-6 ">
              <div class="x_panel">
                <div class="x_title">
                  <h2 style="font-size:25px; font-weight: bold;"><i class="fa fa-line-chart">&nbsp;&nbsp;</i>가입자 증가 추세</h2>
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
                  <!-- 여기다 그래프 -->
                  <div class="container">
		                <!-- 여기가 그래프 들어갈곳 -->
		                <canvas id="linechart"  style="width:100%;height:280px;"></canvas>
		                <!-- 여기가 그래프 들어갈곳 -->
	                 </div>
                  <!-- 여기다 그래프 -->
                </div>
              </div>
            </div>

            <div class="col-md-6 col-sm-6">
              <div class="x_panel">
                <div class="x_title">
                  <h2 style="font-size:25px; font-weight: bold;"><i class="fa fa-line-chart">&nbsp;&nbsp;</i>게시글 증가 추세</h2>
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
                  <!-- 여기다 그래프 뿌려주기 -->
                  <div class="container">
		                <!-- 여기가 그래프 들어갈곳 -->
		                <canvas id="linechart2" style="width:100%;height:280px;"></canvas>
		                <!-- 여기가 그래프 들어갈곳 -->
	                 </div>
                  <!-- 여기다 그래프 뿌려주기 -->
                </div>
              </div>
            </div>
          </div>
          
          
          <br />

          <div class="row">
            <div class="col-md-6 col-sm-6 ">
              <div class="x_panel">
                <div class="x_title">
                  <h2 style="font-size:25px; font-weight: bold;"><i class="fa fa-align-left">&nbsp;&nbsp;</i>루틴에 가장 많이 포함된 운동</h2>
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
                  <div class="widget_summary">
                    <div class="w_left w_25">
                      <span style="font-size:20px;">${exename0}</span>
                    </div>
                    <div class="w_center w_55">
                      <div class="progress">
                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: ${exeper0}%;">
                          <span class="sr-only">60% Complete</span>
                        </div>
                      </div>
                    </div>
                    <div class="w_right w_20">
                      <span>${exeper0}%&nbsp;&nbsp;&nbsp;${execount0}회</span>
                    </div>
                    <div class="clearfix"></div>
                  </div>
                  
					<br/>
					
                  <div class="widget_summary">
                    <div class="w_left w_25">
                      <span style="font-size:20px;">${exename2}</span>
                    </div>
                    <div class="w_center w_55">
                      <div class="progress">
                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: ${exeper2}%;">
                          <span class="sr-only">60% Complete</span>
                        </div>
                      </div>
                    </div>
                    <div class="w_right w_20">
                      <span>${exeper2}%&nbsp;&nbsp;&nbsp;${execount2}회</span>
                    </div>
                    <div class="clearfix"></div>
                  </div>
                  
                  <br/>
                  
                  <div class="widget_summary">
                    <div class="w_left w_25">
                      <span style="font-size:20px;">${exename4}</span>
                    </div>
                    <div class="w_center w_55">
                      <div class="progress">
                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: ${exeper4}%;">
                          <span class="sr-only">60% Complete</span>
                        </div>
                      </div>
                    </div>
                    <div class="w_right w_20">
                      <span>${exeper4}%&nbsp;&nbsp;&nbsp;${execount4}회</span>
                    </div>
                    <div class="clearfix"></div>
                  </div>
                  
                  <br>
                  
                  <div class="widget_summary">
                    <div class="w_left w_25">
                      <span style="font-size:20px;">${exename6}</span>
                    </div>
                    <div class="w_center w_55">
                      <div class="progress">
                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: ${exeper6}%;">
                          <span class="sr-only">60% Complete</span>
                        </div>
                      </div>
                    </div>
                    <div class="w_right w_20">
                      <span>${exeper6}%&nbsp;&nbsp;&nbsp;${execount6}회</span>
                    </div>
                    <div class="clearfix"></div>
                  </div>
                  
                  <br>
                  
                  <div class="widget_summary">
                    <div class="w_left w_25">
                      <span style="font-size:20px;">${exename8}</span>
                    </div>
                    <div class="w_center w_55">
                      <div class="progress">
                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: ${exeper8}%;">
                          <span class="sr-only">60% Complete</span>
                        </div>
                      </div>
                    </div>
                    <div class="w_right w_20">
                      <span>${exeper8}%&nbsp;&nbsp;&nbsp;${execount8}회</span>
                    </div>
                    <div class="clearfix"></div>
                  </div>

                </div>
              </div>
            </div>

            <div class="col-md-6 col-sm-6 ">
              <div class="x_panel">
                <div class="x_title">
                  <h2 style="font-size:25px; font-weight: bold;"><i class="fa fa-pie-chart">&nbsp;&nbsp;</i>회원가입 경로</h2>
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
                  <table class="" style="width:100%">
                    <tr>
                      <th style="width:37%;">
                        <h4>비율</h4>
                      </th>
                      <th>
                        <div class="col-lg-7 col-md-7 col-sm-7 ">
                          <h4 class="">포털</h4>
                        </div>
                        <div class="col-lg-5 col-md-5 col-sm-5 ">
                          <h4 class="">퍼센트</h4>
                        </div>
                      </th>
                    </tr>
                    <tr>
                      <td>
                        <canvas id="portalchart"  style="width:100%;height:280px;">></canvas>
                      </td>
                      <td>
                        <table class="tile_info">
                          <tr>
                            <td>
                              <h3><i class="fa fa-square" style="font-size:24px; color:green;"></i>네이버 </h3>
                            </td>
                            <td><h3>${naverper}%</h3></td>
                          </tr>
                          <tr>
                            <td>
                              <h3><i class="fa fa-square" style="font-size:24px;color:yellow;"></i>카카오</h3>
                            </td>
                            <td><h3>${kakaoper}%</h3></td>
                          </tr>
                          <tr>
                            <td>
                              <h3><i class="fa fa-square" style="font-size:24px;color:aero;"></i>six-one</h3>
                            </td>
                            <td><h3>${sixoneper}%</h3></td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                </div>
              </div>
            </div>

          </div>
          
			<!--  내용 더 추가할거면 이곳에 -->
			
          
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
            Gentelella - Bootstrap Admin Template by <a href="https://colorlib.com">Colorlib</a>
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      </div>
    </div>





	<!--  스크립트 예시
	<script src='<c:url value="/resources/calendar/core_main.js"/>'></script>
	 -->




    <!-- jQuery -->
    <script src='<c:url value="/resources/vendors/jquery/jquery.min.js"/>'></script>
    <!-- Bootstrap -->
    <script src='<c:url value="/resources/vendors/bootstrap/bootstrap.bundle.min.js"/>'></script>
    <!-- 
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
 	-->
    <!-- FastClick -->
    <script src='<c:url value="/resources/vendors/fastclick/fastclick.js"/>'></script>
    <!-- NProgress -->
    <script src='<c:url value="/resources/vendors/nprogress/nprogress.js"/>'></script>
    <!-- Chart.js -->
    <!-- 
    <script src='<c:url value="/resources/vendors/chart/Chart.min.js"/>'></script>
     -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
    <!-- gauge.js -->
    <script src='<c:url value="/resources/vendors/gauge/gauge.min.js"/>'></script>
    <!-- bootstrap-progressbar -->
    <script src='<c:url value="/resources/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"/>'></script>
    <!-- iCheck -->
    <script src='<c:url value="/resources/vendors/iCheck/icheck.min.js"/>'></script>
    <!-- Skycons -->
    <script src='<c:url value="/resources/vendors/skycons/skycons.js"/>'></script>
    <!-- Flot -->
    <script src='<c:url value="/resources/vendors/Flot/jquery.flot.js"/>'></script>
    <script src='<c:url value="/resources/vendors/Flot/jquery.flot.pie.js"/>'></script>
    <script src='<c:url value="/resources/vendors/Flot/jquery.flot.time.js"/>'></script>
    <script src='<c:url value="/resources/vendors/Flot/jquery.flot.stack.js"/>'></script>
    <script src='<c:url value="/resources/vendors/Flot/jquery.flot.resize.js"/>'></script>
    <!-- Flot plugins -->
    <script src='<c:url value="/resources/vendors/Flot/jquery.flot.orderBars.js"/>'></script>
    <script src='<c:url value="/resources/vendors/Flot/jquery.flot.spline.min.js"/>'></script>
    <script src='<c:url value="/resources/vendors/Flot/curvedLines.js"/>'></script>
    
    <!-- DateJS -->
    <script src='<c:url value="/resources/vendors/DateJS/date.js"/>'></script>
    <!-- JQVMap -->
    <script src='<c:url value="/resources/vendors/jqvmap/jquery.vmap.js"/>'></script>
    <script src='<c:url value="/resources/vendors/jqvmap/jquery.vmap.world.js"/>'></script>
    <script src='<c:url value="/resources/vendors/jqvmap/jquery.vmap.sampledata.js"/>'></script>
    
    <!-- bootstrap-daterangepicker -->
    <script src='<c:url value="/resources/vendors/moment/moment.min.js"/>'></script>
    <script src='<c:url value="/resources/vendors/bootstrap-daterangepicker/daterangepicker.js"/>'></script>

    <!-- Custom Theme Scripts -->
    <script src='<c:url value="/resources/build/js/custom.min.js"/>'></script>
	<script> 
	//회원가입 경로 
	var ctx2 = document.getElementById("portalchart");
	//월별 가입자 증가율
	var ctx = document.getElementById('linechart').getContext('2d');
	//월별 게시글 증가율
	var ctx3 = document.getElementById('linechart2').getContext('2d');
	
	
	var chart = new Chart(ctx, { // 챠트 종류를 선택
			type: 'line',// 챠트를 그릴 데이타
			data: { labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월'],
				datasets: [{
					label: '가입자 그래프',
					backgroundColor: 'transparent',
					borderColor: 'green',
					data: [${Jen}, ${Feb}, ${Mar}, ${Apr}, ${May}, ${Jun}, ${Jul}]
				}]
			}, // 옵션
			options: {responsive: false}
			});
	
	
			//네이버,카카오,sixone 비율
			data = { datasets: [{ backgroundColor: ['green','yellow','gray'], data: [${naver}, ${kakao}, ${sixone}] }],
			// 각 영역에 커서를 갖다대면 값을 보여줌
			labels: ['네이버','카카오','six-one'] };
			var myDoughnutChart = new Chart(ctx2, { type: 'doughnut',
				data: data,
				options: {responsive: false} }); //false 안주면 그래프가 계속 커짐

				
		var chart2 = new Chart(ctx3, { // 챠트 종류를 선택
			type: 'line',// 챠트를 그릴 데이타
			data: { labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월'],
				datasets: [{
					label: '타임라인',
					backgroundColor: 'transparent',
					borderColor: 'red',
					data: [${time1}, ${time2}, ${time3}, ${time4}, ${time5}, ${time6}, ${time7}]
				},
				{
					label: '루틴게시판',
					backgroundColor: 'transparent',
					borderColor: 'blue',
					data: [${rou1}, ${rou2}, ${rou3}, ${rou4}, ${rou5}, ${rou6}, ${rou7}]
				}
				]
			}, // 옵션
			options: {responsive: false}
			});
		
		
	
		</script>
		


  </body>
</html>
