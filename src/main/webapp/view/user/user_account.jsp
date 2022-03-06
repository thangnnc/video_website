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
	<div class="container123">
		<!--user account-->
		<section class="user-account">
			<div class="container">
				<div class="row" style="border: 2px solid #fff">
					<%@include file="/view/user/fragments/slide_account.jsp"%>
					<div class="col-lg-9" style="border-right: 1px solid #fff">
						<div class="video-details">
							<div class="latest_vidz">
								<div class="latest-vid-option">
									<h2 class="hd-op">Favourite Videos</h2>
									<div class="clearfix"></div>
								</div>
								<!--latest-vid-option end-->
								<div class="vidz_list">
									<c:forEach var="favorite" items="${results}">
										<div class="tb-pr">
											<div class="row">
												<div style="flex: 0 0 85%; max-width: 85%;">
													<div class="tab-history acct_page">
														<div class="videoo">
															<div class="vid_thumbainl ms br">
																<a href="${url}/details-video?href=${favorite.href}"
																	title=""> <img
																	src="https://img.youtube.com/vi/${favorite.href}/maxresdefault.jpg"
																	alt=""> <span class="vid-time">${favorite.videoTime}</span>
																	<span class="watch_later"> <i
																		class="icon-watch_later_fill"></i>
																</span>
																</a>
															</div>
															<!--vid_thumbnail end-->
															<div class="video_info ms br">
																<h3 style="font-size: 18px;">
																	<a href="${url}/details-video?href=${favorite.href}"
																		title="">${favorite.title}</a>
																</h3>
																<span>${favorite.views} views . <fmt:formatDate
																		value="${favorite.dateUpload}" pattern="dd/MM/yyyy" /></span>
															</div>
															<div class="clearfix"></div>
														</div>
														<!--videoo end-->
													</div>
												</div>
												<div style="flex: 0 0 10%; max-width: 10%;">
													<div class="icon-list">
														<ul>
															<li><a href="#" title=""><i class="icon-play"></i></a></li>
															<li><a href="#" title=""><i class="icon-cancel"></i></a></li>
														</ul>
													</div>
													<!--icon-list end-->
												</div>
											</div>
										</div>
										<!--tb-pr end-->
									</c:forEach>
								</div>
								<!--vidz_list end-->
							</div>
							<!--latest_vidz end-->
						</div>
						<!--video-details end-->
					</div>
				</div>
			</div>
		</section>
	</div>
	<!--user account end-->

</div>
<!--wrapper end-->
<%@include file="/view/user/fragments/footHtml.jsp"%>