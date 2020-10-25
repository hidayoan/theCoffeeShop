<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/user/taglib.jsp" %>
<jsp:useBean id="random" class="java.util.Random" scope="application" />
<title>Trang chủ</title>
<body>
	<div class="container">
		<a class="banner_image" href="#"> <img alt=""
			src='<c:url value="assets/user/img/background.jpg"/>'>
		</a>

		<div class="contentStripesContainer">

			<article
				class="contentStripe contentStripe18808 contentStripe--imgRight">
				<div class="contentStripe__container">
					<div class="contentStripe__grid">
						<figure class="contentStripe__media">
							<picture class="contentStripe__picture"> <img
								src='<c:url value="assets/user/img/make_espresso.jpg"/>'
								alt="Espresso Cup" data-aspect="0" class="contentStripe_img">
							</picture>
						</figure>
						<div class="contentStripe__content">
							<h2 class="contentStripe__title">Cà phê espresso của chúng
								tôi, latte của bạn</h2>
							<div class="contentStripe__body">
								<p>Cà phê espresso đậm vị và bốc hơi sữa - ngon tuyệt hảo
									khi thưởng thức riêng hay khi thêm đường.</p>
							</div>

							<a class="contentStripe__cta"
								href="/th%E1%BB%B1c-%C4%91%C6%A1n/th%E1%BB%A9c-u%E1%BB%91ng/"
								title="Lấy phần của bạn">Lấy phần của bạn</a>
						</div>
					</div>
				</div>
			</article>
		</div>

		<div style="display: inline-flex;">
			<div class="content-text contentStripe__content"
				style="margin-top: 110px">
				<h2 class="contentStripe__title">Thương hiệu bắt nguồn từ cà
					phê Việt Nam</h2>
				<div class="contentStripe__body">
					<p>ARABICA được sinh ra từ niềm đam mê bất tận với hạt cà phê
						Việt Nam. Qua một chặng đường dài, chúng tôi đã không ngừng mang
						đến những sản phẩm cà phê thơm ngon, sánh đượm trong không gian
						thoải mái và lịch sự với mức giá hợp lý.</p>
				</div>
			</div>
			<div class="content-img">
				<img alt=""
					src='<c:url value="assets/user/img/cay-ca-phe.jpg"/>'>
			</div>
		</div>


		<div class="menu_home">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-xs-12" style="margin-top: 20px">
						<h2 class="menu_home_title line_after_heading section_heading">Menu</h2>
						<div class="viewmore_menu_home" style="float: right">
							<a class="animate_btn" href="/TheCoffeeShop/san-pham"
								title="xem thêm tất cả sản phẩm">xem thêm tất cả sản phẩm</a>
						</div>
					</div>

					<div class="clearfix"></div>

					<div class="menu_list_home flex_wrap display_flex">

						<c:forEach var="i" begin="0" end="5">
							<div class="menu_item">
								<div class="menu_item_image">
									<a href="san-pham/${randomProducts[i].id}"
										title="${randomProducts[i].name}">
										<img
										src='<c:url value="assets/user/img/${randomProducts[i].id_category}/${randomProducts[i].img}.jpg"/>'
										alt="">
									</a>
								</div>
								<div class="menu_item_info">
									<h3>
										<a href="san-pham/${randomProducts[i].id}"
											title="${randomProducts[i].name}">${randomProducts[i].name}</a>
									</h3>
									<c:forEach var="a" items="${sizeProduct}" varStatus="index">

										<c:if
											test="${a.idProduct == randomProducts[i].id && a.size == 2}">
											<div class="price_product_item">${a.price}đ</div>
										</c:if>
									</c:forEach>
									<a class="menu_item_action animate_btn"
										href="san-pham/${randomProducts[i].id}">Tìm hiểu thêm</a>
								</div>
							</div>

						</c:forEach>

					</div>
				</div>
			</div>
		</div>



	</div>
</body>