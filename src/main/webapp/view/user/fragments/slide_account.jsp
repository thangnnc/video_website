<%@include file="/common/taglib.jsp"%>
<div class="col-lg-3"
	style="padding-left: 30px; border-left: 1px solid #fff; border-right: 1px solid #fff;">
	<div class="sidebar">
		<div class="widget video_info pr sp">
			<span class="vc_hd"> <img style="width: 200px; height: 200px;border: 4px solid #5a75ff;"
				src="<c:url value='/templates/images/auth/${myAccount.image}'/>"
				alt="">
			</span>
			<h4>Information</h4>
			<span>User: ${myAccount.username}</span> <br> <span>Fullname:
				${myAccount.fullname}</span> <br> <span>Email:
				${myAccount.email}</span> <br> <span>Role: <c:choose>
					<c:when test="${myAccount.admin == true}">Admin</c:when>
					<c:otherwise>User</c:otherwise>
				</c:choose>
			</span>
		</div>
		<!--video_info pr-->
		<div class="widget account">
			<h2 class="hd-uc">
				<i class="icon-user"></i> Account
			</h2>
			<ul>
				<li><a href="${url}/change-password">Change Password</a></li>
				<li><a href="${url}/update-account">Update Account</a></li>
				<li><a href="${url}/sign-out">Sign Out</a></li>
			</ul>
		</div>
	</div>
	<!--sidebar end-->
</div>