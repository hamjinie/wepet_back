<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>펫시터 지원페이지</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Header Start -->
<%@ include file="../inc/gardener/inc/header_link.jsp"%>
<!-- Header End -->

<script src="https://js.tosspayments.com/v1/payment"></script>

</head>

<body>
<!-- <!-- 	Spinner Start 로딩시 빙글빙글이라 따로 안뺌
<div id="spinner"
		class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
		<div class="spinner-border text-primary" role="status"
			style="width: 3rem; height: 3rem;"></div>
	</div> --> -->
	<!-- Spinner End -->

	<!-- Topbar Start 맨 윗칸 전화모양-->
	<%@ include file="../inc/gardener/inc/topbar_link.jsp"%>
	<!-- Topbar End -->

	<!-- Navbar Start 카테고리부분-->
	<%@ include file="../inc/gardener/inc/navbar_link.jsp"%>
	<!-- Navbar End -->

	<!-- Body -->
	<a class="skip-link sr-only" href="#skip-target">Skip to content</a>


	<!--  Sidebar Start -->
	<!--  Sidebar End-->


	<!-- Page Header Start -->
	<div class="container-fluid page-header py-5 mb-3 wow fadeIn"
		data-wow-delay="0.1s">
		<div class="container text-center py-5">
			<h1 class="display-3 text-white mb-4 animated slideInDown">펫시터 지원</h1>
			<nav aria-label="breadcrumb animated slideInDown">
				<ol class="breadcrumb justify-content-center mb-0">
					<li class="breadcrumb-item"><a href="/">Home</a></li>
					<li class="breadcrumb-item"><a href="/petsitter/registform">펫시터 지원</a></li>
					<li class="breadcrumb-item active" aria-current="page">지원하기</li>
				</ol>
			</nav>
		</div>
	</div>
	<!-- Page Header End -->
	<!-- Quote Start -->
	<div class="container-fluid py-5">
		<div class="container">
			<div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s"
				style="max-width: 500px;">
				<h1 class="display-5 mb-5">펫시터 지원하기</h1>
			</div>
	  <form id="form1">
			<div class="row justify-content-center">
				<div class="col-lg-9">
					<div class="bg-light rounded p-4 p-sm-5 wow fadeInUp"
						data-wow-delay="0.1s">
						<div class="row g-2">


							<div class="col-sm-12">
								<div class="form-floating">

									<div class="cart_title mt-5" style="text-align: center">
										<h4 class="order-ttl">
											<span>* </span> 펫시터 지원하기 <span>* </span> 
										</h4>
										<hr>
									</div>


								</div>
							</div>

							<div class="col-sm-12">
								<div class="form-floating">
									<input type="text" class="form-control border-0" id="sitter_nickname"
										placeholder="Gurdian Name" name="sitter_nickname"> <label for="sitter_nickname">활동명</label>
								</div>
							</div>
						
						
						<div class="col-sm-4">
                            <select id="bank" name="bank" class="select2 form-select border-0">
                              <option value="">은행선택하세요</option>
                              <option value="기업">기업</option>
                              <option value="신한">신한</option>
                              <option value="농협">농협</option>
                              <option value="국민">국민</option>
                              <option value="우리">우리</option>
                            </select>
                          </div>					
				
							<div class="col-sm-8">
								<div class="form-floating">
									<input type="text" class="form-control border-0" id="account" name="accountNum"
										placeholder="Gurdian Name"> <label for="account">계좌번호</label>
								</div>
							</div>

							<div class="col-4">
								<div class="form-floating">

									<div class="cart-detail cart-total bg-light p-3 p-md-4">
										<p class="d-flex total-price">
											<span>펫시터 경험 유무</span>
										</p>
									</div>
								</div>
							</div>


							<div class="col-8 text-center align-self-center">
								<div class="form-floating">
									<div class="card h-100">
										<div class="row">
											<div class="card-body">
												<div class="d-flex justify-content-center">
													<div class="form-check-inline m-1">
														<h5>경험 유무 선택</h5>
														<input class="form-check-input" type="radio" value="no"
															name="exp" checked=""> <label
															class="form-check-label" > 경험없음
														</label> <input class="form-check-input" type="radio" value="yes"
															name="exp"> <label
															class="form-check-label" >
															경험있음 </label>
													</div>
												</div>
											</div>
										</div>
									</div>

								</div>
							</div>
                                   <button type="submit" class="btn btn-primary" id="bt_regist">펫시터 신청하기</button>
                        </div>
																
							</div>
						</div>
					</div>
					</form>
				</div>
			</div>

	<!-- Quote End -->


	<!-- .col-md-8 -->


	<!-- Footer Start -->
	<!-- Footer End -->

	<!-- Copyright Start -->
	<%@ include file="../inc/gardener/inc/copyright_link.jsp"%>
	<!-- Copyright End -->




	<!-- Back to Top -->
	<a href="#"
		class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i
		class="bi bi-arrow-up"></i></a>

<script type="text/javascript">

function regist() {
	$("#form1").attr({
		action:"/petsitter/apply",
		method: "post"
	});
	$("#form1").submit();
	alert("가입신청 완료, 메인으로 이동합니다");
}

$(function(){
	$("#bt_regist").click(function(){
		 regist();

	});

});
</script>

</body>
</html>