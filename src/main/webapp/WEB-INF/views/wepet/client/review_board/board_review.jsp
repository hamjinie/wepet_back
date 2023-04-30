<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">


<head>
<meta charset="utf-8">
<title>펫시터 후기 게시판</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">


<!-- Header Start -->
<%@ include file="../inc/gardener/inc/header_link.jsp"%>
<!-- Header End -->

<!-- Icons. Uncomment required icon fonts -->
<link rel="stylesheet"	href="/resources/sneat/assets/vendor/fonts/boxicons.css" />




  <!-- Vue.js ver2 -->
  <script src="https://cdn.jsdelivr.net/npm/vue@2.7.14/dist/vue.min.js"></script>
  
<script type="text/javascript" src="/resources/js/Pager.js"></script>	

<!-- include summernote css/js -->
<script src="/resources/summernote/js/summernote-lite.js"></script>
<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">

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

	<!-- Quote Start -->
	<div class="container-fluid py-5">
		<div class="contain" id="app1">
			<div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s"
				style="max-width: 500px;">
				<p class="fs-1 fw-bold text-primary">Review</p>
				<br>
				<p class="fs-5 mb-5">----</p>
			</div>
			<div class="row justify-content-center">
				<div class="col-lg-9">
					<div class="bg-light rounded p-4 p-sm-5 wow fadeInUp shadow p-4 mb-4"
						data-wow-delay="0.1s">
						<div class="row g-3">


							<div class="cart_title mt-5">
								<h3 class="ttl-h2">펫시터 이용 후기 (50)</h3>
								<div class="cart_title">
									<span>후기(30자 이상)를 작성해주시면 마일리지를 드립니다. </span>
									<hr>
								</div>
								<div class="subtitle m-5">
									<div class="">
										<h4 style="color: black">후기 총 평점</h4>
										<div class="row">
											<div class="col-10">
												<p>
												<h2 style="display: inline;">★★★★☆ 4.6</h2>
												<h2 style="color: gray; display: inline;">/ 5</h2>
												<h6 style="color: gray; display: inline;">총 50건의 이용 후기</h6>
												</p>
											</div>
											<div class="col-2 justify-content-end">
												<p>
							                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal">
							                          	후기 등록하기
							                        </button>
												</p>
												
											</div>

										</div>
									</div>



									<div class="col-md">

										<div id="carouselExample" class="">

											<div class="carousel-inner">
											
																					
												<div class="carousel-item  active">


														<div class="">
															<div class="table-responsive text-nowrap mt-3">
													<table class="table table-hover" style="height: 500px">
																	<thead class="table-active" style="height: 50px">
																		<tr>
																			<th></th>
																			<th><input type="radio">포토리뷰만</th>
																			<th style="text-align: right;">최근 등록순 / 추천순 / 별점
																				높은순 /별점 낮은순</th>
																			<th></th>
																		</tr>
																	</thead>
																	<tbody class="table-border-bottom-0">
																		<template v-for="(review, i) in currentList">
																			<product :key="review" :obj="review" :num="num-i"/>				                  	
													                  	</template>
													                  	<tr>
													                  		<td class="text-center" colspan="6" id="paging-area"></td>
													                  	</tr>
																	</tbody>
																</table>
															</div>
														</div>
													
												</div>	
											</div>
										</div>
									</div>
									<ul class="pagination justify-content-center">
									</ul>
								</div>
							</div>

                        <!-- Modal -->
                       <form id="form1" onsubmit="postForm()">
                        <div class="modal fade" id="modal" tabindex="-1" style="display: none;" aria-hidden="true">
                          <div class="modal-dialog modal-dialog-centered modal-xl" role="document">
                            <div class="modal-content">
                              <div class="modal-header">
                                <h5 class="modal-title" id="modalCenterTitle">후기 작성하기</h5>
                                <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                                  Close
                                </button>
                              </div>
                              <div class="modal-body">
                              	  <div class="row g-3 m-3">	                        
		                            <div class="col-sm-6">
		                                <div class="form-floating">
		                                    <input type="text" class="form-control border-0 bg-light" name="title" id="title" placeholder="Gurdian Name">
		                                    <label for="gname">작성자</label>
		                                </div>
		                            </div>
		                            <div class="col-sm-6">
		                                <div class="form-floating">
		                                      <select class="form-control  border-0 bg-light" name="star" id="star">
											    <option></option>
											    <option value="1">★</option>
											    <option value="2">★★</option>
											    <option value="3">★★★</option>
											    <option value="4">★★★★</option>
											    <option value="5">★★★★★</option>
											  </select>
		                                    <label for="gname">별점</label>
		                                </div>
		                            </div>
                              	</div>
                              	<textarea name="content" style="display: none;"></textarea>
						      	<div id="summernote" name="content" id="content"></div>
                              </div>
                              <div class="modal-footer">
                                <button type="button" class="btn btn-primary" id="bt_regist">등록</button>
                              </div>
                            </div>
                          </div>
						</div>
						</form>

						</div>
					</div>
				</div>
				<div class="col-lg-8">
					<div class="demo-inline-spacing"></div>
				</div>
			</div>
			<!-- Quote End -->


		</div>
	</div>


	<!--  Sidebar Start -->
	<!--  Sidebar End-->


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
let pager=new Pager(); //인스턴스 생성
let currentPage=1; //비동기로 새로고침 안되려면 js의 전역변수로 나와있어야함

let app1;
let key=0;

