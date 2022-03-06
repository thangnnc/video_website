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

	<!--form upload -->
	<div style="padding-bottom: 60px; background-color: #181818;">
		<section class="upload-detail">
			<div class="container">
				<h3>Upload Details</h3>
				<div class="vid_thumbainl tr">
					<a href="#" title=""> <img
						src="https://img.youtube.com/vi/R9B9ojb0CGM/maxresdefault.jpg"
						alt=""> <span class="vid-time">30:32</span>
					</a>
				</div>
				<!--vid_thumbnail tr end-->
				<div class="video_info sr">
					<h3>
						<a href="#" title="">30-Minute Beginner's Strength Training
							workout</a>
					</h3>
					<h4>102.6 MB, 2:13 MIN Remaining</h4>
					<div class="progress">
						<div class="progress-bar" role="progressbar" aria-valuenow="70"
							aria-valuemin="0" aria-valuemax="100" style="width: 45%">
							<span class="sr-only">70% Complete</span>
						</div>
					</div>
					<a href="#" title="" class="cancel_vid"> <i class="icon-cancel"></i>
					</a>
					<p>Your Video is still uploading, please keep this page open
						util itâs done.</p>
				</div>
				<!--videoo end-->
				<div class="clearfix"></div>
			</div>
		</section>
		<section class="vid-title-sec">
			<div class="container">
				<form>
					<div class="vid-title">
						<h2 class="title-hd">Video Title</h2>
						<div class="form_field">
							<input type="text"
								placeholder="Add here (99 characters remaining)">
						</div>
					</div>
					<!--vid-title-->
					<div class="abt-vidz-pr">
						<h2 class="title-hd">Link</h2>
						<div class="form_field">
							<grammarly-extension data-grammarly-shadow-root="true"
								style="position: absolute; top: 0px; left: 0px; pointer-events: none;"
								class="cGcvT"></grammarly-extension>
							<grammarly-extension data-grammarly-shadow-root="true"
								style="mix-blend-mode: darken; position: absolute; top: 0px; left: 0px; pointer-events: none;"
								class="cGcvT"></grammarly-extension>
							<input placeholder="Enter link of Youtube video" />
						</div>
					</div>
					<!--abt-vidz-->
					<div class="abt-vidz-pr">
						<h2 class="title-hd">Slug</h2>
						<div class="form_field">
							<grammarly-extension data-grammarly-shadow-root="true"
								style="position: absolute; top: 0px; left: 0px; pointer-events: none;"
								class="cGcvT"></grammarly-extension>
							<grammarly-extension data-grammarly-shadow-root="true"
								style="mix-blend-mode: darken; position: absolute; top: 0px; left: 0px; pointer-events: none;"
								class="cGcvT"></grammarly-extension>
							<input placeholder="Slug of Youtube video" disabled />
						</div>
					</div>
					<!--abt-vidz-->
					<div class="abt-vidz-pr">
						<h2 class="title-hd">About</h2>
						<div class="form_field">
							<grammarly-extension data-grammarly-shadow-root="true"
								style="position: absolute; top: 0px; left: 0px; pointer-events: none;"
								class="cGcvT"></grammarly-extension>
							<grammarly-extension data-grammarly-shadow-root="true"
								style="mix-blend-mode: darken; position: absolute; top: 0px; left: 0px; pointer-events: none;"
								class="cGcvT"></grammarly-extension>
							<textarea placeholder="Description" spellcheck="false"></textarea>
						</div>
					</div>
					<!--abt-vidz-->
				</form>
			</div>
		</section>

	</div>
	<!--form upload end-->

	<!-- Footer -->
	<%@include file="/view/user/fragments/footer.jsp"%>
	<!-- Footer -->

</div>
<!--wrapper end-->
<%@include file="/view/user/fragments/footHtml.jsp"%>