<%@page import="java.io.IOException"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%!String json;
	ArrayList<String> addr = new ArrayList<String>();
	ArrayList<String> nameArr = new ArrayList<String>();
	ArrayList<String> latArr = new ArrayList<String>();
	ArrayList<String> lngArr = new ArrayList<String>();
	ArrayList<String> jegoArr = new ArrayList<String>();
	String protocol;
	String plustext;
	String loc;
	String name;
	String lat;
	String lng;
	String jego;
	String addrFirst;
	String geolatselect;
	String addAddr;
	String address;
	void mask(String a) throws Exception {
		if (a.contains("수원시") && !a.contains("경기도")) {
			a = a.replace("수원시", "경기도 수원시");
		} else if (a.contains("서울시")) {
			a = a.replace("서울시", "서울특별시");
		} else if (a.contains("군포시") && !a.contains("경기도")) {
			a = a.replace("군포시", "경기도 군포시");
		} else if (a.contains("인천시")) {
			a = a.replace("인천시", "인천광역시");
		} else if (a.contains("부천시") && !a.contains("경기도")) {
			a = a.replace("부천시", "경기도 부천시");
		}

		addr = new ArrayList<String>();
		nameArr = new ArrayList<String>();
		latArr = new ArrayList<String>();
		lngArr = new ArrayList<String>();
		jegoArr = new ArrayList<String>();

		String encodeResult = URLEncoder.encode(a, "UTF-8");

		String addrFirst = "https://8oi9s0nnth.apigw.ntruss.com/corona19-masks/v1/";
		String geolatselect = "storesByAddr/json?address=";
		String address = addrFirst + geolatselect + encodeResult;

		BufferedReader br;
		URL url;
		HttpURLConnection conn;
		protocol = "GET";
		plustext = "";
		loc = "\"addr\"";
		name = "\"name\"";
		lat = "\"lat\"";
		lng = "\"lng\"";
		jego = "\"remain_stat\"";

		url = new URL(address);
		conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod(protocol);
		br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		int i = 0;
		json = "";
		while ((plustext = br.readLine()) != null) { //한줄에 하나씩 긁어옴
			if (plustext.contains(loc)) {
				addr.add((plustext.substring(plustext.indexOf(loc) + 9, plustext.length() - 2)));
			} else if (plustext.contains(name)) {
				nameArr.add((plustext.substring(plustext.indexOf(name) + 9, plustext.length() - 2)));
			} else if (plustext.contains(lat)) {
				latArr.add((plustext.substring(plustext.indexOf(lat) + 7, plustext.length() - 1)));
			} else if (plustext.contains(lng)) {
				lngArr.add((plustext.substring(plustext.indexOf(lng) + 7, plustext.length() - 1)));
			} else if (plustext.contains(jego)) {
				//100개 이상: 'plenty'100개미만(노랑색): 'some  30개 미만(빨강색): 
				//'few'1개 이하(회색): 'empty'  판매중지: 'break']
				if (plustext.contains("empty"))
					jegoArr.add("0");
				else if (plustext.contains("few"))
					jegoArr.add("1");
				else if (plustext.contains("some"))
					jegoArr.add("2");
				else if (plustext.contains("plenty"))
					jegoArr.add("3");
				else if (plustext.contains("break"))
					jegoArr.add("9");
			}
			json += (plustext);
		}
		System.out.println(addr.toString());
		System.out.println(nameArr.toString());
		System.out.println(latArr.toString());
		System.out.println(lngArr.toString());
		System.out.println(jegoArr.toString());
		System.out.println(a + "의 결과  :  " + addr.size() + " 건");
	}

	/*	private int lat_return(index){
			return Integer.parseInt(latArr.get(index));
		}
		private int lng_return(index){
			return Integer.parseInt(lngArr.get(index));
		}*/%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맵</title>
	

<style>
* {
	border: 0;
	padding: 0;
	 margin : 0;	
}
</style>
</head>
<body>
<form action="http://115.91.88.230:8080/team/Map.jsp"
		accept-charset="utf-8" name="person_info" method="get">
		<input
			style="width: 80%; height: 50px; border: 1px black solid; font-size: 2.0em"
			type="text" name="id" /> <input style="width: 10%; height: 50px; border: 1px black solid;" type="submit" value="검색"
			onclick="reload()" />
	</form>
<div id="map" style="width: 1700px; height:2500px;"></div>


<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=baec786c99350c041ef35a31dcf9afcf"></script>
<script>
function isMobile(){

	var UserAgent = navigator.userAgent;



	if (UserAgent.match(/iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i) != null || UserAgent.match(/LG|SAMSUNG|Samsung/) != null)

	{

		return true;

	}else{

		return false;

	}

}
	
