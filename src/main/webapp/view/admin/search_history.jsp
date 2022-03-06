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
				<div class="content-wrapper" style="text-align: center;">
					<div class="row">
						<div class="col-12 grid-margin">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Search</h4>
									<form action="${uri}/admin/histories" method="post">
										<div class="form-group">
											<div class="input-group">
												<select class="form-control" name="typeSearch"
													onchange="change()"
													style="width: 20%; color: #fff; border: 1px solid #fff;">
													<option value="1" selected>Find All Histories</option>
													<option value="2">Find History By User</option>
												</select> <input class="form-control" name="username"
													style="width: 20%; color: #fff; border: 1px solid #fff; display: none;">
												<div class="input-group-append">
													<button class="btn btn-sm btn-primary"
														style="border: 1px solid #fff;" type="submit">Search</button>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<div id="result" class="row" style="display: none">
						<div class="col-md-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Report List</h4>
									<div class="table-responsive">
										<table class="table">
											<thead>
												<tr>
													<th>Stt</th>
													<th>Username</th>
													<th>Poster</th>
													<th>Page</th>
													<th>Date</th>
												</tr>
											</thead>
											<tbody>
												<c:set var="stt" value="0" />
												<c:forEach var="history" items="${list}">
													<c:set var="stt" value="${stt + 1}" />
													<tr>
														<td>${stt}</td>
														<td>${history.userH.username}</td>
														<td>
															<img alt="" src="https://img.youtube.com/vi/${history.videoH.href}/maxresdefault.jpg"
																style="width: 75px; height: 50px; border-radius: 5px;">
														</td>
														<td>
															<a href="${history.loginPage}" target="_blank">
																${history.loginPage}
															</a>
														</td>
														<td>
															<div class="badge badge-outline-success">${history.loginDate}</div>
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
						<button>&laquo;</button>
						<c:forEach var="index" begin="1" end="${page}">
							<c:choose>
								<c:when test="${pageSelect == index}">
									<button type="submit" onclick="selectNum('${index}')"
										class="active">${index}</button>
								</c:when>
								<c:otherwise>
									<button type="submit" onclick="selectNum('${index}')">${index}</button>
								</c:otherwise>
							</c:choose>

						</c:forEach>
						<button>&raquo;</button>
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

		if ("${param.typeSearch}" == "") {
			document.getElementsByName("typeSearch")[0].value = "1";
		} else {
			document.getElementsByName("typeSearch")[0].value = "${param.typeSearch}";
			change();
			if ("${param.typeSearch}" == "2") {
				document.getElementsByName("username")[0].value = "${param.username}";
			}
		}

		if ("${list}" != "") {
			document.getElementById("result").style.display = "flex";
		}

		function change() {
			var type = document.getElementsByName("typeSearch")[0];
			if (type.value == "1") {
				document.getElementsByName("username")[0].style.display = "none";
			} else if (type.value == "2") {
				document.getElementsByName("username")[0].style.display = "block";
			}
		}

		function selectNum(num) {
			var type = "";
			if ("${param.typeSearch}" == "")
				type = "1";
			else
				type = "${param.typeSearch}";
			if ("${username}" == "")
				document.getElementById('page').action = "${uri}/admin/histories?page="
						+ num + "&typeSearch=" + type;
			else
				document.getElementById('page').action = "${uri}/admin/histories?page="
						+ num + "&typeSearch=" + type + "&username=${username}";
		}
	</script>
</body>

</html>