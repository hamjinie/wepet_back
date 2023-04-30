<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<!-- beautify ignore:start -->
<html lang="en" class="light-style layout-menu-fixed" dir="ltr"
	data-theme="theme-default" data-assets-path="resources/sneat/assets/"
	data-template="vertical-menu-template-free">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

<title>관리자-수수료 페이지</title>

<meta name="description" content="" />

<%@ include file="../inc/sneat/sneat_header_link.jsp"%>
  <!-- Vue.js ver2 -->
  <script src="https://cdn.jsdelivr.net/npm/vue@2.7.14/dist/vue.min.js"></script>
  
<script type="text/javascript" src="/resources/js/Pager.js"></script>	

</head>

<body>
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
	<!-- navbar  -->
	<%@ include file="../inc/sneat//sneat_navbar_link.jsp"%>
	<!-- navbar end -->

	<!-- Layout container -->
	<div class="layout-page">
		<!-- Navbar -->

		<!-- 상단, 서치바 -->
		<%@ include file="../inc/sneat//sneat_searchbar_link.jsp"%>
		<!-- 서치바 End -->

          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">관리자 페이지/</span> 펫시터 수수료 지급 관리</h4>

              <!-- Basic Layout & Basic with Icons -->
              <div class="row"  id="app1">

                <!-- Basic with Icons -->
                <div class="col-xxl">
                  <div class="card mb-4">
                    <div class="card-header d-flex align-items-center justify-content-between">
                      <h5 class="mb-0">지급 수수료 펫시터 리스트</h5>
                      <small class="text-muted float-end">매월 15일 일괄 지급</small>
                    </div>
                    <div class="card-body">
                      <form>
						<div class="card">
						<div class="row">
							<div class="col-sm-4">
				                <h5 class="card-header">2023년 3월</h5>							
							</div>
                            <div class="col-sm-3">
                               <div class="form-floating">
                                   <select class="form-control  border-1 bg-light text-center" name="dropDown1" id="dropDown1" onchange="ChangeSecondDropContent(this, 'dropDown2');">
								        <option value="0" selected>조회</option> 
								        <option value="1">건당 조회</option> 
								        <option value="2">펫시터별 조회</option> 
									</select>
								</div>
							</div>
                            <div class="col-sm-3">
                               <div class="form-floating">
                                    <select class="form-control  border-1 bg-light text-center" name="dropDown2" id="dropDown2">
								        <option value="3" selected>상위 선택지를 먼저 선택해주세요</option> 
								        <option value="4"></option> 
								        <option value="5"></option> 
								        <option value="6"></option> 
								        <option value="7"></option> 
									</select> 
								</div>
							</div>
                            <div class="col-sm-2 text-center">
                               <div class="form-floating">
									<button type="button" class="btn btn-outline-primary" id="bt_select">조회하기</button>
								</div>
							</div>
						</div>
			                <div class="table-responsive text-nowrap">
			                  <table class="table table-hover">
			                    <thead class="table-active text-center">
			                      <tr>
			                        <th>선택</th>
			                        <th>펫시터 이름</th>
			                        <th>총 수익</th>
			                        <th>수수료 계산</th>
			                        <th>지급되어야할 총 수수료</th>
			                        <th>지급된 총 수수료</th>
			                        <th>정산 상태</th>
			                        <th>개별관리</th>
			                      </tr>
			                    </thead>
			                    <tbody class="table-border-bottom-0 text-center">
			                    
									<template v-for="(review, i) in currentList">
										<product :key="review" :obj="review" :num="num-i"/>				                  	
				                  	</template>
				                  	<tr>
				                  		<td class="text-center" colspan="8" id="paging-area"></td>
				                  	</tr>
									
			                    </tbody>
			                  </table>
			                </div>
			              </div>
                        <div class="row justify-content-end mt-3">
                          <div class="col text-end">
                            <button type="button" class="btn btn-primary" id="bt_all">선택 일괄 정산</button>
                          </div>                          
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- / Content -->








            <div class="content-backdrop fade"></div>
          </div>
          </div>












		<!-- / Layout page -->
	</div>

	<!-- Overlay -->
	<div class="layout-overlay layout-menu-toggle"></div>
	</div>
	<!-- / Layout wrapper -->


	<!-- head_link 2 -->
	<%@ include file="../inc/sneat//sneat_header_link2.jsp"%>
	<!-- head_link 2  End -->

<script type="text/javascript">

let pager=new Pager(); //인스턴스 생성
let currentPage=1; //비동기로 새로고침 안되려면 js의 전역변수로 나와있어야함

let app1;
let key=0;

var category = new Array ();
category['건당 조회'] = ['전체 리스트', '정산 완료 리스트', '정산 미완료 리스트'];
category['펫시터별 조회'] = ['펫시터별 수익 합계 조회', '정산 완료 금액 합계 조회', '정산 미완료 금액 합계 조회'];