<%String location = request.getParameter("id");

			if (location == null) {
				location = "인천광역시 계양구";
			}

			mask(location);
			String jsonb = json.contains("addr") ? "있음" : "없음";
			int jsonint = nameArr.size();

			out.print("console.log(\"" + jsonb + "\");");
			out.print("console.log(\"" + jsonint + "\");");
			//out.println("window.location.replace('http://localhost:8080/JSPProj123/Map.jsp');");
			request.getRequestDispatcher("Map.jsp");%>
	div = document.getElementsByTagName('div')[0];
	var jegoArr =
<%=jegoArr%>
	var container = document.getElementById('map');
	


	console.log(
<%out.print(nameArr.size());%>
	);
<%if (latArr.size() == 0)
				out.print("alert('주소를 제대로 입력해 주십시오    예)ㅇㅇㅇ시 ㅇㅇㅇ구');");%>
	var options = {
		center : new kakao.maps.LatLng(
<%if (latArr.size() != 0) {
				out.print(latArr.get(0));
			} else {
				out.print(37.4786781);

			}%>
	,
<%if (lngArr.size() != 0) {
				out.print(lngArr.get(0));
			} else {
				out.print(126.8781143);
			}%>
	),
		level : 2
	};

	var map = new kakao.maps.Map(container, options);
	var shopname = [];
	var positions = [
<%int cnt = 0;
			for (String name_ : nameArr) {

				out.print("{ title: '" + nameArr.get(cnt) + "' , " + "latlng: new kakao.maps.LatLng(" + latArr.get(cnt)
						+ ", " + lngArr.get(cnt) + ") }, ");
				cnt++;
			}%>
	/*
	
	  {
	title: '카카오', 
	latlng: new kakao.maps.LatLng(33.450705, 126.570677)
	},
	 */

	];
	var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

	for (var i = 0; i < positions.length; i++) {
		var jeggo; // 마스크 재고
		
		// 마커 이미지의 이미지 크기 입니다
	if(!isMobile()){
		if (jegoArr[i] == 0) {
			imageSize = new kakao.maps.Size(35, 35);
			jeggo = "마스크 판매 완료";
		} else if (jegoArr[i] == 1) {
			imageSize = new kakao.maps.Size(35, 35);
			jeggo = "마스크 약간 남아있음";
		} else if (jegoArr[i] == 2) {
			imageSize = new kakao.maps.Size(35, 35);
			jeggo = "마스크 재고 충분함(판매시간 전일 가능성 있음)";
		} else if (jegoArr[i] == 4) {
			imageSize = new kakao.maps.Size(35, 35);
			jeggo = "마스크 판매 중단";
		}}
		else{
			if (jegoArr[i] == 0) {
				imageSize = new kakao.maps.Size(180, 180);
				jeggo = "마스크 판매 완료";
			} else if (jegoArr[i] == 1) {
				imageSize = new kakao.maps.Size(180, 180);
				jeggo = "소량의 재고가 있음";
			} else if (jegoArr[i] == 2) {
				imageSize = new kakao.maps.Size(180, 180);
				jeggo = "마스크 재고 충분함(판매시간 전일 가능성 있음)";
			} else if (jegoArr[i] == 4) {
				imageSize = new kakao.maps.Size(180, 180);
				jeggo = "마스크 판매 중단";
			}}

		// 마커 이미지를 생성합니다    
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			map : map, // 마커를 표시할 지도
			position : positions[i].latlng, // 마커를 표시할 위치
			title : positions[i].title + '\n' + jeggo, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			image : markerImage
		// 마커 이미지 
		});
		shopname[i] = positions[i].title;
		var infowindow = new kakao.maps.InfoWindow({
			content : '<div style="padding:10px;text-align:center;text-">'
					+ positions[i].title +'</br>'+ jeggo

		/* "　" + positions[i].title*/// 인포윈도우에 표시할 내용
		});

		kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map,
				marker, infowindow));
		kakao.maps.event.addListener(marker, 'mouseout',
				makeOutListener(infowindow));
		
	
		
		
		kakao.maps.event.addListener(marker, 'click', function() { // 클릭하면 그 약국으로 넘어가는거
		
			var href = "https://map.kakao.com/?q="+  shopname[i] ;
		   
		    
			location.href=href;  
		});

	}
	function makeOverListener(map, marker, infowindow) {
		return function() {
			infowindow.open(map, marker);
		};
		
	}
	
	console.log(shopname);

	// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(infowindow) {
		return function() {
			infowindow.close();
		};
	}
