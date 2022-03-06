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
		<section class="vds-main">
			<div class="container"
				style="max-width: 70%; border: 1px solid #fff;">
				<div class="video-details">
					<div class="latest_vidz">
						<div class="latest-vid-option">
							<h2 class="hd-op">Search Result</h2>
						</div>
						<!--latest-vid-option end-->
						<c:forEach var="video" items="${results}">
							<div>
								<div class="tb-pr">
									<div class="row">
										<div>
											<div class="tab-history acct_page">
												<div class="videoo">
													<div class="vid_thumbainl ms br">
														<a href="${url}/details-video?href=${video.href}" title="">
															<img
															src="https://img.youtube.com/vi/${video.href}/maxresdefault.jpg"
															alt=""> <span class="vid-time">${video.videoTime}</span>
															<span class="watch_later"> <i
																class="icon-watch_later_fill"></i>
														</span>
														</a>
													</div>
													<!--vid_thumbnail end-->
													<div class="video_info ms br">
														<h3>
															<a href="${url}/details-video?href=${video.href}"
																class="tag-search" title="">${video.title}</a>
														</h3>
														<span class="tag-view-search">${video.views} views
															. <fmt:formatDate value="${video.dateUpload}"
																pattern="dd/MM/yyyy" />
														</span>
													</div>
													<div class="clearfix"></div>
												</div>
												<!--videoo end-->
											</div>
										</div>
									</div>
								</div>
								<!--tb-pr end-->
							</div>
						</c:forEach>
						<!--vidz_list end-->
					</div>
					<!--latest_vidz end-->
					<div class="blocked-users"></div>
					<!--video-details end-->

				</div>
			</div>
		</section>
		<!--vds-main end-->
	</div>

</div>
<!--wrapper end-->
<%@include file="/view/user/fragments/footHtml.jsp"%>