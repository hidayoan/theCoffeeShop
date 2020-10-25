<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/user/taglib.jsp"%>
<jsp:useBean id="random" class="java.util.Random" scope="application" />
<title>Quản Lý Tài Khoản</title>
<body>
	<div class="container">
		<div class="user_container">
			<div class="user_menus">
				<div class="test">
					<h3>Chào, Hida88</h3>
					<div class="user_menu">Sửa thông tin cá nhân</div>
					<div class="user_menu">Thống kê đơn hàng</div>
				</div>

			</div>
			<div class="user_info">
				<div class="user_place  " id="user_changeInfo">
					<h3>THAY DỔI THÔNG TIN TÀI KHOẢN</h3>
					<form action="" class="user_form_changeInfo">
						<input type="text" autocapitalize="words" placeholder="Tên">
						<input type="text" autocapitalize="words"
							placeholder="Số điện thoại"> <input type="text"
							autocapitalize="words" placeholder="Địa chỉ">
						<button type="submit" class="button_change animate_btn">Xác
							nhận</button>
					</form>
				</div>

				<div class="user_place hidden" id="report_order">
					<h3>Thống Kê Đơn Hàng</h3>

				</div>
			</div>
		</div>
	</div>
</body>
</html>