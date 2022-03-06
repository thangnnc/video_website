<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1,
	      shrink-to-fit=no">
<title>Thangnnc Assignment</title>
<%@include file="/common/css.jsp"%>
<style type="text/css">
.edit-user {
	font-size: 18px !important;
}

.edit-user .edit {
	background: #fff;
	color: #0090e7;
	padding: 3px;
	border-radius: 3px;
}

.edit-user .edit:hover {
	background: #0090e7;
	border-color: #0090e7;
	color: #fff;
}

.edit-user .remove {
	background: #fff;
	color: #ff3a3a;
	padding: 3px;
	border-radius: 3px;
	padding: 3px;
}

.edit-user .remove:hover {
	background: #ff3a3a;
	border-color: #ff3a3a;
	color: #fff;
}
</style>
</head>

<body>
	<div class="container-scroller">
		<!-- sidebar -->
		<%@include file="/view/admin/fragments/sidebar.jsp"%>
		<!-- end sidebar -->

		<div class="container-fluid page-body-wrapper">
			<!-- navbar -->
			<%@include file="/view/admin/fragments/navbar.jsp"%>
			<!-- end navbar -->

			<div class="main-panel">
				<div class="content-wrapper"></div>
				<!-- content-wrapper ends -->
				<!-- footer -->
				<%@include file="/view/admin/fragments/footer.jsp"%>
				<!-- end footer -->
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->

	<%@include file="/common/js.jsp"%>

	<script>
		if ("${param.message}" != "") {
			alert("${param.message}");
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

		function create() {
			document.getElementById("username").value = "";
			document.getElementById("username").disabled = false;
			document.getElementById("username").focus();
			document.getElementById("password").value = "";
			document.getElementById("password").disabled = false;
			document.getElementById("confirm").value = "";
			document.getElementById("confirm").disabled = false;
			document.getElementById("fullname").value = "";
			document.getElementById("fullname").disabled = false;
			document.getElementById("email").value = "";
			document.getElementById("email").disabled = false;
			document.getElementById("submit").disabled = false;
			document.getElementById("photo").disabled = false;
			document.getElementById("user").disabled = false;
			document.getElementById("admin").disabled = false;
			document.getElementById("form").action = "${uri}/admin/create";
			document.getElementById("form").style.display = "flex";
			document.getElementById("preview").style.backgroundImage = "url(/thangnnc_asm2/templates/images/no-image.png)";

		}
		function edit(username, password, fullname, email) {
			document.getElementById("username").value = username;
			document.getElementById("username").disabled = true;
			document.getElementById("password").value = password;
			document.getElementById("password").disabled = true;
			document.getElementById("confirm").value = password;
			document.getElementById("confirm").disabled = true;
			document.getElementById("fullname").value = fullname;
			document.getElementById("fullname").disabled = false;
			document.getElementById("email").value = email;
			document.getElementById("email").disabled = false;
			document.getElementById("submit").disabled = false;
			document.getElementById("photo").disabled = false;
			document.getElementById("user").disabled = false;
			document.getElementById("admin").disabled = false;
			document.getElementById("form").action = "${uri}/admin/update";
			document.getElementById("form").style.display = "flex";
			document.getElementById("preview").style.backgroundImage = "url(/thangnnc_asm2/templates/images/auth/"
					+ username + ".jpg)";
			document.getElementsByName("check")[0].value = "";
		}

		function enb() {
			document.getElementById("username").disabled = false;
			document.getElementById("password").disabled = false;
			document.getElementById("confirm").disabled = false;
		}
		

		function selectNum(num,check) {
			if(check == "prev" && num > 1){
				document.getElementById('page').action = "${uri}/admin/users-manager?page="+(num-1);
			}else if(check == "next" && num < parseInt("${page}")){
				document.getElementById('page').action = "${uri}/admin/users-manager?page="+(num+1);
			}else document.getElementById('page').action = "${uri}/admin/users-manager?page="+num;
			
		}
	</script>
</body>

</html>