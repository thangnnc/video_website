<%@include file="/common/taglib.jsp"%>
<div class="side_menu">
	<div class="form_dvv">
		<a href="#" title="" class="login_form_show">Sign in</a>
	</div>
	<div class="sd_menu">
		<ul class="mm_menu">
			<li><span> <i class="icon-home"></i>
			</span> <a href="${url}/home" title="">Home</a></li>
			<li><span> <i class="icon-fire"></i>
			</span> <a href="${url}/trending" title="">Trending</a></li>
		</ul>
	</div>
	<!--sd_menu end-->
	<div class="sd_menu">
		<h3>Library</h3>
		<ul class="mm_menu">
			<li><span> <i class="icon-history"></i>
			</span> <a href="#" title="">History</a></li>
			<li><span> <i class="icon-like"></i>
			</span> <a href="${url}/my-account" title="">Favorite Videos</a></li>
		</ul>
	</div>
	<!--sd_menu end-->
	<div class="sd_menu">
		<ul class="mm_menu">
			<li><span> <i class="icon-settings"></i>
			</span> <a href="#" title="">Settings</a></li>
			<li><span> <i class="icon-flag"></i>
			</span> <a href="#" title="">Report history</a></li>
		</ul>
	</div>
	<!--sd_menu end-->
	<div class="sd_menu">
		<c:choose>
			<c:when test="${isLogin == null}">
				<ul class="mm_menu">
					<li><span> <i class="icon-logout"></i>
					</span> <a href="${url}/sign-in" title="">Sign in</a></li>
				</ul>
			</c:when>
			<c:otherwise>
				<ul class="mm_menu">
					<li><span> <i class="icon-logout"></i>
					</span> <a href="${url}/sign-out" title="">Sign out</a></li>
				</ul>
			</c:otherwise>
		</c:choose>
	</div>
	<!--sd_menu end-->
	<div class="sd_menu">
		<ul class="social_links">
			<li><a style="color: #515151"
				href="https://www.facebook.com/profile.php?id=100037169323465"
				target="_blank" title=""><i class="icon-facebook-official"></i></a></li>
			<li><a style="color: #515151" href="#" title=""><i class="icon-twitter"></i></a></li>
			<li><a style="color: #515151" href="https://www.instagram.com/thangnguyen1151/"
				target="_blank" title=""><i class="icon-instagram"></i></a></li>
		</ul>
		<!--social_links end-->
	</div>
	<!--sd_menu end-->
	<div class="sd_menu bb-0">
		<ul class="mm_menu">
			<li style="color: #a2a2a2;">Written by Thangnnc</li>
		</ul>
		<!--social_links end-->
	</div>
	<!--sd_menu end-->
</div>