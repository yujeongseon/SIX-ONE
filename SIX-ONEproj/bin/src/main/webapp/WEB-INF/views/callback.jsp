<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<html>
  <head>
    <title>네이버로그인</title>
  </head>
  <body>
  <script type="text/javascript">
        var naver_id_login = new naver_id_login("Wf45wK7ntc_fO1VJ3o1_", "http://192.168.0.87:8080/sixone/callback.do"); // 역시 마찬가지로 'localhost'가 포함된 CallBack URL
        
        // 접근 토큰 값 출력
        alert(naver_id_login.oauthParams.access_token);
        
        // 네이버 사용자 프로필 조회
        naver_id_login.get_naver_userprofile("naverSignInCallback()");
        
        // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
        function naverSignInCallback() {
            alert(naver_id_login.getProfileData('email'));
            alert(naver_id_login.getProfileData('nickname'));
            alert(naver_id_login.getProfileData('age'));
            alert(naver_id_login.getProfileData('client_id'));
        }
    </script>
  
  </body>
</html>