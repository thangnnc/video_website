<%@include file="/common/taglib.jsp"%>
<nav class="navbar p-0 fixed-top d-flex flex-row">
	<div class="navbar-menu-wrapper flex-grow d-flex align-items-stretch">
		<button class="navbar-toggler navbar-toggler align-self-center"
			type="button" data-toggle="minimize">
			<span class="mdi mdi-menu"></span>
		</button>
		<ul class="navbar-nav navbar-nav-right">
			<li class="nav-item dropdown border-left"><a
				class="nav-link count-indicator dropdown-toggle"
				id="messageDropdown" href="#" data-toggle="dropdown"
				aria-expanded="false"> <i class="mdi mdi-email"></i> <span
					class="count bg-success"></span>
			</a>
				<div
					class="dropdown-menu dropdown-menu-right navbar-dropdown
                  preview-list"
					aria-labelledby="messageDropdown">
					<h6 class="p-3 mb-0">Messages</h6>
				</div></li>
			<li class="nav-item dropdown border-left"><a
				class="nav-link count-indicator dropdown-toggle"
				id="notificationDropdown" href="#" data-toggle="dropdown"> <i
					class="mdi mdi-bell"></i> <span class="count bg-danger"></span>
			</a>
				<div
					class="dropdown-menu dropdown-menu-right navbar-dropdown
                  preview-list"
					aria-labelledby="notificationDropdown">
					<h6 class="p-3 mb-0">Notifications</h6>
				</div></li>
			<li class="nav-item dropdown"><a class="nav-link"
				id="profileDropdown" href="#" data-toggle="dropdown">
					<div class="navbar-profile">
						<img class="img-xs rounded-circle"
							src="<c:url value='/templates/images/auth/${myAccount.image}'/>"
							alt="">
						<p class="mb-0 d-none d-sm-block navbar-profile-name">${myAccount.fullname}</p>
						<i class="mdi mdi-menu-down d-none d-sm-block"></i>
					</div>
			</a>
				<div
					class="dropdown-menu dropdown-menu-right navbar-dropdown
                  preview-list"
					aria-labelledby="profileDropdown">
					<h6 class="p-3 mb-0">Profile</h6>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item preview-item" href="${url}/home">
						<div class="preview-thumbnail">
							<div class="preview-icon bg-dark rounded-circle">
								<i class="mdi mdi-account-settings text-success"></i>
							</div>
						</div>
						<div class="preview-item-content">
							<p class="preview-subject mb-1">Go Home</p>
						</div>
					</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item preview-item" href="${url}/sign-out">
						<div class="preview-thumbnail">
							<div class="preview-icon bg-dark rounded-circle">
								<i class="mdi mdi-logout text-danger"></i>
							</div>
						</div>
						<div class="preview-item-content">
							<p class="preview-subject mb-1">Log out</p>
						</div>
					</a>
					<div class="dropdown-divider"></div>
					<p class="p-3 mb-0 text-center">Advanced settings</p>
				</div></li>
		</ul>
		<button
			class="navbar-toggler navbar-toggler-right d-lg-none
              align-self-center"
			type="button" data-toggle="offcanvas">
			<span class="mdi mdi-format-line-spacing"></span>
		</button>
	</div>
</nav>