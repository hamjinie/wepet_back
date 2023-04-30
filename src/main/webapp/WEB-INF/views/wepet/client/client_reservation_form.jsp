<%@ page language="java" contentType="text/html;charset=UTF-8"%>8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>고객 예약 페이지</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Header Start -->
<%@ include file="inc/gardener/inc/header_link.jsp"%>
<!-- Header End -->

<style>
@import
	url('https://fonts.googleapis.com/css?family=Questrial&display=swap');

#form2 {
	background-color: white;
	height: auto;
	width: 300px;
	margin: 0px;
	margin: 0 auto;
	border-radius: 5px;
}

td {
	width: 45px;
	height: 45px;
}

.Calendar {
	text-align: center;
}

.Calendar>thead>tr:first-child>td {
	font-family: 'Questrial', sans-serif;
	font-size: 1.1em;
	font-weight: bold;
}

.Calendar>thead>tr:last-child>td {
	font-family: 'Questrial', sans-serif;
	font-weight: 600;
}

.Calendar>tbody>tr>td>p {
	font-family: 'Montserrat', sans-serif;
	height: 36px;
	width: 36px;
	border-radius: 36px;
	transition-duration: .2s;
	line-height: 36px;
	margin: 2.5px;
	display: block;
	text-align: center;
}

.pastDay {
	color: lightgray;
}

.futureDay, .today {
	background-color: #FFFFFF;
	cursor: pointer;
}

.futureDay:hover {
	background: #eee;
}

.futureDay.choiceDay {
	background: #1ac50d;
	color: #fff;
	font-weight: 600;
	cursor: pointer;
}

.futureDay.reservationDay {
	background: #0dc5c5;
	color: #fff;
	font-weight: 600;
	cursor: pointer;
}
</style>

<link rel="stylesheet" href="/resources/sneat/assets/vendor/fonts/boxicons.css" />

</head>