let imgPath;

const product={
	template:`
		<tr>
		<td class="align-middle" colspan="">{{n}}</td>
		<td class="align-middle" colspan="">
			<img v-bind:src="'/resources/summernote/fileupload/'+json.imgPath" alt="collapse-image" height="125" class="me-4 mb-sm-0 mb-2" />
		</td>
		<td class="align-middle" colspan="2">
				<a class="nav-link active"  
					href="" 
					data-bs-toggle="collapse"
						v-bind:data-bs-target="'#collapseExample'+n"
					aria-expanded="false"
						v-bind:aria-controls="'collapseExample'+n">
					{{json.title}}</a>

				<div class="collapse" v-bind:id="'collapseExample'+n">
					<div class="d-grid d-sm-flex p-3 border">

						<span>{{json.title}}</span>
					</div>
				</div>

			</div>
		
		</td>
	</tr>
	`,
	props:['obj', 'num'], 
	data(){ 
		return{
			json:this.obj,
			n:this.num
		};
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
			boardreviewList:[], //전체 배열
			currentList:[], //페이지당 보여질 배열
			num:0 //페이지당 시작 번호를 뷰 컴포넌트에서 접근할 수 있도록
		}
	});			
}

function pageLink(n) {
	//서버에서 가져온 데이터를 대상으로 페이징 로직을 적용해보기
	pager.init(app1.boardreviewList, n); //원하는페이지만 넘겨받자
	
	console.log("totalRecord =" , pager.totalRecord);
	console.log("pageSize =" , pager.pageSize);
	console.log("totalPage =" , pager.totalPage);
	console.log("blockSize =" , pager.blockSize);
	console.log("currentPage =" , pager.currentPage);
	console.log("firstPage =" , pager.firstPage);
	console.log("lastPage =" , pager.lastPage);
	console.log("curPos =" , pager.curPos);
	console.log("num =" , pager.num);
	
	app1.num=pager.num;
	//넘겨받은 페이지 번호를 이용하여, 해당 페이지에 보여질 배열을 생성 후 
	//currentList에 대입할거임 (Vue의 변수인 currentList만 제어하면 디자인은 자동으로 변경되니까!! 뷰의 핵심!)
	app1.currentList.splice(0, app1.currentList.length); //싹 비우고 
	for(let i=pager.curPos; i<pager.curPos+pager.pageSize; i++){ //채워넣기
		
		//num이 1보다 작아지면 멈춤
		if(pager.num<1)break;
		pager.num--;
		
		//전체 배열에서 일부 배열로 옮겨 심기
		app1.currentList.push(app1.boardreviewList[i]);
	}
}

//서버에서 상품목록 가져오기 
function getList() {
	$.ajax({
		url:"/rest/review",
		type:"get",
		success:function(result, status, xhr){
			//서버에서 가져온 json 배열을 뷰의 템플릿이 바라보고 있는 productList에 대입만하면 디자인은 알아서 변경된다.
			//개발자는 데이터 제어에만 집중하면 됨. 디자인 신경꺼라 ㅋ
			app1.boardreviewList=result;
			console.log(result);			
			
			pageLink(currentPage); //페이징 처리 계산 수행 (result 전체 말고, 현재페이지만 넘겨주자)
			
			//넘버링 출력
			for(let i=pager.firstPage; i<pager.lastPage; i++){
				if(i>pager.totalPage)break; //내가 가진 페이지 수를 넘어서면 반복문 빠져나오기
				$("#paging-area").append("<a href='javascript:pageLink("+i+")' style='margin:3px'>"+i+"</a>");
			}
		}
	});
}	


function postForm() {
    $('textarea[name="content"]').val($('#summernote').summernote('code'));
}

function registReview() {
	let title=$("#title").val();
	//let content=$('textarea[name=content]').val();
	let star=$("#star :selected").val();
	
	//값 가져오기
    var content = $('#summernote').summernote('code');        //썸머노트(설명)
    //console.log("summernoteContent : " + summernoteContent);	
	//console.log("title", title, "content", content, "imgPath", imgPath);
	
	
	
	let allData = { "title": title,  "star": star, "content": content, "imgPath": imgPath};


	$("#form1").attr({
		action:"/registreview",
		method:"post",
		data:allData
	});	
	$("#form1").submit();
	
	

	
	

	
	

	
}

$(document).ready(function() {
    $(document).ready(function() {
		$('#summernote').summernote({
			height : 400,
			lang: "ko-KR",
			minHeight : null,
			maxHeight : null,
			focus : true,
	           callbacks : { //여기 부분이 이미지를 첨부하는 부분
	               onImageUpload : function(files, editor,
	               welEditable) {
	               for (var i = files.length - 1; i >= 0; i--) {
	               uploadSummernoteImageFile(files[i],
	               this);
	               		}
	               	}
	              }
		});
    });
});

    
function uploadSummernoteImageFile(file, el) {
	data = new FormData();
	data.append("file", file);
	$.ajax({
		data : data,
		type : "POST",
		url : "uploadSummernoteImageFile",
		contentType : false,
		enctype : 'multipart/form-data',
		processData : false,
		success : function(data) {
			$(el).summernote('editor.insertImage', data.url);
			console.log(data.url);
			
			imgPath=data.url;
		}
	});
}




$(function(){		
	init();		
	getList();
	
	$("#bt_regist").click(function(){
		registReview();
		
	});
			
});	

</script>
</body>
</html>