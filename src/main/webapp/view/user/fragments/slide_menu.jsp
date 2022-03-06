<%@include file="/common/taglib.jsp"%>
<div class="sidebar123">
	<div class="shortcut-link">
		<a href="${url}/home"><img
			src="<c:url value='/templates/images/home.png'/>" alt="">
			<p>Home</p> </a> <a href="${url}/trending"><img
			src="<c:url value='/templates/images/explore.png'/>" alt="">
			<p>Trending</p> </a> <a href="${url}/search"><img
			src="<c:url value='/templates/images/history.png'/>" alt="">
			<p>Search</p> </a>
		<c:if test="${sessionScope.myAccount != null }">
			<hr>
			<a href="${url}/my-account""><img
				src="<c:url value='/templates/images/subscriprion.png'/>" alt="">
				<p>My Favorite</p> </a>
			<a href="${url}/change-password"><img
				src="<c:url value='/templates/images/messages.png'/>" alt="">
				<p>Change Password</p> </a>
		</c:if>
		<hr>
		<c:choose>
			<c:when test="${sessionScope.myAccount == null}">
				<a href="${url}/sign-in"><img src="" alt="">
					<p>Log In</p> </a>
			</c:when>
			<c:otherwise>
				<a href="${url}/sign-out"><img src="" alt="">
					<p>Log Out</p> </a>
			</c:otherwise>
		</c:choose>

	</div>
</div>