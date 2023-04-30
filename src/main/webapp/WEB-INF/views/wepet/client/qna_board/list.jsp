<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>메인페이지</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">
 <meta name="viewport" content="width=device-width, initial-scale=1">
   
 
 
<!-- Header Start -->
<%@ include file="../inc/sneat/sneat_header_link.jsp"%>
<!-- Header End -->

<!-- Header Start -->
<%@ include file="../inc/gardener/inc/header_link.jsp"%>
<!-- Header End -->
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://js.tosspayments.com/v1/payment"></script>
<style type="text/css">
 .nav-it {
     width:15%;
     text-align: center;
   }
</style>


</head>

<body>
	<!-- Spinner Start 로딩시 빙글빙글이라 따로 안뺌-->
	<!-- <div id="spinner"
	class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
	<div class="spinner-border text-primary" role="status"
		style="width: 3rem; height: 3rem;"></div>
</div> -->
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

		<div class="container">
		<from id="a_form">
			<!-- Nav tabs -->
			<br>
				<h4 align="center"> Wepet 에 대해 궁금한게 무엇이든지 알려드려요!</h4> 
				<br><h6 align="center">고객센터 및 카카오톡 운영시간 : 9시 ~ 18시</h6>	
				<br><h3 align="center">자주 묻는 질문 QnA </h3>		

			<ul class="nav nav-tabs justify-content-center" style="margin-top: 20px; padding-top: 10px" role="tablist">
				<li class="nav-it"><a class="nav-link active" data-toggle="tab" href="#home"><b>펫시터란?</b></a></li>
				<li class="nav-it"><a class="nav-link" data-toggle="tab" href="#menu1"><b>이용예약</b></a></li>
				<li class="nav-it"><a class="nav-link" data-toggle="tab" href="#menu2"><b>요금결제</b></a></li>
				<li class="nav-it"><a class="nav-link" data-toggle="tab" href="#menu3"><b>그외문의</b></a></li>
			</ul>

			<!-- Tab panes -->
			<div class="tab-content">
				<div id="home" class="container tab-pane active">
					<!-- 질문 한개 탭 -->
					<div id="accordion">
						<div class="card">
							<div class="card-header">
								 <a class="card-link" data-toggle="collapse" href="#collapseOne"><b>펫시터란? 누구인가요?</b> </a>
							</div>
							 <!-- collapse show 상태는 탭이 열려있는 상태 -->
							<div id="collapseOne" class="collapse"
								data-parent="#accordion">
								<div class="card-body">펫시터는~~~~시간이 안될때! 돈받고 반려동물 돌봐주는 사람이지롱~</div>
							</div>
						</div>
					</div>
						<!-- 질문 한개 탭 end-->
				</div>
				
				<div id="menu1" class="container tab-pane fade">
				<!-- 질문 한개 탭 -->
					<div id="accordion">
						<div class="card">
							<div class="card-header">
								 <a class="card-link" data-toggle="collapse" href="#collapseOne"><b>이용예약관련  대해 </b> </a>
							</div>
							 <!-- collapse show 상태는 탭이 열려있는 상태 -->
							<div id="collapseOne" class="collapse"
								data-parent="#accordion">
								<div class="card-body">펫시터는~~~~시간이 안될때! 돈받고 반려동물 돌봐주는 사람이지롱~</div>
							</div>
						</div>
						<!-- 질문 한개 탭 end-->
					</div>

				</div>
				<div id="menu2" class="container tab-pane fade">
					<div id="accordion">
						<div class="card">
							<div class="card-header">
								 <a class="card-link" data-toggle="collapse" href="#collapseOne"><b>요금, 취소 환불 문의</b> </a>
							</div>
							 <!-- collapse show 상태는 탭이 열려있는 상태 -->
							<div id="collapseOne" class="collapse"
								data-parent="#accordion">
								<div class="card-body">펫시터는~~~~시간이 안될때! 돈받고 반려동물 돌봐주는 사람이지롱~</div>
							</div>
						</div>
					</div>
				</div>
				
				
				<div id="menu3" class="container tab-pane fade">
					<div id="accordion">
						<div class="card">
							<div class="card-header">
								 <a class="card-link" data-toggle="collapse" href="#collapseOne"><b>기타문의</b> </a>
							</div>
							 <!-- collapse show 상태는 탭이 열려있는 상태 -->
							<div id="collapseOne" class="collapse"
								data-parent="#accordion">
								<div class="card-body">펫시터는~~~~시간이 안될때! 돈받고 반려동물 돌봐주는 사람이지롱~</div>
							</div>
						</div>
					</div>
					</div>
					
			<!-- tab content -->
			</div>


</from>
			<!-- Footer Start -->
			<!-- Footer End -->
			<!-- Copyright Start -->

			<!-- Copyright End -->
		</div>
	</div>
	<%@ include file="../inc/gardener/inc/copyright_link.jsp"%>
	<!-- Back to Top -->
	<a href="#"
		class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i
		class="bi bi-arrow-up"></i></a>

</body>

</html>