
<%@page import="com.edu.wepet.domain.SitterApply"%>
<%@page import="com.edu.wepet.domain.PetSitter"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	List<PetSitter> petsitterList = (List)request.getAttribute("petsitterList"); 
	List<SitterApply> applyList = (List)request.getAttribute("applyList"); 
%>
<!DOCTYPE html>
<!-- beautify ignore:start -->
<html
  lang="en"
  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="../assets/"
  data-template="vertical-menu-template-free"
>
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

<style type="text/css">
	tr, td {
		text-align: center;
	}
	
	button {

		width: 60px;
	}
</style>


<title>펫시터회원 조회</title>

    <meta name="description" content="" />
    
	<%@ include file="../inc/sneat/sneat_header_link.jsp"%>
  </head>
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <body>
     <!-- navbar 카테고리부분 -->
	<%@ include file="../inc/sneat/sneat_navbar_link.jsp"%>
  <!-- navbar end -->

        <!-- Layout container -->
        <div class="layout-page">
          <!-- Navbar -->
	
	<!-- 상단, 서치바처럼 생긴 곳 -- 어드민 로그인상태 나오는 곳 아직 더 꾸밀필요가 있는듯 -->
		<%@ include file="../inc/sneat/sneat_searchbar_link.jsp" %>
		<!-- 서치바인듯 아닌듯 End -->
		
	<!-- 아무것도 안했으니까영.....흑흑...리스트 없네여....하하하하
	이제 여기가 뭐 나올 곳들이랍니다! content 마구마구마구 채우기~~~ 
	내용채우기 start-->
		<!-- Main content -->
			<section class="content">
				<div class="container-fluid" style="margin-top: 10px">
					<div class="row">
					    <div class="col-12">
					        <div class="card">
					            <div class="card-header" align="right">
					                <h3 class="card-title text-">펫시터 회원 목록</h3>
					                <div class="card-tools float-right" >
					                    <div>
					                        <div class="input-group-append">
					                        	<%for(SitterApply obj : applyList){ %>
					                            <button type="button" class="btn btn-primary btn-sm float-right" id="bt_apply" onClick="send(<%=obj.getSitter_apply_idx()%>)"><%=obj.getApply_type() %></button>
												<%} %>
					                        </div>
					                    </div>
					                </div>
					            </div>
					            <!-- /.card-header -->


							<div class="card-body table-responsive p-0"  id="app1">
									<form id="form1">
									<input type="hidden" name="sitterApply.sitter_apply_idx">
					                <table class="table table-hover text-nowrap">
					                    <thead>
					                        <tr>
					                        	<th>__</th>
					                            <th>회원번호</th>
					                            <th>회원명(닉네임)</th>					                            
					                            <th>은행</th>
					                            <th>계좌</th>
					                            <th>경험유무</th>
					                            <th>활동상태</th>
					                        </tr>
					                    </thead>
					                       <!-- 펫시터목록올곳 -->
					                		<template v-for="petsitter in petsitterList">
												<row :key="petsitter.petsitter_idx" :obj="petsitter"/>                                       
						                    </template>
					                        
					                    </tbody>
					                </table>
					                </form>
					                
					            </div>
					            <!-- /.card-body -->
					        </div>
					        <!-- /.card -->
					    </div>
					</div>
				
				</div>
				<!-- /.container-fluid -->
			
			</section>
			<!-- /.content -->


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
let app1;

const row={
	template:` 
		<tr>
			<td><input type="checkbox" name="member_idx" :value="petsitter.member.member_idx"></td> 
	        <td>{{petsitter.petsitter_idx}}</td>
	        <td>{{petsitter.sitter_nickname}}</td>
	        <td>{{petsitter.bank}}</td>
	        <td>{{petsitter.accountNum}}</td>
	        <td>{{petsitter.exp}}</td>
	        <td>{{petsitter.sitterApply.apply_type}}</td>
	    </tr>
	`, 
	props:['obj'],
	data(){
		return {
			petsitter:this.obj			
		};	
	}
};

	app1=new Vue({
		el:"#app1", 
		components:{
			row
		},
		data:{
			petsitterList:[]
		}
	});



//목록가져오기 
function getList(){
	$.ajax({
		url:"/admin/rest/petsitter",
		type:"get",
		success:function(result, status, xhr){
			console.log("서버에서 전송된 결과 : ", result);
			app1.petsitterList=result;
			console.log("잘 들어왔나", result);
		}
	});	
}

function send(n){
	$("#form1 input[name='sitterApply.sitter_apply_idx']").val(n);
	
	//날리자 , 누가 member_idx로 전송, 어던 상태인지.sitterApply.sitter_apply_idx로...전송 .
	$("#form1").attr({
		action:"/admin/petsitter/apply",
		method:"post"
	});
	$("#form1").submit();
	
}

$(function(){
	getList();
	
});
</script>
  </body>
</html>
