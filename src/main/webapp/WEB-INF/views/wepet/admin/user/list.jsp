
<%@page import="com.edu.wepet.domain.Sns"%>
<%@page import="com.edu.wepet.domain.Email"%>
<%@page import="com.edu.wepet.domain.Member"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	List<Member> memberList = (List)session.getAttribute("memberList"); 
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


    <title>전체 회원 조회</title>
	<style type="text/css">
	 tr, td {
	    text-align: center;
	  }
	</style>
    <meta name="description" content="" />
    
	<%@ include file="../inc/sneat/sneat_header_link.jsp"%>
  </head>

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
					                <h3 class="card-title">일반회원 및 전체 조회</h3>
					                <div class="card-tools">
					                    <div class="input-group input-group-sm" style="width: 450px">
					                        <input type="text" name="table_search" class="form-control float-right" style="text-align:left"  placeholder="Search">
					
					                        <div class="input-group-append">
					                            <button type="submit" class="btn btn-default">
					                                <i class="fas fa-search">검색</i>
					                            </button>
					                        </div>
					                    </div>
					                </div>
					            </div>
					            <!-- /.card-header -->
					            <div class="card-body table-responsive p-0" id="app1">
					                <table class="table table-hover text-nowrap">
					                
					                    <thead>
					                        <tr>
					                            <th>No</th>
					                            <th>SNS 가입</th>
					                            <th>회원명(닉네임)</th>
					                            <th>Email</th>
					                        </tr>
					                    </thead>
										<!-- 목록나올곳 -->
												<template v-for="member in memberList">
												<row :key="member.member_idx" :obj="member"/>                                       
						                    </template>
						                    
					                    </tbody>
					                </table>
					                
					                
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
		</div>
		
	<!-- 내용채우기 end -->



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
		 	<td>{{obj.member_idx}}</td>
		 	<td>{{obj.sns.sns_type}}</td>
	        <td>{{obj.nickname}}</a></td>
	        <td>{{obj.email.emailaddr}}</td>
	    </tr>
		`, 
		props:['obj'],
		data(){
			return{
				member:this.obj
			};
		}
	};
	
		app1=new Vue({
			el:"#app1", 
			components:{
				row
			},
			data:{
				memberList:[]
			}
		});


//목록가져오기 
function getList(){
	$.ajax({
		url:"/admin/rest/member",
		type:"get",
		success:function(result, status, xhr){
			console.log("서버에서 전송된 결과 : ", result);
			app1.memberList=result;
		}
	});	
}

$(function () {
	getList();
});
</script>
  </body>
</html>
