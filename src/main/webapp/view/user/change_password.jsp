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
							<div class="change-pswd">
								<h2 class="hd-op">Change password</h2>
								<form action="${uri}/change-password" method="post">
									<div class="ch-pswd">
										<input type="password" name="old-password" required
											placeholder="Old Password">
									</div>
									<!--ch-pswd end-->
									<div class="ch-pswd">
										<input type="password" name="new-password" required
											placeholder=" New Password">
									</div>
									<!--ch-pswd end-->
									<div class="ch-pswd">
										<input type="password" name="confirm-password" required
											placeholder="Confirm New Password">
									</div>
									<!--ch-pswd end-->
									<div class="ch-pswd">
										<button type="submit">Update</button>
									</div>
									<!--ch-pswd end-->
								</form>
							</div>
							<!--change-pswd end-->
						</div>
						<!--video-details end-->
					</div>
				</div>
			</div>
		</section>
		<!--user account end-->
	</div>
	<script type="text/javascript">
		if ("${message}" != "")
			alert("${message}");
	</script>
</div>
<!--wrapper end-->
<%@include file="/view/user/fragments/footHtml.jsp"%>