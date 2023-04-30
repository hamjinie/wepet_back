<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>회원 로그인폼</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Header Start -->
<%@ include file="../inc/gardener/inc/header_link.jsp"%>
<!-- Header End -->

<script src="https://js.tosspayments.com/v1/payment"></script>
<style type="text/css">
@font-face {
	font-family: 'Noto Sans KR';
	font-style: normal;
	font-weight: 100;
	src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.woff2)
		format('woff2'),
		url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.woff)
		format('woff'),
		url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.otf)
		format('opentype');
}

@font-face {
	font-family: 'Noto Sans KR';
	font-style: normal;
	font-weight: 300;
	src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff2)
		format('woff2'),
		url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff)
		format('woff'),
		url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.otf)
		format('opentype');
}

@font-face {
	font-family: 'Noto Sans KR';
	font-style: normal;
	font-weight: 400;
	src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff2)
		format('woff2'),
		url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff)
		format('woff'),
		url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.otf)
		format('opentype');
}

@font-face {
	font-family: 'Noto Sans KR';
	font-style: normal;
	font-weight: 500;
	src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff2)
		format('woff2'),
		url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff)
		format('woff'),
		url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.otf)
		format('opentype');
}

@font-face {
	font-family: 'Noto Sans KR';
	font-style: normal;
	font-weight: 700;
	src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.woff2)
		format('woff2'),
		url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.woff)
		format('woff'),
		url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.otf)
		format('opentype');
}

@font-face {
	font-family: 'Noto Sans KR';
	font-style: normal;
	font-weight: 900;
	src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.woff2)
		format('woff2'),
		url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.woff)
		format('woff'),
		url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.otf)
		format('opentype');
}

#login_form {
	/* text-align:center; */
	border-radius: 10px;
	padding: 50px;
	background: #fff;
	text-align: center;
	position: absolute;
	top: 60%;
	left: 50%;
	transform: translate(-50%, -50%);
}
</style>
</head>

<body>
<!-- Spinner Start 로딩시 빙글빙글이라 따로 안뺌-->

<!-- Spinner End -->

<!-- Topbar Start 맨 윗칸 전화모양-->
<%@ include file="../inc/gardener/inc/topbar_link.jsp"%>
<!-- Topbar End -->

<!-- Navbar Start 카테고리부분-->
<%@ include file="../inc/gardener/inc/navbar_link.jsp"%>
<!-- Navbar End -->

	<!-- Body -->
	<a class="skip-link sr-only" href="#skip-target">Skip to content</a>

	<div class="page-flex">
		<!--  Sidebar Start -->
		<!--  Sidebar End-->
		<!-- 서치바인듯 아닌듯 End -->

		<!-- content t-->

		<div id="login_form">
			<!--로그인 폼-->
			<form>
				<h3 class="login" style="letter-spacing: -1px;">Sign in to Wepet</h3>
				
				<br>
				<p>
					<label>위팻 소셜&통합회원가입</label>
				</p>				<br>
				<p>
					<label>소셜 간편로그인</label>
				</p>
				<br>
				<button type="button" class="bt_google" id="bt_google" style="margin-bottom: 10px">
					<img src="/resources/gardener/img/google_button.png" height="60"
						width="200" />
				</button><br>
				<button type="button" class="bt_naver" id="bt_naver" style="margin-bottom: 10px">
					<img src="/resources/gardener/img/naver_button.png" height="60"
						width="200" />
				</button><br>
				<button type="button" class="bt_kakao" id="bt_kakao" style="margin-bottom: 10px">
					<img src="/resources/gardener/img/kakao_button.png" height="60"
						width="200" />
				</button>
			</form>

			​
			<!-- / Layout page -->
		</div>

		<!-- Overlay -->
		<div class="layout-overlay layout-menu-toggle"></div>
	</div>
	<!-- / Layout wrapper -->


	<!-- head_link 2 : 헤드랑 비슷한데, 위아래 나눠져있길래 그냥 나눴슴당.. -->
	<%@ include file="../inc/sneat/sneat_header_link2.jsp" %>
	<!-- head_link 2  End -->
<script type="text/javascript">

function gotoAuthForm(sns){
	$.ajax({
		url : "/rest/member/authform/"+sns,
		type : "get",
		success:function(result, status, xhr){
			console.log("인증주소는", result.msg);
			location.href=result.msg;
		}
	});
	
}


$(function(){
	$("#bt_google").click(function(){
		 gotoAuthForm("google");
	});

	$("#bt_naver").click(function(){
		 gotoAuthForm("naver");
	});
	
	$("#bt_kakao").click(function(){
		 gotoAuthForm("kakao");
	});
	
});
</script>

	
  </body>
</html>
​