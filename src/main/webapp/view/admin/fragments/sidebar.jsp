<%@include file="/common/taglib.jsp"%>
<nav class="sidebar sidebar-offcanvas" id="sidebar">
	<div
		class="sidebar-brand-wrapper d-none d-lg-flex align-items-center
          justify-content-center fixed-top">
		<a class="sidebar-brand brand-logo" href="${uri}/home">Thangnnc</a> <a
			class="sidebar-brand brand-logo-mini" href="${uri}/home">T</a>
	</div>

	<ul class="nav">
		<li class="nav-item nav-category"><span class="nav-link">Navigation</span>
		</li>
		<li class="nav-item menu-items"><a class="nav-link"
			href="${url}/admin/dashboard"> <span class="menu-icon"> <i
					class="mdi mdi-speedometer"></i>
			</span> <span class="menu-title">Dashboard</span>
		</a></li>
		<li class="nav-item menu-items"><a class="nav-link"
			href="${url}/admin/users-manager"> <span class="menu-icon">
					<i class="mdi mdi-account-search"></i>
			</span> <span class="menu-title">Users Manager</span>
		</a></li>
		<li class="nav-item menu-items"><a class="nav-link"
			href="${url}/admin/videos-manager"> <span class="menu-icon">
					<i class="mdi mdi-video"></i>
			</span> <span class="menu-title">Videos Manager</span>
		</a></li>
		<li class="nav-item menu-items"><a class="nav-link"
			data-toggle="collapse" href="#ui-basic" aria-expanded="false"
			aria-controls="ui-basic"> <span class="menu-icon"> <i
					class="mdi mdi-laptop"></i>
			</span> <span class="menu-title">Statistical</span> <i
				class="menu-arrow"></i>
		</a>
			<div class="collapse" id="ui-basic">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link"
						href="${url}/admin/favorite-video">Favorite Videos</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${url}/admin/favorite-user">Favorite Users</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${url}/admin/mail-share">Shares</a></li>
				</ul>
			</div></li>
		<li class="nav-item menu-items"><a class="nav-link"
			href="#"> <span class="menu-icon"> <i
					class="mdi mdi-history"></i>
			</span> <span class="menu-title">History</span>
		</a></li>
		<li class="nav-item menu-items"><a class="nav-link"
			href="${url}/sign-out"> <span class="menu-icon"> <i
					class="mdi mdi-logout"></i>
			</span> <span class="menu-title">Logout</span>
		</a></li>
	</ul>
</nav>