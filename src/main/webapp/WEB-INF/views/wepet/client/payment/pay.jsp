<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>결제하기 페이지</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Header Start -->
<%@ include file=../inc/gardener/inc/header_link.jsp"%>
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


	<!--  Sidebar Start -->
	<!--  Sidebar End-->


	<!-- Page Header Start -->
	<div class="container-fluid page-header py-5 mb-5 wow fadeIn"
		data-wow-delay="0.1s">
		<div class="container text-center py-5">
			<h1 class="display-3 text-white mb-4 animated slideInDown">예약 /
				결제</h1>
			<nav aria-label="breadcrumb animated slideInDown">
				<ol class="breadcrumb justify-content-center mb-0">
					<li class="breadcrumb-item"><a href="#">Home</a></li>
					<li class="breadcrumb-item"><a href="#">마이페이지</a></li>
					<li class="breadcrumb-item active" aria-current="page">예약하기</li>
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
				<p class="fs-5 fw-bold text-primary">결제 확인</p>
				<h1 class="display-5 mb-5">예약 정보 확인</h1>
			</div>
			<div class="row justify-content-center">
				<div class="col-lg-11">
					<div class="bg-light rounded p-4 p-sm-5 wow fadeInUp"
						data-wow-delay="0.1s">
						<div class="row g-3">



							<div class="col-sm-12">
								<div class="form-floating">

									<div class="cart_title">
										<h4 class="order-ttl">
											<span>01.</span> 예약 확인
										</h4>
										<hr>
									</div>


								</div>
							</div>



							<div class="col-sm-12">
								<div class="form-floating">

									<div class="table-responsive text-nowrap">
										<table class="table table-hover" style="height: 200px">
											<thead class="table">
												<tr>
													<th></th>
													<th>예약 정보</th>
													<th>예약 금액</th>
													<th>할인액</th>
													<th>예약일</th>
													<th>결제 금액</th>
												</tr>
											</thead>
											<tbody class="table-border-bottom-0">

												<%
									for (int i = 0; i < 1; i++) {
								%>
												<%
									String nodot = Double.toString((i * 10000) * (0.1));
								%>

												<tr>
													<td></td>
													<td><%=request.getParameter("pettype")+" "+request.getParameter("petcount") %></td>
													<td><%=request.getParameter("money") + "원"%></td>
													<td><%=nodot.substring(0, nodot.lastIndexOf(".")) + "원"%></td>
													<td><%=request.getParameter("date") + "일"%></td>
													<td><%=request.getParameter("money") + "원"%></td>
													<td></td>
													<td>
														<div class="dropdown">
															<button type="button"
																class="btn p-0 dropdown-toggle hide-arrow"
																data-bs-toggle="dropdown">
																<i class="bx bx-dots-vertical-rounded"></i>
															</button>
															<div class="dropdown-menu">
																<a class="dropdown-item"> Edit</a> <a
																	class="dropdown-item"> Delete</a>
															</div>
														</div>
													</td>
												</tr>

												<%
									}
								%>

											</tbody>
										</table>
									</div>


								</div>
							</div>




							<div class="col-sm-6">
								<div class="form-floating">
									<input type="text" class="form-control border-0"
										id="customerName" placeholder="Gurdian Name"> <label
										for="customerName">주문자</label>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-floating">
									<input type="text" class="form-control border-0" id="amount"
										placeholder="Gurdian Name" value="<%=request.getParameter("money")%>"> <label for="amount">금액</label>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-floating">
									<input type="text" class="form-control border-0" id="orderName"
										placeholder="Gurdian Name"> <label for="orderName">주문명</label>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-floating">
									<input type="text" class="form-control border-0" id="orderId"
										placeholder="Child Name" readonly=""> <label
										for="orderId">주문번호 : e0DcYFQK5ONwlp5bMR0V3</label>
								</div>
							</div>


							<div class="col-sm-12">
								<div class="form-floating">

									<div class="cart_title mt-5">
										<h4 class="order-ttl">
											<span>02. </span> 주문자 정보 확인
										</h4>
										<hr>
									</div>


								</div>
							</div>

							<div class="col-sm-12">
								<div class="form-floating">
									<input type="text" class="form-control border-0" id="gname"
										placeholder="Gurdian Name" value="<%if(request.getParameter("addr")!=null){%><%=request.getParameter("addr")%><%}%>"> <label for="gname">주소</label>
								</div>
							</div>
							<div class="col-sm-12">
								<div class="form-floating">
									<input type="email" class="form-control border-0" id="gmail"
										placeholder="Gurdian Email"> <label for="gmail">상세주소</label>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-floating">
									<input type="text" class="form-control border-0" id="gname"
										placeholder="Gurdian Name" value="<%if(request.getParameter("phone")!=null){%><%=request.getParameter("phone")%><%}%>"> <label for="gnum">Mobile</label>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-floating">
									<input type="text" class="form-control border-0" id="cname"
										placeholder="Child Name" value="<%if(request.getParameter("email")!=null){%><%=request.getParameter("email")%><%}%>"> <label for="cname">email</label>
								</div>
							</div>
							<div class="col-12">
								<div class="form-floating">
									<textarea class="form-control border-0"
										placeholder="Leave a message here" id="message"
										style="height: 100px"></textarea>
									<label for="message">요청사항</label>
								</div>
							</div>

							<div class="col-sm-12">
								<div class="form-floating">

									<div class="cart_title mt-5">
										<h4 class="order-ttl">
											<span>03. </span> 할인 혜택
										</h4>
										<hr>
									</div>


								</div>
							</div>


							<div class="col-sm-12">
								<div class="form-floating">

									<div class="cart_title mt-5">
										<h4 class="order-ttl">
											<span>04. </span> 결제 정보
										</h4>
										<hr>
									</div>


								</div>
							</div>


							<div class="col-6">
								<div class="form-floating">

									<div class="cart-detail cart-total bg-light p-3 p-md-4">
										<h3 class="billing-heading mb-4">최종 결제 금액</h3>
										<p class="d-flex">
											<span>예약 금액</span> <span>&nbsp; <%=request.getParameter("money") %> 원</span>
										</p>
										<p class="d-flex">
											<span>쿠폰 할인</span> <span>&nbsp; 0 원</span>
										</p>
										<hr>
										<p class="d-flex total-price">
											<span>최종 결제 금액</span> <span>&nbsp; <%=request.getParameter("money") %> 원</span>
										</p>
									</div>
								</div>
							</div>




							<div class="col-6 text-center align-self-center">
								<div class="form-floating">
									<div class="card h-100">
										<div class="row">
											<div class="card-body">
												<div class="d-flex justify-content-center">
													<div class="form-check-inline m-1">
														<h5>결제 수단 선택</h5>
														<input class="form-check-input" type="radio" value="카드"
															name="check" checked=""> <label
															class="form-check-label" > 카드
														</label> <input class="form-check-input" type="radio" value="가상계좌"
															name="check"> <label
															class="form-check-label" >
															가상계좌 </label>
													</div>
												</div>
											</div>
										</div>
									</div>

								</div>
							</div>



							<div class="col-12 text-center">
								<button class="btn btn-primary py-3 px-4" id="bt_pay"
									type="submit">결제하기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
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

