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

		<div class="signup_form" id="signup_form">
			<div class="hd-lg">
				<!-- <img src="images/logo.png" alt=""> -->
				<span>Register your account</span>
			</div>
			<!--hd-lg end-->
			<div class="user-account-pr">
				<form action="${uri}/sign-up" method="post"
					enctype="multipart/form-data" style="margin-top: 20px">
					<div class="avatar-upload">
						<div class="avatar-edit">
							<input type='file' id="photo" accept=".png, .jpg, .jpeg"
								name="photo" onchange="showPreview(event)" required /> <label
								for="photo" style="font-family: none"></label>
						</div>
						<div class="avatar-preview">
							<div id="preview"></div>
						</div>
					</div>
					<div class="input-sec mgb25">
						<input type="text" name="username" placeholder="Username" required>
					</div>
					<div class="input-sec">
						<input type="Password" name="password" placeholder="Password"
							required>
					</div>
					<div class="input-sec">
						<input type="password" name="confirm-password"
							placeholder="Re-enter password" required>
					</div>
					<div class="input-sec">
						<input type="text" name="fullname" placeholder="Fullname" required>
					</div>
					<div class="input-sec">
						<input type="email" name="email" placeholder="Email address"
							required>
					</div>
					<div class="input-sec mb-0">
						<button type="submit">Signup</button>
					</div>
					<!--input-sec end-->
				</form>
			</div>
			<!--user-account end--->
			<div class="fr-ps">
				<h1>
					Already have an account?<a href="${url}/sign-in" title=""
						class="show_signup"> Login here.</a>
				</h1>
			</div>
			<!--fr-ps end-->
		</div>
		<!--login end--->

	</section>
	<!--form sign up end-->
	</div>
	<script type="text/javascript">
		if ("${message}" != "") {
			alert("${message}");
		}

		function showPreview(event) {
			if (event.target.files.length > 0) {
				var src = URL.createObjectURL(event.target.files[0]);
				var preview = document.getElementById("preview");
				preview.style.backgroundImage = "url(" + src + ")";
				var name = document.getElementsByName("photo")[0].value;
				var index = name.lastIndexOf("\\") + 1;
				document.getElementsByClassName("wrap-input100")[0].style.display = "block";
				document.getElementsByClassName("input100")[0].value = name
						.substring(index, name.length);
			}
		}
	</script>
</div>
<!--wrapper end-->
<%@include file="/view/user/fragments/footHtml.jsp"%>