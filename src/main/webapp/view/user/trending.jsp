<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/view/user/fragments/headHtml.jsp"%>

<div class="wrapper hp_1 bg-dark bg-image">
	<!--header-->
	<%@include file="/view/user/fragments/header.jsp"%>
	<!--header end-->

	<!--side_menu-->
	<%@include file="/view/user/fragments/slide_menu.jsp"%>
	<!--side_menu end-->

	<!--vds-main-->
	<div class="container123">
		<section class="vds-main" style="margin-top: 24px;">
			<div class="vidz-row">
				<div class="container">
					<div class="vidz_sec">
						<h3>Trending Videos</h3>
						<div class="vidz_list m-0">
							<div class="row">
								<c:forEach var="video" items="${listTrending}">
									<%@include file="/view/user/fragments/list8video.jsp"%>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--vidz-row end-->

		</section>
		<!--vds-main end-->
	</div>

</div>
<!--wrapper end-->
<%@include file="/view/user/fragments/footHtml.jsp"%>