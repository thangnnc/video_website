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
	background: #fff;
	color: #0090e7;
	padding: 3px;
	border-radius: 3px;
}

.edit-user .edit:hover {
	background: #0090e7;
	border-color: #0090e7;
	color: #fff;
}

.edit-user .remove {
	background: #fff;
	color: #ff3a3a;
	padding: 3px;
	border-radius: 3px;
	padding: 3px;
}

.edit-user .remove:hover {
	background: #ff3a3a;
	border-color: #ff3a3a;
	color: #fff;
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
					<form class="row" id="form" action="${uri}/admin" method="post"
						style="display: none" enctype="multipart/form-data">
						<div class="col-4 grid-margin">
							<div class="card" style="height: 100%;">
								<div class="card-body">
									<h4 class="card-title">Avatar Image</h4>

									<div class="avatar-upload">
										<div class="avatar-edit">
											<input type='file' id="photo" accept=".png, .jpg, .jpeg"
												name="photo" onchange="showPreview(event)" disabled /> <label
												for="photo" style="font-family: none"></label>
										</div>
										<input type="text" name="check" value="false"
											style="display: none">
										<div class="avatar-preview">
											<div id="preview"></div>
										</div>
									</div>
									<p style="text-align: center; font-size: 18px;">Please
										upload your avatar</p>
								</div>
							</div>
						</div>
						<div class="col-8 grid-margin">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Infomation Person</h4>
									<div class="forms-sample">
										<div class="form-group">
											<label for="username">Username</label> <input type="text"
												class="form-control" name="username" id="username"
												placeholder="Username" value="${param.username}" disabled
												required>
										</div>
										<div class="form-group">
											<label for="password">Password</label> <input type="password"
												class="form-control" name="password" id="password"
												placeholder="Password" value="${param.password}" disabled
												required>
										</div>
										<div class="form-group">
											<label for="confirm">Confirm Password</label> <input
												type="password" class="form-control" name="confirm"
												id="confirm" placeholder="Password"
												value="${param.password}" disabled required>
										</div>
										<div class="form-group">
											<label for="fullname">Fullname</label> <input type="text"
												class="form-control" name="fullname" id="fullname"
												placeholder="Fullname" value="${param.fullname}" disabled
												required>
										</div>
										<div class="form-group">
											<label for="email">Email Address</label> <input type="email"
												class="form-control" name="email" id="email"
												placeholder="Email" value="${param.email}" disabled required>
										</div>
										<div class="form-group">
											<label style="width: 100%">Roles</label>
											<div style="display: inline;">
												<div class="form-check" style="width: 20%; float: left;">
													<label class="form-check-label"> <input
														type="radio" class="form-check-input" name="admin"
														id="user" value="false" checked disabled> User <i
														class="input-helper"></i></label>
												</div>
												<div class="form-check" style="width: 20%; float: left;">
													<label class="form-check-label"> <input
														type="radio" class="form-check-input" name="admin"
														id="admin" value="true" disabled> Admin <i
														class="input-helper"></i></label>
												</div>
												<div style="clear: both;"></div>
											</div>
										</div>
										<div style="float: right;">
											<button id="submit" type="submit"
												class="btn btn-primary mr-2" style="clear: both;"
												onclick="enb()" disabled>Submit</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
					<div class="row">
						<div class="col-12 grid-margin">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Search</h4>
									<form action="${uri}/admin/users-manager" method="post">
										<div class="form-group">
											<div class="input-group">
												<input type="text" class="form-control"
													placeholder="Enter something..." name="search">
												<div class="input-group-append">
													<button class="btn btn-sm btn-primary" type="submit">Search</button>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-12 grid-margin">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">User Table</h4>
									
									<div class="table-responsive">
										<table class="table">
											<thead>
												<tr>
													<th>Stt</th>
													<th>Client Name</th>
													<th>Fullname</th>
													<th>Email</th>
													<th>Status</th>
													<th>Edit</th>
												</tr>
											</thead>
											<tbody>
												<c:set var="stt" value="${(pageSelect-1) * 5}" />
												<c:forEach var="users" items="${list}">
													<c:set var="stt" value="${stt + 1}" />
													<tr>
														<td>${stt}</td>
														<td><img
															src="<c:url value='/templates/images/auth/${users.image}'/>"
															alt="" /> <span class="pl-2">${users.username}</span></td>
														<td>${users.fullname}</td>
														<td>${users.email}</td>
														<c:choose>
															<c:when test="${users.admin}">
																<td>
																	<div class="badge badge-outline-warning">Admin</div>
																</td>
															</c:when>
															<c:otherwise>
																<td>
																	<div class="badge badge-outline-success">User</div>
																</td>
															</c:otherwise>
														</c:choose>
														<td class="edit-user">
															<button class="mdi mdi-lead-pencil edit"
																onclick="edit('${users.username}','${users.password}','${users.fullname}','${users.email}')"></button>
															<form
																action="${uri}/delete-user?username=${users.username}"
																method="post" style="display: inline;">
																<button class="mdi mdi-delete-forever remove">
																</button>
															</form>

														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
									<div style="float: right;">
										<button class="btn btn-primary mr-2" onclick="create()">Create
											User</button>
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
		if ("${param.message}" != "") {
			alert("${param.message}");
		}

		function showPreview(event) {
			if (event.target.files.length > 0) {
				var src = URL.createObjectURL(event.target.files[0]);
				var preview = document.getElementById("preview");
				preview.style.backgroundImage = "url(" + src + ")";
				var name = document.getElementsByName("photo")[0].value;
				var index = name.lastIndexOf("\\") + 1;
				document.getElementsByClassName("wrap-input100")[0].style.display = "block";
				document.getElementsByClassName("input100")[0].value = name
						.substring(index, name.length);
			}
		}

		function create() {
			document.getElementById("username").value = "";
			document.getElementById("username").disabled = false;
			document.getElementById("username").focus();
			document.getElementById("password").value = "";
			document.getElementById("password").disabled = false;
			document.getElementById("confirm").value = "";
			document.getElementById("confirm").disabled = false;
			document.getElementById("fullname").value = "";
			document.getElementById("fullname").disabled = false;
			document.getElementById("email").value = "";
			document.getElementById("email").disabled = false;
			document.getElementById("submit").disabled = false;
			document.getElementById("photo").disabled = false;
			document.getElementById("user").disabled = false;
			document.getElementById("admin").disabled = false;
			document.getElementById("form").action = "${uri}/admin/create-user";
			document.getElementById("form").style.display = "flex";
			document.getElementById("preview").style.backgroundImage = "url(/thangnnc_asm2/templates/images/no-image.png)";

		}
		function edit(username, password, fullname, email) {
			document.getElementById("username").value = username;
			document.getElementById("username").disabled = true;
			document.getElementById("password").value = password;
			document.getElementById("password").disabled = true;
			document.getElementById("confirm").value = password;
			document.getElementById("confirm").disabled = true;
			document.getElementById("fullname").value = fullname;
			document.getElementById("fullname").disabled = false;
			document.getElementById("email").value = email;
			document.getElementById("email").disabled = false;
			document.getElementById("submit").disabled = false;
			document.getElementById("photo").disabled = false;
			document.getElementById("user").disabled = false;
			document.getElementById("admin").disabled = false;
			document.getElementById("form").action = "${uri}/admin/update-user";
			document.getElementById("form").style.display = "flex";
			document.getElementById("preview").style.backgroundImage = "url(/thangnnc_asm2/templates/images/auth/"
					+ username + ".jpg)";
			document.getElementsByName("check")[0].value = "";
		}

		function enb() {
			document.getElementById("username").disabled = false;
			document.getElementById("password").disabled = false;
			document.getElementById("confirm").disabled = false;
		}
		

		function selectNum(num,check) {
			if(check == "prev" && num > 1){
				document.getElementById('page').action = "${uri}/admin/users-manager?page="+(num-1);
			}else if(check == "next" && num < parseInt("${page}")){
				document.getElementById('page').action = "${uri}/admin/users-manager?page="+(num+1);
			}else document.getElementById('page').action = "${uri}/admin/users-manager?page="+num;
			
		}
	</script>
</body>

</html>