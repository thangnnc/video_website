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
	<!--header-->
	<%@include file="/view/user/fragments/header.jsp"%>
	<!--header end-->

	<!--side_menu-->
	<%@include file="/view/user/fragments/slide_menu.jsp"%>
	<!--side_menu end-->

	<!-- --------- main --------- -->
	<div class="container123">
		<section class="mn-sec">
			<div class="container">
				<div class="row">
					<div class="col-lg-9">
						<div class="mn-vid-sc single_video">
							<div class="vid-1">
								<iframe width="100%" height="540px"
									src="https://www.youtube.com/embed/${video.href}"
									title="YouTube video player" frameborder="1"
									allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
									allowfullscreen> </iframe>
								<div class="vid-info">
									<h3>${video.title}</h3>
									<div class="info-pr">
										<span>${video.views} views</span>

										<ul class="pr_links">
											<li>
												<form action="${uri}/like?href=${video.href}" method="post"
													onsubmit="return checkSubmit()">
													<button type="submit" data-toggle="tooltip"
														data-placement="top" title="I like this">
														<i class="like icon-thumbs_up_fill"></i>
													</button>
													<span>${like}</span>
												</form>
											</li>
											<li>
												<form action="${uri}/dislike?href=${video.href}"
													method="post" onsubmit="return checkSubmit()">
													<button type="submit" data-toggle="tooltip"
														data-placement="top" title="I dislike this">
														<i class="dislike icon-thumbs_down_fill"></i>
													</button>
													<span>${dislike}</span>
												</form>
											</li>
										</ul>
										<div class="clearfix"></div>
									</div>
									<!--info-pr end-->
								</div>
								<!--vid-info end-->
							</div>
							<!--vid-1 end-->
							<div class="abt-mk">
								<div class="info-pr-sec">
									<ul class="chan_cantrz">
										<li><a href="#" title="" class="donate">Donate</a></li>
										<li><a href="#" title="" class="subscribe">Subscribe
												<strong>13M</strong>
										</a></li>
									</ul>
									<!--chan_cantrz end-->
									<ul class="df-list">
										<li>
											<button data-toggle="tooltip" data-placement="top"
												title="Add to playlist">
												<i class="icon-add_to_playlist"
													style="color: rgb(148, 255, 144);"></i>
											</button>
										</li>
										<li>
											<form action="${uri}/favorite?href=${video.href}"
												onsubmit="return checkSubmit()" method="post">
												<div data-toggle="tooltip" data-placement="top"
													title="Favorite">
													<button class="favorite fa fa-heart" style="color: #fff;"></button>
													<i id="countFavorite" style="color: #f56d6d; display: none">${countFavorite}</i>
												</div>
											</form>
										</li>
										<li>
											<button data-toggle="tooltip" data-placement="top"
												title="Watch Later">
												<i class="icon-watch_later" style="color: #fff;"></i>
											</button>
										</li>
										<li>

											<form id="share" action="${uri}" method="post"
												onsubmit="return checkShare()">
												<button data-toggle="tooltip" data-placement="top"
													title="Share">
													<i class="icon-share" style="color: #fff;"></i>
												</button>
											</form>
										</li>
										<li>
											<button data-toggle="tooltip" data-placement="top"
												title="Report Video">
												<i class="icon-flag" style="color: #fff;"></i>
											</button>
										</li>
									</ul>
									<!--df-list end-->
									<div class="clearfix"></div>
								</div>
								<div class="clearfix"></div>
								<div class="about-ch-sec">
									<div class="abt-rw">
										<h4>Content:</h4>
										<ul>
											<li><span>${video.description}</span></li>
										</ul>
									</div>
									<div class="abt-rw">
										<h4>Title:</h4>
										<ul>
											<li><span>${video.title}</span></li>
										</ul>
									</div>
									<div class="abt-rw">
										<h4>Time:</h4>
										<ul>
											<li><span>${video.videoTime}</span></li>
										</ul>
									</div>
								</div>
								<!--about-ch-sec end-->
							</div>
							<!--abt-mk end-->
							<div class="cmt-bx">
								<ul class="cmt-pr">
									<li>Comments</li>
									<li><span><i class="icon-sort_by"></i><a href="#"
											title="">Sort By</a></span></li>
								</ul>
								<div class="clearfix"></div>
								<div class="clearfix"></div>
								<div class="vcp_inf pc">
									<div class="vc_hd">
										<c:choose>
											<c:when test="${sessionScope.myAccount != null }">
												<img
													src="<c:url value='/templates/images/auth/${myAccount.image}'/>"
													alt="">
											</c:when>
											<c:otherwise>
												<img
													src="<c:url value='/templates/images/resources/th1.png'/>"
													alt="">
											</c:otherwise>
										</c:choose>

									</div>
									<form action="${uri}/comment?href=${param.href}" method="post"
										onsubmit="return checkSubmit()">
										<input type="text" name="cmt"
											placeholder="Add a public comment" required>
										<button type="submit">Comment</button>
									</form>
									<div class="clearfix"></div>
									<div class="rt-cmt">
										<div class="clearfix"></div>
									</div>
									<!--vcp_inf end-->
								</div>
								<!--cmt-bx end-->
								<ul class="cmn-lst">
									<c:forEach var="cmt" items="${video.comments}">
										<li>
											<div class="vcp_inf">
												<div class="vc_hd">
													<img
														src="<c:url value='/templates/images/auth/${cmt.userC.image}'/>"
														alt="">
												</div>
												<div class="coments">
													<h2>
														${cmt.userC.username} <small class="posted_dt">
															${cmt.commentDate}</small>
													</h2>
													<p>${cmt.comment}</p>
													<ul class="cmn-i">
														<li><a href="#" title=""> <i
																class="icon-thumbs_up"></i>
														</a> <span class="span-thumbs_up">0</span></li>
														<li><a href="#" title=""> <i
																class="icon-thumbs_down"></i>
														</a> <span class="span-thumbs_down">0</span></li>
													</ul>
												</div>
												<!--coments end-->
											</div> <!--vcp_inf end--> <!--comment list end-->
										</li>
									</c:forEach>

								</ul>
							</div>
						</div>
						<!--mn-vid-sc end--->
					</div>
					<!---col-lg-9 end-->
					<div class="col-lg-3 aside-video">
						<div class="sidebar">
							<div class="videoo-list-ab">
								<c:forEach var="video" items="${listPopular}">
									<div class="videoo">
										<div class="vid_thumbainl">
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
										<div class="video_info">
											<h3>
												<a href="${url}/details-video?href=${video.href}" title="">${video.title}</a>
											</h3>
											<span>${video.views} views .<small class="posted_dt"><fmt:formatDate
														value="${video.dateUpload}" pattern="dd/MM/yyyy" /></small></span>
										</div>
									</div>
									<!--videoo end-->
								</c:forEach>
							</div>
							<!--videoo-list-ab end-->
							<!--side-bar end-->
						</div>
					</div>
		</section>
	</div>
	<script type="text/javascript">
		if ("${message}" != "") {
			alert("${message}");
		}

		if ("${param.message}" != "") {
			alert("${param.message}");
		}

		if ("${isFavorite}" == "true") {
			document.getElementsByClassName('favorite')[0].style.color = "#f56d6d";
			document.getElementById('countFavorite').style.display = "";
		}

		if ("${isLike}" == "true") {
			document.getElementsByClassName('like')[0].style.color = "#6db0f5";
		} else if ("${isLike}" == "false") {
			document.getElementsByClassName('dislike')[0].style.color = "#f56d6d";
		}

		function checkSubmit() {
			if ("${myAccount}" != "") {
				return true;
			} else {
				alert("Please sign in to use this functionality.");
				return false;
			}
		}

		function checkShare() {
			if ("${myAccount}" != "") {
				var email = prompt("Please enter email to share");
				if (email != null) {
					document.getElementById('share').action = "${uri}/share?email="
							+ email + "&href=${param.href}";
					return true;
				} else
					return false;
			} else {
				alert("Please sign in to use this functionality.");
				return false;
			}
		}
	</script>
	<!-- --------- end main --------- -->

</body>

</html>