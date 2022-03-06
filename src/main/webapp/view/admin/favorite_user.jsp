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

.dropdown-content {
	display: none;
	width: 95%;
	height: 320px;
	padding-left: 18px;
	padding-right: 18px;
	position: absolute;
	background-color: #f6f6f6;
	overflow: auto;
	border: 1px solid #515151;
	border-top: none;
	z-index: 1;
	position: absolute;
}

.dropdown-content button {
	color: #515151;
	line-height: 40px;
	background-color: #f6f6f6;
	text-align: left;
	border: none;
}

.dropdown-content .itemSearch {
	width: 100%;
	color: #515151;
	line-height: 60px;
	background-color: #f6f6f6;
	border: none;
	border-top: 1px solid #515151;
	display: block;
}

.itemSearch img {
	height: 40px;
}
</style>

<script type="text/javascript">

function focusInput() {
	document.getElementsByClassName("dropdown-content")[0].style.display = "block";
}

function focusOutInput() {
	document.getElementsByClassName("dropdown-content")[0].style.display = "none";
}


function filterFunction() {
  var input, filter, ul, li, a, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  div = document.getElementById("myDropdown");
  a = div.getElementsByClassName("itemSearch");
  for (i = 0; i < a.length; i++) {
    txtValue = a[i].textContent || a[i].innerText;
    if (txtValue.toUpperCase().indexOf(filter) > -1) {
      a[i].style.display = "";
    } else {
      a[i].style.display = "none";
    }
  }
}

function selectTitle(href) {
	document.getElementById('search').action = "${uri}/admin/favorite-user?href="+href; 
}
</script>
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
									<h4 class="card-title">Search</h4>
									<form id="search" action="${uri}/admin/favorite-user"
										method="post" onmouseleave="focusOutInput()">
										<div class="form-group">
											<div class="input-group">
												<input type="text" class="form-control" id="myInput"
													value="${video.title}" onfocus="focusInput()"
													onkeyup="filterFunction()" placeholder="Enter something..."
													name="title">
												<div class="input-group-append">
													<button class="btn btn-sm btn-primary" type="submit">Search</button>
												</div>
											</div>
											<div id="myDropdown" class="dropdown-content">
												<c:forEach var="video" items="${listSearch}">
													<div class="itemSearch"
														onclick="selectTitle('${video.href}')">
														<img alt=""
															src="https://img.youtube.com/vi/${video.href}/maxresdefault.jpg">
														<button>${video.title}</button>
													</div>
												</c:forEach>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<div class="row" id="result" style="display: none;">
						<div class="col-12 grid-margin">
							<div class="card" style="height: 100%;">
								<div class="card-body">
									<h4 class="card-title">Video</h4>
									<div style="display: flex;">
										<div class="col-4 avatar-upload"
											style="max-width: 320px; margin: 0 auto">
											<input type="text" name="check" value="false"
												style="display: none">
											<div class="avatar-preview"
												style="width: 320px; height: 200px; border-radius: 5%">
												<div id="preview"
													style="border-radius: 5%; background-image: url(https://img.youtube.com/vi/${video.href}/maxresdefault.jpg);"></div>
											</div>
										</div>
										<div
											class="col-8 d-flex d-md-block d-xl-flex flex-row px-4 px-md-3 px-xl-4 mt-1">
											<div class="text-md-center text-xl-left">
												<h4 id="title" class="mb-3"
													style="color: #515151; font-weight: bold">${video.title}</h4>
												<p class="text-muted mb-0" id="name"
													style="color: #515151 !important; font-size: 15px">
													<b class="mr-2">Href:</b> ${video.href}
												</p>
												<p class="text-muted mb-0" id="name"
													style="color: #515151 !important; font-size: 15px">
													<b class="mr-2">View:</b> ${video.views}
												</p>
												<p class="text-muted mb-0" id="name"
													style="color: #515151 !important; font-size: 15px">
													<b class="mr-2">Date release:</b> ${video.dateUpload}
												</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-12 grid-margin">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">List User Favorited This Video</h4>

									<div class="">
										<table class="table" style="table-layout: fixed">
											<thead>
												<tr>
													<th width="5%">Stt</th>
													<th width="15%">Username</th>
													<th width="20%">Fullname</th>
													<th width="25%">Email</th>
													<th width="25%">Favorite Date</th>
													<th width="10%">Active</th>
												</tr>
											</thead>
											<tbody>
												<c:set var="stt" value="${(pageSelect-1) * 5}" />
												<c:forEach var="favorite" items="${video.favorites}">
													<c:set var="stt" value="${stt + 1}" />
													<tr>
														<td>${stt}</td>
														<td><img
															src="../templates/images/auth/${favorite.userF.username}.jpg"
															alt="" /> <span class="pl-2">${favorite.userF.username}</span></td>
														<td>${favorite.userF.fullname}</td>
														<td>${favorite.userF.email}</td>
														<td>${favorite.favoriteDate}</td>
														<c:choose>
															<c:when test="${favorite.userF.admin}">
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
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<form id="page" action="" method="post" class="pagination"
								style="margin: 20px 0 0 0">
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
					</div>

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
		
		if ("${video}" != "") {
			document.getElementById("result").style.display = "flex";
		}
		
		function selectNum(num,check) {
			if(check == "prev" && num > 1){
				document.getElementById('page').action = "${uri}/admin/favorite-user?page="+(num-1);
			}else if(check == "next" && num < parseInt("${page}")){
				document.getElementById('page').action = "${uri}/admin/favorite-user?page="+(num+1);
			}else document.getElementById('page').action = "${uri}/admin/favorite-user?page="+num;
			
		}
	</script>
</body>

</html>