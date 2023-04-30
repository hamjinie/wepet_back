
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<!-- beautify ignore:start -->
<html lang="en" class="light-style layout-menu-fixed" dir="ltr"
	data-theme="theme-default" data-assets-path="../assets/"
	data-template="vertical-menu-template-free">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

<title>어드민 메인 페이지</title>

<meta name="description" content="" />

<%@ include file="./inc/sneat/sneat_header_link.jsp"%>
</head>

<body>
	<!-- navbar  -->
	<%@ include file="./inc/sneat/sneat_navbar_link.jsp"%>
	<!-- navbar end -->

	<!-- Layout container -->
	<div class="layout-page">
		<!-- Navbar -->

		<!-- 상단, 서치바 -->
		<%@ include file="./inc/sneat/sneat_searchbar_link.jsp"%>
		<!-- 서치바 End -->


			<div class="container mt-3 mb-3">
				<table class="table" style="table-layout: fixed">
					<thead>
						<tr>
							<th>No</th>
							<th>야쌉~</th>
							<th>가능~</th>
						</tr>
					</thead>
					
					<tbody>
						<tr>
							<td>John</td>
							<td>Doe</td>
							<td>john</td>
						</tr>
						<tr>
							<td>Mary</td>
							<td>Moe</td>
							<td>mary</td>
						</tr>

					</tbody>
				</table>
			</div>



		<!-- / Layout page -->
	</div>

	<!-- Overlay -->
	<div class="layout-overlay layout-menu-toggle"></div>
	</div>
	<!-- / Layout wrapper -->

	<!-- head_link 2 -->
	<%@ include file="./inc/sneat/sneat_header_link2.jsp"%>
	<!-- head_link 2  End -->

</body>
</html>