<body>
	<!-- Topbar Start 맨 윗칸 전화모양-->
	<%@ include file="inc/gardener/inc/topbar_link.jsp"%>
	<!-- Topbar End -->

	<!-- Navbar Start 카테고리부분-->
	<%@ include file="inc/gardener/inc/navbar_link.jsp"%>
	<!-- Navbar End -->

	<!-- Body -->
	<a class="skip-link sr-only" href="#skip-target">Skip to content</a>


	<!--  Sidebar Start -->
	<!--  Sidebar End-->


	<!-- Page Header Start -->
	<div class="container-fluid page-header py-5 mb-5 wow fadeIn" data-wow-delay="0.1s">
		<div class="container text-center py-5">
			<h1 class="display-3 text-white mb-4 animated slideInDown">펫시터 > 예약하기</h1>
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
			<div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
				<p class="fs-5 fw-bold text-primary">펫시터 > 예약하기</p>
				<h1 class="display-5 mb-5">예약 정보 확인</h1>
			</div>
			<div class="row justify-content-center">
				<div class="col-lg-11">
					<div class="bg-light rounded p-4 p-sm-5 wow fadeInUp" data-wow-delay="0.1s">
						<div class="row g-3">

							<div class="col-sm-7">
								<div class="form-floating">
									<div class="container-xxl py-5">
										<div class="row g-5 align-items-start">
											<div class="col-lg-12 col-md-7 wow fadeInUp" data-wow-delay="0.3s" style="visibility: visible; animation-delay: 0.3s; animation-name: fadeInUp;">
												<div class="align-self-center wow fadeInUp" data-wow-delay="0.1s" style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
													<img class="img-fluid rounded" data-wow-delay="0.1s" src="/resources/gardener/img/carousel-1.jpg">
												</div>
												<p class="text-primary mb-4"></p>
												<h3 class="mb-4">나와 우리 아이에게 맞는 올바른 교육을 받아보세요</h3>
												<p>
													조승현 훈련사 <a class="nav-link active" href="" style="display: inline;">★5.0 121개의 리뷰</a>
												</p>
											</div>

										</div>
									</div>

									<hr>
									<div class="row mb-5">
										<h5 class="text-primary m-4">경력</h5>

										<div class="col-lg-12 col-md-12 wow fadeInUp" data-wow-delay="0.5s" style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInUp;">
											<div class="row g-5">
												<div class="col-2 border-start ps-4 align-self-center text-center">
													<i class="bx bx-trophy bx-md"></i>

												</div>
												<div class="col-10">
													<h4 class="mb-3">대표 경력</h4>
													<span>반려동물 훈련-관리사 교육 강사, 반려견 교육 센터 근무</span>
												</div>
												<div class="col-2 border-start ps-4 align-self-center text-center">
													<i class="bx bx-trophy bx-md"></i>

												</div>
												<div class="col-10">
													<h4 class="mb-3">전문 분야</h4>
													<span>행동 분석 전문, 산책 교육 전문</span>
												</div>
												<div class="col-2 border-start ps-4 align-self-center text-center">
													<i class="bx bx-trophy bx-md"></i>

												</div>
												<div class="col-10">
													<h4 class="mb-3">방문 지역</h4>
													<span>서울특별시, 인천광역시, 경기도 전지역 (그 외 지역은 출장비 발생)</span>
												</div>

											</div>
										</div>

									</div>

									<hr>
									<div class="row mb-5">
										<h5 class="text-primary m-4">자격</h5>

										<div class="col-lg-12 col-md-12 wow fadeInUp" data-wow-delay="0.5s" style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInUp;">
											<div class="row g-5">
												<div class="col-12 col-sm-6 col-lg-12">
													<div class="border-start ps-4">
														<i class="fa fa-award fa-3x text-primary mb-3"></i>
														<h4 class="mb-3">반려동물관리사</h4>
														<span>(주)한국반려동물관리협회</span>
													</div>
												</div>
												<div class="col-12 col-sm-6 col-lg-12">
													<div class="border-start ps-4">
														<i class="fa fa-award fa-3x text-primary mb-3"></i>
														<h4 class="mb-3">KKF 인증 3등 훈련사</h4>
														<span>한국애견연맹(KKF)</span>
													</div>
												</div>
											</div>
										</div>

									</div>

									<div class="row g-3 m-3">
										<hr>
										<div class="col">
											<div class="text-center border m-3" style="height: 200px; background-color: white;">펫시터 자기소개</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-5">

								<div class="row g-3 m-3">

									<div class="align-self-center wow fadeInUp" data-wow-delay="0.1s" style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
										<div class="card text-center m-3">
											<div class="card-body">
												<h6 class="card-title text-start">궁금한 내용이 있다면, 문의를 보내보세요!</h6>
												<a href="javascript:void(0)" class="btn btn-primary py-3 px-4">문의하기</a>
											</div>
										</div>
									</div>

									<div>
										<div class="text-center border m-3" style="height: 200px; background-color: white;">이용요금 안내</div>
										<div class="text-center border m-3" style="height: 450px; background-color: white;">
											<label>예약기간을 선택해 주세요</label>
											<div class="container">
												<form id="form2">
													<div>
														<button class="btn btn-primary btn-sm" type="button" id="bt_reset">선택일정초기화</button>
													</div>
													<div>
														<table class="Calendar" style="width: 290px; height: 350px">
															<thead>
																<tr>
																	<td colspan="7"><span id="calYear"></span>년 <span id="calMonth"></span>월</td>
																</tr>
																<tr>
																	<td>일</td>
																	<td>월</td>
																	<td>화</td>
																	<td>수</td>
																	<td>목</td>
																	<td>금</td>
																	<td>토</td>
																</tr>
															</thead>
															<tbody>
															</tbody>
														</table>
													</div>
												</form>
											</div>
										</div>
										<div class="text-center border m-3" style="height: 200px; background-color: white;">그외 안내사항</div>
									</div>
								</div>
								<form id="form1">

									<div class="row g-3 m-3">

										<div class="col-sm-6">
											<div class="form-floating">
												<select class="form-control  border-0 bg-white" name="pettype" id="pettype">
													<option>펫의 종류를 알려주세요</option>
													<option value="고양이">고양이</option>
													<option value="소형견">소형견</option>
													<option value="중형견">중형견</option>
													<option value="대형견">대형견</option>
												</select> <label for="gname">펫 종류</label>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-floating">
												<select class="form-control  border-0 bg-white" name="petcount" id="petcount">
													<option>펫의 수를 알려주세요</option>
													<option value="1">1마리</option>
													<option value="2">2마리</option>
													<option value="3">3마리</option>
												</select> <label for="gname">펫 수</label>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-floating">
												<input type="text" class="form-control border-0" name="date" id="date" placeholder="Gurdian Name"> <label for="gname">선택한 예약일</label>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-floating">
												<button class="btn btn-primary py-1 px-4 mt-3 btn-sm" type="button" id="bt_money">금액 계산</button>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="form-floating">
												<input type="text" class="form-control border-0" name="money" id="money" placeholder="Gurdian Name"> <label for="gname">금액</label>
											</div>
										</div>
								</form>
										<div class="col-12 text-center">
											<button class="btn btn-primary py-3 px-4 mt-3" type="button" id="bt_addReservation">예약추가하기</button>
											<button class="btn btn-primary py-3 px-4 mt-3" type="button" id="bt_pay" data-bs-toggle="modal" data-bs-target="#modal">결제페이지로</button>
										</div>
									</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal start -->
	<form id="form2">
		<div class="modal fade" id="modal" tabindex="-1" style="display: none;" aria-hidden="true" data-bs-keyboard="false" data-bs-backdrop="static">
			<div class="modal-dialog modal-dialog-centered modal-xl" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="modalCenterTitle">예약목록</h5>
					</div>
					<div class="modal-body">
						<table class="table">
							<thead class="table-dark">
								<tr>
									<th>No</th>
									<th>펫 종류</th>
									<th>펫 수</th>
									<th>선택한 예약일</th>
									<th>금액</th>
								</tr>
							</thead>
							<tbody id="tbody">
								
							</tbody>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="bt_regist">결제하러 가기</button>
						<button type="button" class="btn btn-primary" id="cancelModal">예약선택취소</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- Modal end -->

	<!-- Quote End -->
	<!-- .col-md-8 -->


	<!-- Footer Start -->
	<!-- Footer End -->

	<!-- Copyright Start -->
	<%@ include file="inc/gardener/inc/copyright_link.jsp"%>
	<!-- Copyright End -->

	<!-- Back to Top -->
	<a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>

