<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1,
	      shrink-to-fit=no">
<title>Thangnnc Assignment</title>
<%@include file="/common/css.jsp"%>
<style type="text/css">
.edit-user {
	font-size: 18px !important;
}

.edit-user .edit {
	background: #191c24;
	color: blue;
	padding: 3px;
	border-radius: 3px;
}

.edit-user .edit:hover {
	background: white;
}

.edit-user .remove {
	background: #191c24;
	color: red;
	padding: 3px;
	border-radius: 3px;
	padding: 3px;
}

.edit-user .remove:hover {
	background: white;
}

td {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
</style>
</head>

<body>
	<div class="container-scroller">
		<!-- sidebar -->
		<%@include file="/view/admin/fragments/sidebar.jsp"%>
		<!-- end sidebar -->

		<div class="container-fluid page-body-wrapper">
			<!-- navbar -->
			<%@include file="/view/admin/fragments/navbar.jsp"%>
			<!-- end navbar -->

			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row">
						<div class="col-12 grid-margin">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Favorite Videos</h4>
									
									<div class="">
										<table class="table" style="table-layout: fixed">
											<thead>
												<tr>
													<th width="5%">Stt</th>
													<th width="15%">Href</th>
													<th width="30%">Title</th>
													<th width="10%">Favorite</th>
													<th width="20%">First Date</th>
													<th width="20%">Last Date</th>
												</tr>
											</thead>
											<tbody>
												<c:set var="stt" value="${(pageSelect-1) * 5}" />
												<c:forEach var="video" items="${list}">
													<c:set var="stt" value="${stt + 1}" />
													<tr>
														<td>${stt}</td>
														<td><img
															src="https://img.youtube.com/vi/${video.href}/maxresdefault.jpg"
															alt="" /> <span class="pl-2">${video.href}</span></td>
														<td>${video.title}</td>
														<td>${video.favorites}</td>
														<td>
															<div class="badge badge-outline-warning">${video.firstDate}</div>
														</td>
														<td>
															<div class="badge badge-outline-success">${video.lastDate}</div>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
					<form id="page" action="" method="post" class="pagination">
						<button onclick="selectNum(${pageSelect},'prev')">&laquo;</button>
						<c:forEach var="index" begin="1" end="${page}">
							<c:choose>
								<c:when test="${pageSelect == index}">
									<button type="submit" onclick="selectNum(${index},'')"
										class="active">${index}</button>
								</c:when>
								<c:otherwise>
									<button type="submit" onclick="selectNum(${index},'')">${index}</button>
								</c:otherwise>
							</c:choose>

						</c:forEach>
						<button onclick="selectNum(${pageSelect},'next')">&raquo;</button>
					</form>
				</div>
				<!-- content-wrapper ends -->
				<!-- footer -->
				<%@include file="/view/admin/fragments/footer.jsp"%>
				<!-- end footer -->
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->

	<%@include file="/common/js.jsp"%>

	<script>
		if ("${message}" != "") {
			alert("${message}");
		}
		
		function selectNum(num,check) {
			if(check == "prev" && num > 1){
				document.getElementById('page').action = "${uri}/admin/favorite-video?page="+(num-1);
			}else if(check == "next" && num < parseInt("${page}")){
				document.getElementById('page').action = "${uri}/admin/favorite-video?page="+(num+1);
			}else document.getElementById('page').action = "${uri}/admin/favorite-video?page="+num;
			
		}
	</script>
</body>

</html>