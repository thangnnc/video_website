<%@include file="/common/taglib.jsp"%>

<script type="text/javascript">
	function changeKeyword() {
		var keyword = document.getElementsByName("search")[0].value;
		document.getElementById("search").action = "${url}/search?keyword="
				+ keyword;
	}
</script>
<nav class="flex-div nav123" style="width: 100%;">
	<div class="nav-left123 flex-div">
		<img src="<c:url value='/templates/images/menu.png'/>"
			class="menu-icon"> 
			<a href="${url}/home"><img src="<c:url value='/templates/images/logo.png'/>" class="logo"></a>
	</div>
	<div class="nav-middle123 flex-div">
		<div class="search-box flex-div">
			<form id="search" action="${uri}/search" onsubmit="changeKeyword()"
				method="post">
				<input type="text" name="search" value="${param.search}"
					placeholder="Search">
				<button type="submit" style="background: transparent; border: 0">
					<i class="icon-search"></i>
				</button>
			</form>
		</div>
	</div>
	<c:choose>
		<c:when test="${myAccount != null}">
			<%@include file="/view/user/fragments/header_signout.jsp"%>
		</c:when>
		<c:otherwise>
			<%@include file="/view/user/fragments/header_signin.jsp"%>
		</c:otherwise>
	</c:choose>
</nav>