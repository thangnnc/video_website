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
				<div class="row"style="border: 2px solid #fff">
					<%@include file="/view/user/fragments/slide_account.jsp"%>
					<div class="col-lg-9" style="border-right: 1px solid #fff">
						<div class="video-details">
							<div class="account-details">
								<div class="account_details_content">
									<h2 class="hd-op">Account Details</h2>
									<form action="${uri}/update-account" method="post">
										<h4 class="slct-hd">Username</h4>
										<div class="ch-pswd">
											<input type="text" name="username"
												value="${myAccount.username}" disabled
												placeholder="Username">
										</div>
										<h4 class="slct-hd">Password</h4>
										<div class="ch-pswd">
											<input type="text" name="password"
												value="${myAccount.password}" disabled
												placeholder="Password">
										</div>
										<h4 class="slct-hd">Fullname</h4>
										<div class="ch-pswd">
											<input type="text" name="fullname"
												value="${myAccount.fullname}" required
												placeholder="Fullname">
										</div>
										<h4 class="slct-hd">Email</h4>
										<div class="ch-pswd">
											<input type="email" name="email" value="${myAccount.email}"
												required placeholder="Email">
										</div>
										<ul class="gend">
											<c:choose>
												<c:when test="${myAccount.admin == true }">
													<h4 class="slct-hd">Roles: Admin</h4>
												</c:when>
												<c:otherwise>
													<h4 class="slct-hd">Role: User</h4>
												</c:otherwise>
											</c:choose>
										</ul>
										<div class="ch-pswd">
											<button type="submit">Update</button>
										</div>
										<!--ch-pswd end-->
									</form>
								</div>
								<!--account_details_content end-->
								<div class="clearfix"></div>
							</div>
							<!--Account Details end-->
						</div>
						<!--video-details end-->
					</div>
				</div>
			</div>
		</section>
		<!--user account end-->
	</div>
	<!-- Footer -->

	<script type="text/javascript">
		if ("${message}" != "")
			alert("${message}");
	</script>
</div>
<!--wrapper end-->
<%@include file="/view/user/fragments/footHtml.jsp"%>