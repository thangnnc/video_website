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
<title>Corona Admin</title>
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
		<%@include file="/view/admin/fragments/sidebar_logout.jsp"%>
		<!-- end sidebar -->

		<div class="container-fluid page-body-wrapper">
			<!-- navbar -->
			<%@include file="/view/admin/fragments/navbar_logout.jsp"%>
			<!-- end navbar -->

			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row">
						<div class="col-12 grid-margin">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Search</h4>
									<form action="${uri}/search-user" method="post">
										<div class="form-group">
											<div class="input-group">
												<select class="form-control" name="typeSearch"
													onchange="change()"
													style="width: 20%; color: #fff; border: 1px solid #fff;">
													<option value="1" selected>Find Favorite Videos By
														User</option>
													<option value="2">Find Favorite Videos By Title</option>
													<option value="3">Find Users By Video Id</option>
													<option value="4">Find Videos By Favorite</option>
													<option value="5">Find Report</option>
												</select> <select class="form-control" name="favorite"
													style="width: 15%; color: #fff; border: 1px solid #fff; display: none">
													<option value="true" selected>Favorite</option>
													<option value="false">No Favorite</option>
												</select> <input type="text" class="form-control"
													style="width: 70%; border: 1px solid #fff;"
													placeholder="Enter something..." name="search">
												<div class="input-group-append">
													<button class="btn btn-sm btn-primary" id="search"
														style="border: 1px solid #fff;" type="submit">Search</button>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<c:choose>
						<c:when test="${param.typeSearch == 1}">
							<%@ include file="/view/admin/result/result1.jsp"%>
						</c:when>
						<c:when test="${param.typeSearch == 2}">
							<%@ include file="/view/admin/result/result2.jsp"%>
						</c:when>
						<c:when test="${param.typeSearch == 3}">
							<%@ include file="/view/admin/result/result3.jsp"%>
						</c:when>
						<c:when test="${param.typeSearch == 4}">
							<%@ include file="/view/admin/result/result2.jsp"%>
						</c:when>
						<c:when test="${param.typeSearch == 5}">
							<%@ include file="/view/admin/result/result4.jsp"%>
						</c:when>
					</c:choose>
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
			if ("${param.typeSearch}" == 4) {
				change();
				document.getElementsByName("favorite")[0].value = "${param.favorite}";
			}else if("${param.typeSearch}" == 5){
				document.getElementsByName("search")[0].style.display = "none";
			}
		}

		if("${list}" != ""){
			document.getElementById("result").style.display = "flex";
		}

		function change() {
			var type = document.getElementsByName("typeSearch")[0];
			if (type.value == "4") {
				document.getElementsByName("favorite")[0].style.display = "block";
				document.getElementsByName("search")[0].style.display = "none";
				document.getElementsByName("search")[0].value = "1203";
			} else if (type.value == "5") {
				document.getElementById("search").click();
			} else {
				document.getElementsByName("favorite")[0].style.display = "none";
				document.getElementsByName("search")[0].style.display = "block";
				document.getElementsByName("search")[0].value = "";
			}
		}
	</script>
</body>

</html>