/*
 $(document).ready(function() {
  $('.testbt1').click(function(){
    $('#testEle').animate({opacity:"0"}, 1000);
  }); 
 
 */
	kakao.maps.event
			.addListener(
					map,
					'dragend',
					function() {
						//var map = new kakao.maps.Map(container, options); //새로 얻어옴
						// 지도 중심좌표를 얻어옵니다 
						var latlng = map.getCenter();
						var geoLat = document.getElementById('geoLat');
						geoLat.innerHTML = latlng.getLat();
						var geoLng = document.getElementById('geoLng');
						geoLng.innerHTML = latlng.getLng();

						/// 출력메세지
<%//= request.getAttribute("geoLat")
			//json?lat=37.5240744710099&lng=126.72352045594&m=2000
			String geolat = getInitParameter("geoLat");
			out.print("console.log(" + geolat + ");");
			/*= req.getAttribute("geoLat").toString()*/;
			String geolng = getInitParameter("geolng");
			out.print("console.log(" + geolng + ");");
			String map = getInitParameter("map.getCenter();");
			out.print("console.log(" + map + ");");
			String latlng = getInitParameter("latlng");
			out.print("console.log(" + latlng + ");");

			//	out.print("console.log(\""+a+"\");" );
			String m = "";
			geolatselect = "storesByGeo/json?lat=";

			address = addrFirst + geolatselect + addAddr + geolat + "&lng=" + geolng + "&m=" + m;%>
	/*
						var positions = [{ title: '성지약국' , latlng: new kakao.maps.LatLng(37.5263083, 126.7215625) }];
						//새로 받아온 JSON리스트
						for (var i = 0; i < positions.length; i++) {

							// 마커 이미지의 이미지 크기 입니다
							if (jegoArr[i] == 0) {
								imageSrc = "Images/red.png";
								imageSize = new kakao.maps.Size(24, 35);
							} else if (jegoArr[i] == 1) {
								imageSrc = "Images/orange.png";
								imageSize = new kakao.maps.Size(24, 35);
							} else if (jegoArr[i] == 2) {
								imageSrc = "Images/green.png";
								imageSize = new kakao.maps.Size(24, 35);
							} else if (jegoArr[i] == 4) {
								imageSrc = "Images/green.png";
								imageSize = new kakao.maps.Size(24, 35);
							}

							// 마커 이미지를 생성합니다    
							var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

							// 마커를 생성합니다
							var marker = new kakao.maps.Marker({
								map : map, // 마커를 표시할 지도
								position : positions[i].latlng, // 마커를 표시할 위치
								title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
								image : markerImage
							// 마커 이미지 
							});

						}
						 */

						/*  var message = '변경된 지도 중심좌표는 ' + latlng.get() + ' 이고, ';
						 message += '경도는 ' + latlng.getLng() + ' 입니다';*/

						//System.out.println(geolat);
						console.log(latlng.getLat());
						console.log(latlng.getLng());
					});
	
	

	function reload() {
		var jeggo; // 마스크 재고
		console.log("다시불러ㅏ옴");
		positions = [ {
			title : '성지약국',
			latlng : new kakao.maps.LatLng(37.5263083, 126.7215625)
		} ];
		for (var i = 0; i < positions.length; i++) {

			// 마커 이미지의 이미지 크기 입니다
			if (jegoArr[i] == 0) {
				imageSrc = "Images/red.png";
				imageSize = new kakao.maps.Size(35, 35);
				jeggo = "마스크 판매 완료";
			} else if (jegoArr[i] == 1) {
				imageSrc = "Images/orange.png";
				imageSize = new kakao.maps.Size(35, 35);
				jeggo = "마스크 약간 남아있음";
			} else if (jegoArr[i] == 2) {
				imageSrc = "Images/green.png";
				imageSize = new kakao.maps.Size(35, 35);
				jeggo = "마스크 재고 충분함(판매시간 전일 가능성 있음)";
			} else if (jegoArr[i] == 4) {
				imageSrc = "Images/red.png";
				imageSize = new kakao.maps.Size(35, 35);
				jeggo = "마스크 판매 중단";
			}
			// 마커 이미지를 생성합니다    
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				map : map, // 마커를 표시할 지도
				position : positions[i].latlng, // 마커를 표시할 위치
				title : positions[i].title + "\n" + jeggo, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				image : markerImage
			// 마커 이미지 
			});

		}

	}
	console.log("123");
	//console.log(positions[i].title);
	
</script>

	
	<span id="geoLat"></span>
	<span id="geoLng"></span>
	<span id = "width"></span>
	<span id = "height"></span>
	
	

	
	<h2>사용방법</h2>
	<h3>사시는 곳의 시와 구, 동을 입력하시면 약국 리스트가 나옵니다</h3>
	<h4>마우스를 올려놓으면 약국 이름이 나옵니다</h4>
	<h4>초록색 : 재고 많음/판매전 주황색 : 재고 적음 빨간색 : 재고 소진/판매중단</h4>


</body>
<script>	
var width = document.getElementById('width');
width.innerHTML = screen.width;
var height = document.getElementById('height');
height.innerHTML = screen.height;
div.style.width =  window.innerWidth*0.99 + "px";
div.style.height = window.innerHeight-300 + "px";
	</script>

</html>