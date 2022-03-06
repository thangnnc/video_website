<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<%@include file="/view/user/fragments/headHtml.jsp"%>

<div class="wrapper hp_1 bg-dark bg-image">
	<!--header-->
	<%@include file="/view/user/fragments/header.jsp"%>
	<!--header end-->

	<!--side_menu-->
	<%@include file="/view/user/fragments/slide_menu.jsp"%>
	<!--side_menu end-->

	<div class="container123">
		<div class="banner123">
			<img src="<c:url value='/templates/images/banner.png'/>" alt="">
		</div>
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
		<!--vds-main end-->
	</div>
</div>
<!--wrapper end-->
<%@include file="/view/user/fragments/footHtml.jsp"%>