const product={
	template:`    	
        <tr>
	      	<td><input class="form-check-input" type="checkbox" value="" id="defaultCheck1" name="defaultCheck1" v-on:click=""></td>
	        <td><i class="fab fa-angular fa-lg text-danger me-3"><strong>{{json.petSitter.sitter_nickname}}</strong></i></td>                        
	        <td>{{json.earnings}} 원</td>
	        <td>{{json.earnings}} x 10</td>                        
	        <td>{{json.earnings*0.1}} 원</td>        
	        <td>{{json.gottenfee}} 원</td>                        
            <td v-if="json.status+'==0'">{{(json.earnings*0.1)-json.gottenfee}} 원 정산 미완료</td>
        	<td v-else>정산 완료</td>        
	        <td><button type="button" class="btn btn-outline-primary" id="bt_caseby" v-on:click="givefee(json)">개별 지급</button></td>                        
      </tr>
	`,
	props:['obj', 'num'], 
	data(){ 
		return{
			json:this.obj,
			n:this.num
		};
	},
	methods:{
		givefee:function(json){
			//console.log(this.json.sales_idx);
			let gottenfee=this.json.gottenfee;
			let getfee=(this.json.earnings*0.1)-json.gottenfee
			let sales_idx=this.json.sales_idx;

			let allData = {"gottenfee": gottenfee, "sales_idx": sales_idx, "getfee": getfee };
			//console.log(allData);
			
			if(!confirm("총 "+getfee+"원 정산 하시겠습니까?")){
				return; 
			}
			
			$.ajax({
				url:"/admin/rest/giveFee",
				type:"post",
				data: allData,
				success:function(result, status, xhr){
					console.log(result.msg);

					getList();
					
				},
				error:function(xhr, status, err){
					console.log("에러에요"+err);
				}
			});
			
		}
	}	
};

function init(){	
	app1=new Vue({
		el:"#app1",
		components:{
			product
		},
		data:{
			count:5,
			salesList:[], //전체 배열
			currentList:[], //페이지당 보여질 배열
			num:0 //페이지당 시작 번호를 뷰 컴포넌트에서 접근할 수 있도록
		}
	});			
}

function pageLink(n) {
	//서버에서 가져온 데이터를 대상으로 페이징 로직을 적용해보기
	pager.init(app1.salesList, n); //원하는페이지만 넘겨받자	
	
	//console.log("totalRecord =" , pager.totalRecord);
	//console.log("pageSize =" , pager.pageSize);
	//console.log("totalPage =" , pager.totalPage);
	//console.log("blockSize =" , pager.blockSize);
	//console.log("currentPage =" , pager.currentPage);
	//console.log("firstPage =" , pager.firstPage);
	//console.log("lastPage =" , pager.lastPage);
	//console.log("curPos =" , pager.curPos);
	//console.log("num =" , pager.num);
	
	app1.num=pager.num;

	app1.currentList.splice(0, app1.currentList.length); //싹 비우고 
	for(let i=pager.curPos; i<pager.curPos+pager.pageSize; i++){ //채워넣기
		
		if(pager.num<1)break;
		pager.num--;
		
		app1.currentList.push(app1.salesList[i]);
	}
}

function paging() {
	//넘버링 출력
	$("#paging-area *").remove();
	for(let i=pager.firstPage; i<pager.lastPage; i++){
		if(i>pager.totalPage)break; 
		$("#paging-area").append("<a href='javascript:pageLink("+i+")' style='margin:3px'>"+i+"</a>");
	}       	

}

function getList() {
	$.ajax({
		url:"/admin/rest/fee",
		type:"get",
		success:function(result, status, xhr){
			app1.salesList=result;
			//console.log(result);			
			
			pageLink(currentPage); 
			
			paging();
			
		}
	});
}	

function ChangeSecondDropContent (select1, select2) { 

    var topCate = select1.options[select1.selectedIndex].text;
    var select2 = document.getElementById (select2);

    // removes all options from select 2
    while (select2.options.length) {
        select2.options.remove (0);
    }

    // adds new options to select 2
    var subArray = category[topCate];

    if (subArray) {
        for (var i=0; i < subArray.length; i++) {
            var option = new Option (subArray[i], i);
            select2.options.add (option);
        }
    }
} 

function selectedList() {
	let val1=$("#dropDown1 option:selected").val();
	let val2=$("#dropDown2 option:selected").val();

	let allData = { "val1": val1, "val2": val2 };
	let path=null;
	let type=null;
	
	if(val1==1 && val2==0){
		path="/admin/rest/fee";
		type="get";
	}else if(val1==2 && val2==0){
		path="/admin/rest/feeSum";
		type="get"
	}else{
		path="/admin/rest/feeList";
		type="post"
	}
	//console.log("경로",path);
	
	$.ajax({
		url:path,
		type:type,
		data:allData,
		success:function(result, status, xhr){
			app1.salesList=result;
//			console.log(result);			
			
			pageLink(currentPage); 
			paging();
				
		}
	});	
	
}

function giveselected() {
	let a=$('input:checkbox[id="defaultCheck1"]').is(":checked") == true
	
	$('input:checkbox[name="defaultCheck1"]').each(function() {

//	      this.checked = true; //checked 처리

	      if(this.checked){//checked 처리된 항목의 값

	            alert(this.index); 

	      }

	 });
	
	//console.log(a);
}

$(function(){	
	init();		
	getList();
	
	$("#bt_select").click(function(){
		selectedList();
	});
	
	$("#bt_all").click(function(){
		giveselected();
	});
			
});	

</script>
</body>
</html>
