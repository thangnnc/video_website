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

.edit-user .active {
	background: #fff;
	color: #41c23d;
	padding: 3px;
	border-radius: 3px;
	padding: 3px;
}

.edit-user .active:hover {
	background: #41c23d;
	border-color: #41c23d;
	color: #fff;
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
					<form class="row" id="form" action="${uri}/admin" method="post"
						style="display: none" enctype="multipart/form-data">
						<div class="col-4 grid-margin">
							<div class="card" style="height: 100%;">
								<div class="card-body">
									<h4 class="card-title">Poster Image</h4>

									<div class="avatar-upload" style="max-width: 320px">
										<input type="text" name="check" value="false"
											style="display: none">
										<div class="avatar-preview"
											style="width: 320px; border-radius: 5%; height: 200px">
											<div id="preview" style="border-radius: 5%"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-8 grid-margin">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Infomation Videos</h4>
									<div class="forms-sample">
										<div class="form-group">
											<label for="href">Href</label> <input type="text"
												class="form-control" name="href" id="href"
												onfocusout="inputHref()" placeholder="Href"
												value="${param.href}" disabled required>
										</div>
										<div class="form-group">
											<label for="title">Title</label> <input type="text"
												class="form-control" name="title" id="title"
												placeholder="Title" value="${param.title}" disabled required>
										</div>
										<div class="form-group">
											<label for="time">Video Time</label> <input type="text"
												class="form-control" name="time" id="time"
												placeholder="Video Time" value="${param.time}" disabled
												required>
										</div>
										<div class="form-group">
											<label for="description">Description</label>
											<textarea class="form-control" name="description" rows="3"
												id="description" placeholder="Description"
												value="${param.description}" disabled required></textarea>
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
									<form action="${uri}/admin/videos-manager" method="post">
										<div class="form-group">
											<div class="input-group">
												<select class="form-control" name="active"
													style="width: 15%; color: #fff; border: 1px solid #fff;">
													<option value="0">All</option>
													<option value="true" selected>Active</option>
													<option value="false">In-Active</option>
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
					<div class="row">
						<div class="col-12 grid-margin">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Videos Table</h4>
									
									<div class="">
										<table class="table" style="table-layout: fixed">
											<thead>
												<tr>
													<th width="5%">Stt</th>
													<th width="15%">Href</th>
													<th width="20%">Title</th>
													<th width="10%">Video Time</th>
													<th width="20%">Description</th>
													<th width="10%">Date Release</th>
													<th width="10%">Active</th>
													<th width="10%">Edit</th>
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
														<td>${video.videoTime}</td>
														<td>${video.description}</td>
														<td>${video.dateUpload}</td>
														<c:choose>
															<c:when test="${video.active}">
																<td>
																	<div class="badge badge-outline-success">Active</div>
																</td>
															</c:when>
															<c:otherwise>
																<td>
																	<div class="badge badge-outline-warning">In-Active</div>
																</td>
															</c:otherwise>
														</c:choose>
														<c:choose>
															<c:when test="${video.active}">
																<td class="edit-user">
																	<button class="mdi mdi-lead-pencil edit"
																		onclick="edit('${video.href}','${video.title}','${video.videoTime}','${video.description}')"></button>
																	<form
																		action="${uri}/admin/delete-video?href=${video.href}"
																		method="post" style="display: inline;">
																		<button class="mdi mdi-delete-forever remove">
																		</button>
																	</form>
																</td>
															</c:when>
															<c:otherwise>
																<td class="edit-user">
																	<form
																		action="${uri}/admin/active-video?href=${video.href}"
																		method="post" style="display: inline;">
																		<button class="mdi mdi-checkbox-multiple-marked active">
																		</button>
																	</form>
																</td>
															</c:otherwise>
														</c:choose>

													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
									<div style="float: right;">
										<button class="btn btn-primary mr-2" onclick="create()">Create
											Video</button>
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


		if ("${active}" == "") {
			document.getElementsByName("active")[0].value = "0";
		} else {
			document.getElementsByName("active")[0].value = "${active}";
		} 
		
		function create() {
			document.getElementById("href").value = "";
			document.getElementById("href").disabled = false;
			document.getElementById("href").focus();
			document.getElementById("title").value = "";
			document.getElementById("title").disabled = false;
			document.getElementById("time").value = "";
			document.getElementById("time").disabled = false;
			document.getElementById("description").value = "";
			document.getElementById("description").disabled = false;
			document.getElementById("submit").disabled = false;
			document.getElementById("form").action = "${uri}/admin/create-video";
			document.getElementById("form").style.display = "flex";
			document.getElementById("preview").style.backgroundImage = "url(/thangnnc_asm2/templates/images/no-image.png)";

		}
		function edit(href, title, time, description) {
			document.getElementById("href").value = href;
			document.getElementById("href").disabled = true;
			document.getElementById("title").value = title;
			document.getElementById("title").disabled = false;
			document.getElementById("time").value = time;
			document.getElementById("time").disabled = false;
			document.getElementById("description").value = description;
			document.getElementById("description").disabled = false;
			document.getElementById("submit").disabled = false;
			document.getElementById("form").action = "${uri}/admin/update-video";
			document.getElementById("form").style.display = "flex";
			document.getElementById("preview").style.backgroundImage = "url(https://img.youtube.com/vi/"+href+"/maxresdefault.jpg)";
		}

		function enb() {
			document.getElementById("href").disabled = false;
		}
		
		function inputHref() {
			var href = document.getElementById("href").value;
			document.getElementById("preview").style.backgroundImage = "url(https://img.youtube.com/vi/"+href+"/maxresdefault.jpg)";
		}
		
		function selectNum(num,check) {
			if(check == "prev" && num > 1){
				document.getElementById('page').action = "${uri}/admin/videos-manager?active=${active}&page="+(num-1);
			}else if(check == "next" && num < parseInt("${page}")){
				document.getElementById('page').action = "${uri}/admin/videos-manager?active=${active}&page="+(num+1);
			}else document.getElementById('page').action = "${uri}/admin/videos-manager?active=${active}&page="+num;
			
		}
	</script>
</body>

</html>