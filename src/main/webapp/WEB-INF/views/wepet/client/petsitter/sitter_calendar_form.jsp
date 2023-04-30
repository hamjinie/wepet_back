<%@page import="org.slf4j.LoggerFactory"%>
<%@page import="org.slf4j.Logger"%>
<%@page import="com.edu.wepet.domain.Holiday"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<!-- beautify ignore:start -->
<html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="../assets/" data-template="vertical-menu-template-free">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

<title>펫시터 메인 페이지</title>

<meta name="description" content="" />

<!-- BootStrap -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- JQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>
@import
	url('https://fonts.googleapis.com/css?family=Questrial&display=swap');

#form1 {
	background-color: white;
	height: auto;
	width: 550px;
	margin: 0px;
	padding: 20px;
	margin: 0 auto;
	border-radius: 5px;
	box-shadow: 0px 40px 30px -20px rgba(0, 0, 0, 0.3);
}

td {
	width: 50px;
	height: 50px;
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
	height: 45px;
	width: 45px;
	border-radius: 45px;
	transition-duration: .2s;
	line-height: 45px;
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
</style>

<%@ include file="../inc/sneat/sneat_header_link.jsp"%>
</head>

<body>
	<!-- navbar  -->
	<%@ include file="../inc/sneat/sneat_navbar_link.jsp"%>
	<!-- navbar end -->

	<!-- Layout container -->
	<div class="layout-page">
		<!-- Navbar -->

		<!-- 상단, 서치바 -->
		<%@ include file="../inc/sneat/sneat_searchbar_link.jsp"%>
		<!-- 서치바 End -->

		<!-- Main -->
		<div class="container-fluid">
			<div class="row" style="margin-top: 150px">
				<div class="col-lg-6">
					<form id="form1">
						<div>
							<table class="Calendar" style="width: 500px; height: 500px">
								<thead>
									<tr>
										<td onClick="prevCalendar();" style="cursor: pointer;">&#60;</td>
										<td colspan="5"><span id="calYear"></span>년 <span id="calMonth"></span>월</td>
										<td onClick="nextCalendar();" style="cursor: pointer;">&#62;</td>
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
									<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#calendarModal">휴무등록</button>
								</tbody>
							</table>
						</div>
					</form>
				</div>
				<div calss="col-lg-6" style="width: 570px; height: 500px margin-left: 0px; background-color: white;">
					<div style="text-align: center; margin-top: 5px">
						<button class="btn btn-primary btn-lg" type="button" id="bt_live">진행중인일정</button>
						<button class="btn btn-primary btn-lg" type="button" id="bt_today">오늘의일정</button>
						<button class="btn btn-primary btn-lg" type="button" id="bt_res">예약일정</button>
					</div>
					<div class="col-xl" id="pet_live" style="display: none;">
						<div class="card mb-4">
							<div class="card-header d-flex justify-content-between align-items-center" id="hi">
								<h5 class="mb-0">진행중인 일정</h5>
							</div>
							<div class="card-body">
								<form>
									<div class="mb-3">
										<label class="form-label" for="basic-default-fullname">예약일시</label> 
										<input type="text" class="form-control" readonly="readonly" id="basic-default-fullname" placeholder="John Doe">
									</div>
									<div class="mb-3">
										<label class="form-label" for="basic-default-company">고객성명</label> 
										<input type="text" class="form-control" readonly="readonly" id="basic-default-company" placeholder="ACME Inc.">
									</div>
									<div class="mb-3">
										<label class="form-label" for="basic-default-phone">펫 종류</label> 
										<input type="text" id="basic-default-phone" readonly="readonly" class="form-control phone-mask" placeholder="고양이">
									</div>
									<div class="mb-3">
										<label class="form-label" for="basic-default-message">요청사항</label>
										<textarea id="basic-default-message" readonly="readonly" class="form-control" placeholder="Hi, Do you have a moment to talk Joe?">
										</textarea>
									</div>
									<button type="button" class="btn btn-primary">일지작성</button>
								</form>
							</div>
						</div>
					</div>

					<div class="col-xl" id="pet_today">
						<div class="card mb-4">
							<div class="card-header d-flex justify-content-between align-items-center">
								<h5 class="mb-0">오늘의 일정</h5>
							</div>
							<div class="card-body">
								<form>
									<div class="mb-3">
										<label class="form-label" for="basic-default-fullname">예약일시</label> 
										<input type="text" class="form-control" readonly="readonly" id="basic-default-fullname" placeholder="John Doe">
									</div>
									<div class="mb-3">
										<label class="form-label" for="basic-default-company">주소</label> 
										<input type="text" class="form-control" readonly="readonly" id="basic-default-company" placeholder="ACME Inc.">
									</div>
									<div class="mb-3">
										<label class="form-label" for="basic-default-message">요청사항</label>
										<textarea id="basic-default-message" readonly="readonly" class="form-control" placeholder="Hi, Do you have a moment to talk Joe?">
										</textarea>
									</div>
									<button type="button" class="btn btn-primary" id="bt_go">일정진행</button>
								</form>
							</div>
						</div>
					</div>

					<div class="col-xxl" id="pet_showlist" style="display: none;">
						<div class="card mb-4">
							<div class="card-header d-flex align-items-center justify-content-between">
								<h5 class="mb-0">전체 예약 일정</h5>
							</div>
							<div class="card-body">
								<form>
									<div class="card">
										<div class="table-responsive text-nowrap">
											<table class="table table-hover">
												<thead class="table-active text-center">
													<tr>
														<th>No</th>
														<th>예약일</th>
														<th>견종</th>
														<th>펫의 수</th>
													</tr>
												</thead>
												<tbody class="table-border-bottom-0 text-center">
													<tr> 
														<td>01</td>
														<td>2023-03-28</td>
														<td>소형견</td>
														<td>2마리</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Modal start -->
		<div class="modal fade" id="calendarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">휴무일을 설정하세요</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<input type="text" value="휴무" readonly class="form-control" id="calendar_content"> <label for="taskId" class="col-form-label">시작 날짜</label> <input type="date" class="form-control" id="calendar_start_date"> <label for="taskId" class="col-form-label">종료 날짜</label> <input type="date" class="form-control" id="calendar_end_date">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-warning" data-dismiss="modal" id="addCalendar">등록</button>
						<button type="button" class="btn btn-secondary" data-dismiss="modal" id="sprintSettingModalClose">취소</button>
					</div>
				</div>
			</div>
		</div>
		<!-- Modal end -->

		<!-- 일지모달 start -->
		<div class="modal fade" id="calendarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">휴무일을 설정하세요</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<input type="text" value="휴무" readonly class="form-control" id="calendar_content"> <label for="taskId" class="col-form-label">시작 날짜</label> <input type="date" class="form-control" id="calendar_start_date"> <label for="taskId" class="col-form-label">종료 날짜</label> <input type="date" class="form-control" id="calendar_end_date">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-warning" data-dismiss="modal" id="addCalendar">등록</button>
						<button type="button" class="btn btn-secondary" data-dismiss="modal" id="sprintSettingModalClose">취소</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 일지모달 end -->

		<!-- Main End -->

		<!-- / Layout page -->
	</div>

	<!-- Overlay -->
	<div class="layout-overlay layout-menu-toggle"></div>
	</div>
	<!-- / Layout wrapper -->


	<!-- head_link 2 -->
	<%@ include file="../inc/sneat/sneat_header_link2.jsp"%>
	<!-- head_link 2  End -->

</body>
<script>
		
        let nowMonth = new Date();  // 현재 달을 페이지를 로드한 날의 달로 초기화
        let today = new Date();     // 페이지를 로드한 날짜를 저장
        today.setHours(0, 0, 0, 0);    // 비교 편의를 위해 today의 시간을 초기화
        
        //날짜데이터에 언제든 접근하기 위해 현재 날짜들을 배열에 담아놓는다 
        let dayBoxList = [];

        //휴무를 담을 배열
        let holidayBox =[];
        
        // 달력 생성 : 해당 달에 맞춰 테이블을 만들고, 날짜를 채워 넣는다.
        function buildCalendar() {

            let firstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), 1);     // 이번달 1일
            let lastDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, 0);  // 이번달 마지막날

            let tbody_Calendar = document.querySelector(".Calendar > tbody");
            document.getElementById("calYear").innerText = nowMonth.getFullYear();             // 연도 숫자 갱신
            document.getElementById("calMonth").innerText = leftPad(nowMonth.getMonth() + 1);  // 월 숫자 갱신

            while (tbody_Calendar.rows.length > 0) {       // 이전 출력결과가 남아있는 경우 초기화
                tbody_Calendar.deleteRow(tbody_Calendar.rows.length - 1);
            }

            let nowRow = tbody_Calendar.insertRow();        // 첫번째 행 추가           

            for (let i = 0; i < firstDate.getDay(); i++) {  // 이번달 1일의 요일만큼
                let nowColumn = nowRow.insertCell();        // 열 추가
            }

            for (let nowDay = firstDate; nowDay <= lastDate; nowDay.setDate(nowDay.getDate() + 1)) {   // day는 날짜를 저장하는 변수, 이번달 마지막날까지 증가시키며 반복  

                let nowColumn = nowRow.insertCell(); // 새 열을 추가

                let newDIV = document.createElement("p");
                
                //날짜 p 태그에 함수 추가 
                newDIV.addEventListener("click", function(){
                	
                	deleteHoliday(this);
                	console.log(this.innerText);
                });

                dayBoxList.push(newDIV);

                newDIV.innerHTML = leftPad(nowDay.getDate()); // 추가한 열에 날짜 입력
                nowColumn.appendChild(newDIV);

                if (nowDay.getDay() == 6) {  // 토요일인 경우
                    nowRow = tbody_Calendar.insertRow();    // 새로운 행 추가
                }

                if (nowDay < today) {  // 지난날인 경우
                    newDIV.className= "pastDay";
                }else{ //이번달
                	newDIV.className= "futureDay";
                }
            }
        }

        // 이전달 버튼 클릭
        function prevCalendar() {
            nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() - 1, nowMonth.getDate());
            dayBoxList=[];
            buildCalendar();
            getHolidayList();
        }
        // 다음달 버튼 클릭
        function nextCalendar() {
            nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, nowMonth.getDate());
            dayBoxList=[];
            buildCalendar();
            getHolidayList();
        }

        // input값이 한자리 숫자인 경우 앞에 '0' 붙혀주는 함수
        function leftPad(value) {
            if (value < 10) {
                value = "0" + value;
                return value;
            }
            return value;
        }

        //모달창 생성
        function callModal() {

            $("#bt_holiday").click(function () {
                $("#calendarModal").modal("show");
            });
        }

        //모달 창 내 등록버튼
        function reigstModal() {
            $("#addCalendar").click(function () {
                registHoliday();
            });
        }

        //모달로 휴무 등록할때
        function registHoliday() {
            var content = $("#calendar_content").val();
            var start_date = $("#calendar_start_date").val();
            var end_date = $("#calendar_end_date").val();

            let strDate = new Date(start_date);
            let endDate = new Date(end_date);
            let nowDay = new Date();
            
            //내용 입력 여부 확인
            if (content == null || content == "") {
                alert("내용을 입력하세요.");
            } else if (start_date == "" || end_date == "") {
                alert("날짜를 입력하세요.");
            } else if (new Date(end_date) - new Date(start_date) < 0) {
                alert("종료일이 시작일보다 먼저입니다.");
            } else if (strDate < nowDay && endDate < nowDay || strDate< nowDay && endDate> nowDay) {
            	alert("당일 또는 현재 보다 이전 날짜는 선택 하실 수 없습니다");
            }
            
			if (strDate<=endDate && strDate>= nowDay && endDate>=nowDay) {
				
				//날짜 배열 제이슨 
	            for(let i=getOnlyDate(start_date);i<=getOnlyDate(end_date);i++){
		            let json={};
		            json["yy"]=getOnlyYear(start_date),
		            json["mm"]=getOnlyMonth(start_date),
		            json["dd"]=i
		            holidayBox.push(json);
	            }
            }else{
            	return;
            }
            
            $.ajax({
            	url:"/rest/holiday",
            	method:"post",
            	//json 보낼때는 스트링화  JSON.stringify(dateList);
            	data: 
            		JSON.stringify(holidayBox)
            	,
            	dataType:"json",
            	contentType:"application/json",
            	success:function(result, status, xhr){
            		alert(result.msg);
            		holidayBox=[];
            		getHolidayList();
            	},
            	error:function(xhr, status, err){
            		alert("중복된 날짜에 휴무는 불가능합니다");
            		location.reload();
            	}
            });
            console.log("휴일 리스트 ", holidayBox);
        }
        
        function getOnlyDate(str){
            // 2022-03-15 
            let arr=str.split("-");
            return parseInt(arr[2]);
        }
        
        
        function getOnlyYear(str){
            let arr=str.split("-");
            return parseInt(arr[0]);
        }
        
        
        function getOnlyMonth(str){
            let arr=str.split("-");
            return parseInt(arr[1]);
        }
        
		//모달창 속 달력에 날짜 제한 걸기
		function limitDate(){
			var now_utc = Date.now()
			var timeOff = new Date().getTimezoneOffset()*60000;
			var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
			var now= new Date();
			var last = new Date(2023,now.getMonth()+1, 0);
		    var lastDate= last.toISOString().split("T")[0];
			
			//console.log("last",lastDate);
			document.getElementById("calendar_start_date").setAttribute("min", today);
			document.getElementById("calendar_start_date").setAttribute("max", lastDate);
			document.getElementById("calendar_end_date").setAttribute("min", today);
			document.getElementById("calendar_end_date").setAttribute("max", lastDate);
		}
		
		function getHolidayList(){
			$.ajax({
				url:"/rest/holiday",
				method:"get",
				success:function(result,status,xhr){
					
					console.log(result);
					console.log(dayBoxList);
					
					//DB에 들어있는 날짜와 대조해서 날짜 색칠
					for (let i = 0; i < result.length; i++) {
						let yy = result[i].yy;
						let mm = result[i].mm;
						let dd = result[i].dd;
						
						console.log("yy",yy);
						console.log("mm",mm);
						
						console.log("입력된텍스트월",document.getElementById("calYear").innerText)
						
		                //월의 날짜만큼 반복문 돌리자 
		                for (let a = 1; a <= dayBoxList.length; a++) { //1,=
		                    if (dd == a + 1) {
		                        console.log(dd, "날은 휴가에욤");
		                        if(dayBoxList[a].className!="pastDay" && yy==document.getElementById("calYear").innerText && leftPad(mm)== document.getElementById("calMonth").innerText ){
			                        dayBoxList[a].classList.add("choiceDay");
		                        }
		                    }
		                }
		            }
				}
			});
		}
		
		
		//날짜정보를 가진 p 태그의 DOM을 넘겨받음
		function deleteHoliday(obj){
			
			if(obj ==undefined || obj.className=="pastDay" || obj.className=="futureDay" ){
				return;
			}
			if(confirm(obj.innerText+"날을 삭제하실래요?")){
				 obj.classList.remove("choiceDay");
				 console.log("nowMonth.getFullYear",nowMonth.getFullYear());
				 console.log("nowMonth.getMonth",nowMonth.getMonth()+1);
				 
				 let yy= String(nowMonth.getFullYear());
				 let mm= String(nowMonth.getMonth()+1);
				 let dd= obj.innerText;
				 
				 let day=dd.replace(/(^0+)/, "");
				 
				 let json={
						 yy:yy,
						 mm:mm,
						 dd:day
					 };
				 
				 console.log("json은?",json);
				 
				 $.ajax({
					 url:"/rest/holiday",
					 method:"delete",
					 dataType:"json",
					 contentType:"application/json",
					 data:JSON.stringify(json),
					 success:function(result, status, xhr){
						 
					 }
				 });
			}
		}
		
        //onload
        $(function () {
        	getHolidayList();
        	limitDate();
            buildCalendar();
            callModal();
            reigstModal();
            deleteHoliday();
            
            $("#bt_go").click(function(){	
            	
            	if(confirm("일정을 시작하시겠습니까?")){
	            	$("#pet_today").hide();
	            	$("#pet_showlist").hide();
	            	$("#pet_live").show();
            	}
            	
            	$("#bt_go").attr("disabled",true);
            	
            });
            
            $("#bt_res").click(function(){
            	$("#pet_today").hide();
            	$("#pet_live").hide();
            	$("#pet_showlist").show();
            });
            
            $("#bt_today").click(function(){
            	$("#pet_today").show();
            	$("#pet_live").hide();
            	$("#pet_showlist").hide();
            });
            
            $("#bt_live").click(function(){
            	
            	if(document.getElementById("bt_go").disabled==true){
	            	$("#pet_today").hide();
	            	$("#pet_live").show();
	            	$("#pet_showlist").hide();
            	}
            });


        });

    </script>
</html>