</body>
<script type="text/javascript">

	let nowMonth = new Date(); // 현재 달을 페이지를 로드한 날의 달로 초기화
	let today = new Date(); // 페이지를 로드한 날짜를 저장
	today.setHours(0, 0, 0, 0); // 비교 편의를 위해 today의 시간을 초기화

	let currentMonth = nowMonth.getMonth() + 1;
	let currentYear = nowMonth.getFullYear();

	console.log("currentYear", currentYear)

	//날짜데이터에 언제든 접근하기 위해 현재 날짜들을 배열에 담아놓는다 
	let dayBoxList = [];

	//휴무를 담을 배열
	let reservationBox = [];

	let json = {};

	// 달력 생성 : 해당 달에 맞춰 테이블을 만들고, 날짜를 채워 넣는다.
	function buildCalendar() {

		let firstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), 1); // 이번달 1일
		let lastDate = new Date(nowMonth.getFullYear(),
				nowMonth.getMonth() + 1, 0); // 이번달 마지막날

		let tbody_Calendar = document.querySelector(".Calendar > tbody");
		document.getElementById("calYear").innerText = nowMonth.getFullYear(); // 연도 숫자 갱신
		document.getElementById("calMonth").innerText = leftPad(nowMonth.getMonth() + 1); // 월 숫자 갱신

		while (tbody_Calendar.rows.length > 0) { // 이전 출력결과가 남아있는 경우 초기화
			tbody_Calendar.deleteRow(tbody_Calendar.rows.length - 1);
		}

		let nowRow = tbody_Calendar.insertRow(); // 첫번째 행 추가           

		for (let i = 0; i < firstDate.getDay(); i++) { // 이번달 1일의 요일만큼
			let nowColumn = nowRow.insertCell(); // 열 추가
		}

		for (let nowDay = firstDate; nowDay <= lastDate; nowDay.setDate(nowDay.getDate() + 1)) { // day는 날짜를 저장하는 변수, 이번달 마지막날까지 증가시키며 반복  

			let nowColumn = nowRow.insertCell(); // 새 열을 추가

			let newDIV = document.createElement("p");

			//날짜 p 태그에 함수 추가 
			newDIV.addEventListener("click", function() {

				addReservationdate(this);

				$("input[name='date']").val(this.innerText);

			});

			dayBoxList.push(newDIV);

			newDIV.innerHTML = leftPad(nowDay.getDate()); // 추가한 열에 날짜 입력
			nowColumn.appendChild(newDIV);

			if (nowDay.getDay() == 6) { // 토요일인 경우
				nowRow = tbody_Calendar.insertRow(); // 새로운 행 추가
			}

			if (nowDay < today) { // 지난날인 경우
				newDIV.className = "pastDay";
			} else { //이번달
				newDIV.className = "futureDay";
			}
		}
	}

	// input값이 한자리 숫자인 경우 앞에 '0' 붙혀주는 함수
	function leftPad(value) {
		if (value < 10) {
			value = "0" + value;
			return value;
		}
		return value;
	}

	//휴무일 가져오기
	function getHolidayList() {
		$.ajax({
				url : "/rest/reservation",
				method : "get",
				success : function(result, status, xhr) {

					console.log(result);
					console.log(dayBoxList);

					//DB에 들어있는 날짜와 대조해서 날짜 색칠
					for (let i = 0; i < result.length; i++) {
						let yy = result[i].yy;
						let mm = result[i].mm;
						let dd = result[i].dd;

						console.log("yy", yy);
						console.log("mm", mm);

						console.log("입력된텍스트월", document.getElementById("calYear").innerText)

						//월의 날짜만큼 반복문 돌리자 
						for (let a = 1; a <= dayBoxList.length; a++) { //1,=
							if (dd == a + 1) {
								console.log(dd, "날은 휴가에욤");
								if (dayBoxList[a].className != "pastDay"&& yy == document.getElementById("calYear").innerText&& leftPad(mm) == document.getElementById("calMonth").innerText) {
									dayBoxList[a].className = "pastDay";
								}
							}
						}
					}
				}
			});
		}
	
	//예약일 가져오기
	function getReservationList() {
		$.ajax({
				url : "/rest/reservation",
				method : "get",
				success : function(result, status, xhr) {

					console.log(result);
					console.log(dayBoxList);

					//DB에 들어있는 날짜와 대조해서 날짜 색칠
					for (let i = 0; i < result.length; i++) {
						let yy = result[i].yy;
						let mm = result[i].mm;
						let dd = result[i].dd;

						console.log("yy", yy);
						console.log("mm", mm);

						console.log("입력된텍스트월", document.getElementById("calYear").innerText)

						//월의 날짜만큼 반복문 돌리자 
						for (let a = 1; a <= dayBoxList.length; a++) { //1,=
							if (dd == a + 1) {
								console.log(dd, "날은 예약이에욤");
								if (dayBoxList[a].className != "pastDay"&& yy == document.getElementById("calYear").innerText&& leftPad(mm) == document.getElementById("calMonth").innerText) {
									dayBoxList[a].className = "pastDay";
								}
							}
						}
					}
				}
			});
		}

	//예약일 클릭시 발생하는 이벤트
	function addReservationdate(obj) {

		if (obj == undefined || obj.className == "pastDay"	|| obj.className == "futureDay reservationDay") {
			return;
		}
		if (confirm(obj.innerText + "일을 예약일로 추가 하시겠습니까?")) {
			
			obj.classList.add("reservationDay");

			json["yy"] = document.getElementById("calYear").innerText,
			json["mm"] = document.getElementById("calMonth").innerText,
			json["dd"] = obj.innerText
			reservationBox.push(json);
			console.log("1차 박스에 담기는거",reservationBox);
		}
	}

	function getOnlyDate(str) {
		let arr = str.split("-");
		return parseInt(arr[2]);
	}

	function getOnlyYear(str) {
		let arr = str.split("-");
		return parseInt(arr[0]);
	}

	function getOnlyMonth(str) {
		let arr = str.split("-");
		return parseInt(arr[1]);
	}

	function addPreReservation() {

		let jsonBox = [];

		json["pet_kind"] = $("select[name='pettype']").val();
		json["pet_number"] = $("select[name='petcount']").val();
		json["client_content"] = $("textarea[name='message']").val();
		json["fee"] = $("input[name='money']").val();

		jsonBox.push(json);

		reservationBox.concat(jsonBox);
		
		console.log("reservationBox",reservationBox);
	}

	function addReservation() {

		//db연동 
		$.ajax({
			url : "/rest/reservation",
			method : "post",
			data : JSON.stringify(reservationBox),
			dataType : "json",
			contentType : "application/json",
			success : function(result, status, xhr) {
				alert("성공");
			}
		});

	}

	$(function() {

		buildCalendar();
		
		$("#cancelModal").click(function(){
			location.reload();
		});
		
		$("#bt_reset").click(function(){
			location.reload();
		});

		$("#bt_pay").click(function() {
			
			addPreReservation();
			
			for(let i=0; i<reservationBox.length;i++){
				var insertTr="";
					insertTr="<tr>";
					insertTr+="<td>"+i+"</td>"
					insertTr+="<td>"+reservationBox[i].pet_kind+"</td>"
					insertTr+="<td>"+reservationBox[i].pet_number+"</td>"
					insertTr+="<td>"+reservationBox[i].yy+"-"+reservationBox[i].mm+"-"+reservationBox[i].dd+"</td>"
					insertTr+="<td>"+reservationBox[i].fee+"</td>"
					insertTr+="</tr>";
					$("#tbody").append(insertTr);
			}
			
		});

		$("#bt_money").click(function() {

			let a = $("select[name='pettype']").val();

			if (a == "고양이") {
				a = 10000;
			} else if (a == "소형견") {
				a = 20000;
			} else if (a == "중형견") {
				a = 25000;
			} else if (a == "대형견") {
				a = 50000;
			}
			let b = $("select[name='petcount']").val();
			let c = a * b;
			let d = $("input[name='money']").val() + c;

			//$("#money").attr("value", c);
			$("input[name='money']").val(c);
			$("input[name='money']").attr("readonly",true);
		});

		$("#bt_addReservation").click(function() {
			addPreReservation();
			json={};
			$("input[name='money']").attr("readonly",false);
			$("#form1")[0].reset();
			document.getElementById("money").value = null;
		});
		
		$("#bt_regist").click(function(){

            let data=JSON.stringify(reservationBox);

            localStorage.setItem("data", JSON.stringify(reservationBox));
            $("#form1").attr({
                action:"/pay",
                method:"post",
            });
            $("#form1").submit();

        });
	});
</script>

</html>