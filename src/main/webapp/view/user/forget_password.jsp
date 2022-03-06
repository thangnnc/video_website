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
	<!--form sign up-->
	<section class="form_popup">

		<div class="signup_form" id="signup_form" style="margin: 120px 0;">
			<div>
				<div class="hd-lg">
					<!-- <img src="images/logo.png" alt=""> -->
					<span>Forget Password</span>
				</div>
				<!--hd-lg end-->
				<div class="user-account-pr">
					<form active="${uri}/forget-password" method="post">
						<div class="input-sec mgb25">
							<input type="text" name="username" placeholder="Username"
								required>
						</div>
						<div class="input-sec mb-0">
							<button type="submit">Confirm</button>
						</div>
						<!--input-sec end-->
					</form>
				</div>
			</div>

		</div>
		<!--user-account end--->
		<div class="fr-ps">
			<h1>
				Already have an account?<a href="login.jsp" title=""
					class="show_signup"> Login here.</a>
			</h1>
		</div>
		<!--fr-ps end-->

	</section>
	<!--form sign up end-->
</div>
	<script type="text/javascript">
		if("${message}" != "") alert("${message}");
	</script>
</div>
<!--wrapper end-->
<%@include file="/view/user/fragments/footHtml.jsp"%>