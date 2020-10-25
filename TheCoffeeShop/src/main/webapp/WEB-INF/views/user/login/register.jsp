<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/user/taglib.jsp"%>
<jsp:useBean id="random" class="java.util.Random" scope="application" />
<title>Đăng Ký</title>
<body>
	<div class="container">
		<div class="register_container">
			<div class="register_new">
				<h2 class="login__subheader">Đăng Kí</h2>
				
				<form:form action="dang-ky" modelAttribute="user">
					
					<form:input onfocusout="checkUsername()" path="username" type="text" id="CustomerUser" class="login-form-input "
						placeholder="User" spellcheck="false" autocomplete="off"
						autocapitalize="off" autofocus="" required="" />
						
					<label class="error hidden" id="CustomerUser_err">Username đã có người sử dụng</label>
					
					<form:input onfocusout="checkRePass()" path="password"
						type="password" id="CustomerPassword" class="login-form-input "
						placeholder="Password" required=""/>
						
					<label class="error hidden" id="CustomerPassword_err">Mật khẩu phải hơn 6 kí tự</label>
					
				 	<input onfocusout="checkRePass()" type="password"
						id="re-CustomerPassword" class="login-form-input "
						placeholder="Re Password" required="">
					
					<label class="error hidden" id="re-CustomerPassword_err">Nhập lại sai mật khẩu</label>
						
					<form:input path="email"
					type="email" id="CustomerEmail" class="login-form-input " placeholder="Email"
						required=""/>
						
					<form:input path="name"
					 type="text" id="CustomerName"
						class="login-form-input " placeholder="Name" required=""/>

					<form:input path="phone"
					type="text" id="CustomerPhone" class="login-form-input "
						placeholder="Phone" required=""/>
						
					<form:input path="address" 
					type="text" id="CustomerAdress" class="login-form-input " placeholder="Address"
						required=""/>

					<button id="ok" type="submit" class="submit_login animate_btn">Đăng Kí</button>
				</form:form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var listUsername = [];
		<c:forEach var="item" items="${listUsers}">
			listUsername.push("${item.username}");
		</c:forEach>
		
		function checkUsername(){
			if(document.getElementById("CustomerUser").value.indexOf(" ") >= 0){
				document.getElementById("CustomerUser_err").classList.remove("hidden");
				document.getElementById("CustomerUser_err").innerHTML = "Username không thể chứa khoảng cách"
					document.getElementById("ok").disabled = true;
			}
			else{
				document.getElementById("CustomerUser_err").classList.add("hidden");
				listUsername.forEach(function(item, index){
					 if(document.getElementById("CustomerUser").value === item){
						document.getElementById("CustomerUser_err").classList.remove("hidden");
						document.getElementById("CustomerUser_err").innerHTML = "Username đã có người sử dụng"
						document.getElementById("ok").disabled = true;
					}
					else{
						document.getElementById("CustomerUser_err").classList.add("hidden");
						document.getElementById("ok").disabled = false;
					}
				})
			}
		}
		
		function checkRePass(){
			if(document.getElementById("CustomerPassword").value.length < 6){
				document.getElementById("CustomerPassword_err").classList.remove("hidden");
				document.getElementById("ok").disabled = true;
			}
			else{
				document.getElementById("CustomerPassword_err").classList.add("hidden");
				document.getElementById("ok").disabled = false;
			}
			
			if(document.getElementById("CustomerPassword").value !== document.getElementById("re-CustomerPassword").value){
				document.getElementById("re-CustomerPassword_err").classList.remove("hidden");
				document.getElementById("ok").disabled = true;
			}
			else{
				document.getElementById("re-CustomerPassword_err").classList.add("hidden");
				document.getElementById("ok").disabled = false;
			}
		}
		
		var t = document.getElementsByClassName("error");
		
		
	</script>
</body>