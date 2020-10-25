<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/user/taglib.jsp"%>
<jsp:useBean id="random" class="java.util.Random" scope="application" />
<title>Đăng Nhập</title>
<body>

	<div class="container">
		<div class="login_container">
			<c:if test="${statusLogin == 'Đăng Nhập Tài Khỏan Thành Công' }">
				<h3 style="text-align: center; width: 100%;display: grid;">Đăng Nhập Thành Công 
					<a style="margin: 20px" href="<c:url value="/trang-chu" />" > Quay Lại Trang Chủ </a>
				</h3>
			</c:if>
			
			<c:if test="${statusLogin != 'Đăng Nhập Tài Khỏan Thành Công' }">

				<div class="login_new">
					<h2 class="login__subheader">Chào Người Mới</h2>
					<p class="login_content">Bằng cách tạo tài khoản với cửa hàng
						của chúng tôi, bạn sẽ có thể thực hiện quy trình thanh toán nhanh
						hơn, lưu trữ nhiều địa chỉ giao hàng, xem và theo dõi đơn đặt hàng
						trong tài khoản của bạn và hơn thế nữa</p>
					<div class="login_btn animate_btn">
						<a href="<c:url value="/dang-ky"/>">Tạo Tài Khoản</a>
					</div>
				</div>


				<div class="login_current">
					<h2 class="login__subheader">Đăng Nhập</h2>
					<form:form action="dang-nhap" class="login_form"
						modelAttribute="user">
						<label for="CustomerUser" class="login__label"> Email </label>
						<form:input path="username" type="text" name="email"
							id="RecoverEmail" placeholder="User" spellcheck="false"
							autocomplete="off" autocapitalize="off" class="login-form__input" />

						<label for="CustomerPassword" class="login__label">
							Password </label>
						<form:input path="password" type="password" id="CustomerPassword"
							class="login-form-input " placeholder="Password" required="" />

						<div onclick="recover()" class="login__show-recover">Forgot
							your password?</div>
						<button class="submit_login animate_btn">Đăng Nhập</button>
					</form:form>
				</div>

				<div class="login_recover hidden">
					<h2 class="login__subheader">Đăng Nhập</h2>
					<p class="login_content">Please enter your email address below.
						You will receive a link to reset your password.</p>
					<form action="/tai-khoan/lay-lai-mat-khau">
						<input
							style='width: 100%; border: 1px solid #c6c6c6; border-radius: 0; max-width: 100%; padding: 10px; color: #000; font-family: "Helvetica Neue", "Arial", sans-serif; margin-bottom: 20px; height: 35px;'
							type="email" name="email" id="RecoverEmail" placeholder="Email"
							spellcheck="false" autocomplete="off" autocapitalize="off"
							class="login-form__input">
						<div class="submit_login animate_btn">Xác Nhận</div>
					</form>
				</div>
			</c:if>
		</div>
	</div>


	<script type="text/javascript">
		function recover() {
			document.getElementsByClassName("login_current")[0].classList
					.add("hidden");
			document.getElementsByClassName("login_recover")[0].classList
					.remove("hidden");
		}
	</script>

</body>