<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>결제 성공</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Header Start -->
<%@ include file="../inc/gardener/inc/header_link.jsp"%>
<!-- Header End -->

<script src="https://js.tosspayments.com/v1/payment"></script>

</head>

<body>
<!-- Spinner Start 로딩시 빙글빙글이라 따로 안뺌-->
<div id="spinner"
	class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
	<div class="spinner-border text-primary" role="status"
		style="width: 3rem; height: 3rem;"></div>
</div>
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

	<div class="container justify-content-center">
	
		<div class="cart_title m-5">
		<h2 class="ttl-h2">예약/결제</h2>
		</div>

			<div class="row justify-content-center">
				<div class="col-xl-10 ftco-animate fadeInUp ftco-animated">
					<div class="cart_title">
						<h1 class="order-ttl text-center">고객님의 예약이 정상적으로 완료되었습니다.</h1>
						<hr>
					</div>
					<form id="form1">
						<div>

							<div class="row mt-5 pt-3 d-flex">
								<div class="col">
									<div class="cart-detail cart-total bg-light p-3 p-md-4">
										<p class="d-flex">
											<span class="col-4">예약 번호</span> 
											<span class="col-8"></span>
										</p>
										<p class="d-flex">
											<span class="col-4">방문 예정지 주소</span>
											<span class="col-8">주소 나올곳</span>
										</p>
										<hr>
										<p class="d-flex total-price">
											<span class="col-4">주문 금액</span>
											<span class="col-8"><%=request.getParameter("amount") %>금액 나올곳</span>
										</p>
										<p class="d-flex total-price">
											<span class="col-4">- 쿠폰 할인</span>
											<span class="col-8">할인액 나올곳</span>
										</p>
										<hr>
										<p class="d-flex total-price">
											<span class="col-4">결제 상세</span>
											<span class="col-8">카드 결제 내역</span>
										</p>
									</div>
								</div>
							</div>
							<div class="col">
								<div class="d-flex justify-content-center">
									<p>
										<a href="#" class="btn btn-primary m-5  py-3 px-4 text-white" style="width: 200px"> 홈으로 가기 </a>
									</p>
									<p>
										<a href="#" class="btn btn-primary m-5 py-3 px-4 text-white" style="width: 200px">예약내역 보기</a>
									</p>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>

		<!-- Footer Start -->
		<!-- Footer End -->
	
		<!-- Copyright Start -->
		<%@ include file="../inc/gardener/inc/copyright_link.jsp"%>
		<!-- Copyright End -->

		</div>
	</div>


	<!-- Back to Top -->
	<a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>
	
</body>

</html>