</body>
<script type="text/javascript">

var clientKey = 'test_ck_YoEjb0gm23Pvlz55QYorpGwBJn5e'
var tossPayments = TossPayments(clientKey) // 클라이언트 키로 초기화하기

function getpay() {
	let how=$('input[name=check]:checked').val(); //카드 or 가상계좌 로만 받아와야함
	//let orderId=$("#orderId").val(); //받아와야
	let amount=$("#amount").val();
	let orderName=$("#orderName").val();
	let customerName=$("#customerName").val();	
	
	tossPayments.requestPayment(how, { // 결제 수단 파라미터
      // 결제 정보 파라미터
      amount: amount,
      orderId: 'e0DcYFQK5ONwlp5bMR0V3',
      orderName: orderName,
      customerName: customerName,
      successUrl: 'http://localhost:7777/wepet/client/success',
      failUrl: 'http://localhost:7777/wepet/fail',
    })
    .catch(function (error) {
       if (error.code === 'USER_CANCEL') {
         // 결제 고객이 결제창을 닫았을 때 에러 처리
      	} else if (error.code === 'INVALID_CARD_COMPANY') {
       		// 유효하지 않은 카드 코드에 대한 에러 처리
     	}
    })
	
}
      
$(function(){
    $("#bt_pay").click(function(){
        getpay();
    });
});

</script>

</html>