<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Thangnnc</title>
<%@include file="/common/css_user.jsp"%>
</head>

<body>
	<!-- --------- navbar --------- -->
	<nav class="flex-div nav123" style="width: 100%;">
		<div class="nav-left123 flex-div">
			<img src="<c:url value='/templates/images/menu.png'/>" class="menu-icon"> <img
				src="<c:url value='/templates/images/logo.png'/>" class="logo">
		</div>
		<div class="nav-middle123 flex-div">
			<div class="search-box flex-div">
				<input type="text" placeholder="Search"> 
				<img src="<c:url value='/templates/images/search.png'/>" alt="">
			</div>
		</div>
		<div class="nav-right123 flex-div">
			<img src="<c:url value='/templates/images/upload.png'/>"> <img
				src="<c:url value='/templates/images/more.png'/>"> <img
				src="<c:url value='/templates/images/notification.png'/>"> <img
				src="<c:url value='/templates/images/Jack.png'/>" class="user-icon">
		</div>
	</nav>
	<!-- --------- end navbar --------- -->

	<!-- --------- sidebar --------- -->
	<div class="sidebar123">
		<div class="shortcut-link">
			<a href="${url}/home"><img src="<c:url value='/templates/images/home.png'/>" alt="">
				<p>Home</p> </a> <a href="${url}/trending"><img
				src="<c:url value='/templates/images/explore.png'/>" alt="">
				<p>Trending</p> </a> <a href=""><img
				src="<c:url value='/templates/images/subscriprion.png'/>" alt="">
				<p>Subscriprion</p> </a> <a href=""><img
				src="<c:url value='/templates/images/library.png'/>" alt="">
				<p>Library</p> </a> <a href=""><img
				src="<c:url value='/templates/images/history.png'/>" alt="">
				<p>History</p> </a> <a href=""><img
				src="<c:url value='/templates/images/playlist.png'/>" alt="">
				<p>Playsist</p> </a> <a href=""><img
				src="<c:url value='/templates/images/messages.png'/>" alt="">
				<p>Message</p> </a> <a href=""><img
				src="<c:url value='/templates/images/show-more.png'/>" alt="">
				<p>Show more</p> </a>
			<hr>

		</div>
	</div>
	<!-- --------- end navbar --------- -->

	<!-- --------- main --------- -->
	<div class="container123">

		
		<section class="vds-main">
		<div class="vidz-row">
			<div class="container">
				<div class="vidz_sec">
					<h3>Featured Videos</h3>
					<div class="vidz_list">
						<div class="row">
							<c:forEach var="video" items="${listFeature}">
								<%@include file="/view/user/fragments/list8video.jsp"%>
							</c:forEach>
						</div>
					</div>
					<!--vidz_list end-->
				</div>
				<!--vidz_videos end-->
			</div>
		</div>
		<!--vidz-row end-->
		<div class="vidz-row">
			<div class="container">
				<div class="vidz_sec">
					<h3>New Videos</h3>
					<div class="vidz_list">
						<div class="row">
							<c:forEach var="video" items="${listNew}">
								<%@include file="/view/user/fragments/list8video.jsp"%>
							</c:forEach>
						</div>
					</div>
					<!--vidz_list end-->
				</div>
				<!--vidz_videos end-->
			</div>
		</div>
		<!--vidz-row end-->
		<div class="vidz-row">
			<div class="container">
				<div class="vidz_sec">
					<h3>Popular Videos</h3>
					<div class="vidz_list">
						<div class="row">
							<c:forEach var="video" items="${listPopular}">
								<%@include file="/view/user/fragments/list8video.jsp"%>
							</c:forEach>
						</div>
					</div>
					<!--vidz_list end-->
				</div>
				<!--vidz_videos end-->
			</div>
		</div>
		<!--vidz-row end-->
	</section>
	</div>
	<!-- --------- end main --------- -->

	<script type="text/javascript">
		var menuIcon = document.querySelector(".menu-icon");
		var sidebar = document.querySelector(".sidebar123");
		var container = document.querySelector(".container123");

		menuIcon.onclick = function() {
			sidebar.classList.toggle("small-sidebar123");
			container.classList.toggle("large-container123")
		}
	</script>
</body>

</html>