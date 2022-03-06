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
	<!--form login-->
	<section class="form_popup">
		<div class="login_form" id="login_form">
			<div class="hd-lg">
				<!-- <img src="images/logo.png" alt=""> -->
				<span>Log In With Your Account</span>
			</div>
			<!--hd-lg end-->
			<div class="user-account-pr">
				<form active="${uri}/sign-in" method="post">
					<div class="input-sec">
						<input type="text" name="username" placeholder="Username" value="${param.username}" required/>
					</div>
					<div class="input-sec">
						<input type="Password" name="password" placeholder="Password" required/>
					</div>
					<div class="chekbox-lg">
						<label> <input type="checkbox" name="remember" value="true" />
							<b class="checkmark"> </b> <span>Remember me</span>
						</label>
					</div>
					<div class="input-sec mb-0">
						<button type="submit">Login</button>
					</div>
					<!--input-sec end-->
				</form>
				<a href="${url}/forget-password" title="" class="fg_btn">Forgot
					password?</a>
			</div>
			<!--user-account end--->
			<div class="fr-ps">
				<h1>
					Don't have an account? <a href="${url}/sign-up" title=""
						class="show_signup">Signup here.</a>
				</h1>
			</div>
			<!--fr-ps end-->
		</div>
		<!--login end--->
	</section>
	<!--form login end-->
	</div>
	<script type="text/javascript">
		if ("${message}" != "") {
			alert("${message}");
		}
	</script>
</div>
<!--wrapper end-->
<%@include file="/view/user/fragments/footHtml.jsp"%>