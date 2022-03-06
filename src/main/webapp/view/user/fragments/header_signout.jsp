<%@include file="/common/taglib.jsp"%>
<div class="nav-right123 flex-div">
	<img src="<c:url value='/templates/images/upload.png'/>">  <img
		src="<c:url value='/templates/images/notification.png'/>">
	<a href="${url}/my-account"><img src="<c:url value='/templates/images/auth/${sessionScope.myAccount.image}'/>" class="user-icon"></a>
	
	<c:if test="${sessionScope.myAccount.admin}">
		<a href="${url}/admin/dashboard" title="" class="btn-default">Manager</a>
	</c:if>
	
	<a href="${url}/sign-out" title="" class="btn-default">Log out</a>
</div>