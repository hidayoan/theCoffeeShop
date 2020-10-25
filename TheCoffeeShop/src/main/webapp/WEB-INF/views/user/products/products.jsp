<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/user/taglib.jsp" %>
<title>Menu</title>
<body>
	<div class="container">
		<video autoplay muted loop class="myVideo">
			<source
				src='<c:url value="/assets/user/img/background_video.mp4"></c:url>'
				type="video/mp4">
		</video>

		<div class="collection_menu_wrap">
			<div class="row">
				<div style="position: sticky; top: 80px"
					class="col-lg-3 col-md-3 col-sm-4 col-xs-12 stickySidebar">
					<aside class="sidebar_menu">
						<ul>
							<li><a class="menu_scroll_link active" href="">NỔI BẬT</a></li>
							<c:forEach var="item" items="${categorys}" varStatus="index">
								<li><a class="menu_scroll_link" href="${item.url}">
										${item.name}</a></li>

							</c:forEach>
						</ul>
					</aside>
				</div>
				<div
					class="col-lg-9 col-md-9 col-sm-8 col-xs-12 border_right_before">

					<!-- sản phẩm Nổi bật -->

					<div class="block_menu_item" id="noi-bat">
						<h3 class="block_menu_item_title">
							<span class="line_after_heading section_heading"> NỔI BẬT
							</span>
						</h3>
						<div class="flex_wrap display_flex menu_lists">


							<c:forEach var="item" items="${products}" varStatus="index">

								<c:if test="${item.highlight == true}">
									<div class="menu_item">
										<div class="menu_item_image">
											<a href="san-pham/${item.id}" title="${item.name}"> <img
												src='<c:url value="assets/user/img/${item.id_category}/${item.img}.jpg"/>'
												alt="">
											</a>
										</div>
										<div class="menu_item_info bg_white">
											<h3>
												<a href="san-pham/${item.id}" title="${item.name}">${item.name}</a>
											</h3>
											<c:forEach var="a" items="${sizeProduct}" varStatus="index">

												<c:if test="${a.idProduct == item.id && a.size == 2}">
													<div class="price_product_item">${a.price}đ</div>
													<a class="menu_item_action animate_btn" href="san-pham/${item.id}"
															 title="Mua Ngay">Mua ngay</a>
												</c:if>
											</c:forEach>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</div>
					</div>

					<!-- sản phẩm theo menu -->
					<c:forEach var="item" items="${categorys}" varStatus="index">
						<div class="block_menu_item" id="${item.name }">
							<h3 class="block_menu_item_title">
								<span class="line_after_heading section_heading">
									${item.name} </span>
							</h3>
							<div class="flex_wrap display_flex menu_lists">
								<c:forEach var="product" items="${products}">
									<c:if test="${item.id == product.id_category}">
										<div class="menu_item">
											<div class="menu_item_image">
												<a href="san-pham/${product.id}" title="${product.name}">
													<img
													src='<c:url value="assets/user/img/${product.id_category}/${product.img}.jpg"/>'
													alt="">
												</a>
											</div>
											<div class="menu_item_info bg_white">
												<h3>
													<a href="san-pham/${product.id}" title="${product.name}">${product.name}</a>
												</h3>
												<c:forEach var="a" items="${sizeProduct}" varStatus="index">

													<c:if test="${a.idProduct == product.id && a.size == 2}">
														<div class="price_product_item">${a.price}đ</div>
														<a class="menu_item_action animate_btn"
															href="san-pham/${product.id}" target="_blank" title="Mua Ngay">Mua
															ngay</a>
													</c:if>
												</c:forEach>
											</div>
										</div>
									</c:if>
								</c:forEach>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript"
		src='<c:url value="/assets/user/js/script.js"/>'></script>

</body>