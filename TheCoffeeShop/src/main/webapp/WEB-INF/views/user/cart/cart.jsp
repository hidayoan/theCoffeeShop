<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/user/taglib.jsp"%>
<title>Giỏ Hàng</title>
<body>



	<div class="container">
		<div class="cart_container">
			<div class="cart_user">
				
				<c:if test="${userSession != null}">
					<h3>${  userSession.username }</h3>
				</c:if>
				<c:if test="${userSession == null}">
					<h3> <a href='<c:url value="/dang-nhap"/>'>Đăng Nhập Ngay</a> </h3>
				</c:if>
			</div>
			<c:if test="${ ShoppingCart.size() == 0 }">
				<div class="no_item">
					Không có sản phẩm nào <a href='<c:url value="/san-pham" />'san-pham">Mua Hàng</a>
				</div>
			</c:if>

			<c:if test="${ ShoppingCart.size() != 0 }">
				<div class="cart_main">

					<div class="cart_detail">

						<c:forEach var="item" items="${ShoppingCart}">
							<div class="cart_item">
								<div class="cart_img">
									<img
										src="assets/user/img/${item.value.product.id_category}/${item.value.product.img}.jpg"
										alt="">
								</div>
								<div class="cart_info">
									<span style="display: inline-flex; width: 100%;">
										<div class="cart_name ">${item.value.product.name}
											<span class="size_${item.value.size}"></span>
										</div> <c:forEach var="sizeP" items="${sizeProduct}">
											<c:if test="${sizeP.idProduct == item.value.product.id  }">
												<c:if test="${sizeP.size == item.value.size }">
													<div class="cart_price">
														<span id="cart_price">${sizeP.price }</span> đ
													</div>
												</c:if>
											</c:if>
										</c:forEach>

									</span>
									<div class="cart_amount">
										<div class="amount_info">
											<button onclick="clicked(this.id)" class="animate_btn minus"
												id="minus${item.value.product.id}${item.value.size}">-</button>
											<input onfocusout="changeQuanty(this.id)" class="amount "
												id="${item.key}" type="number" value="${item.value.quanty}">
											<button onclick="clicked(this.id)" class="animate_btn plus"
												id="plus${item.value.product.id}${item.value.size}">+</button>
										</div>
										<div class="cancel_cart">
											<a id="cancel_btn_1" class="cancel_btn"
												href='<c:url value="/DeleteCart/${item.key}" />'></a>
										</div>
									</div>
									<div class="cart_total">
										<span id="cart_total"></span>
									</div>
								</div>
							</div>
						</c:forEach>

					</div>
					<div class="bill_info">
						<div class="bill">
							<h3>Tổng Thanh Toán</h3>
							<div class="total_item_bill">
								<h2 class="title_bill">Tổng Tiền Hàng</h2>
								<h2 id="total_item_bill" class="bold">${TotalPriceCart}đ</h2>
							</div>
							<div class="discount_bill">
								<h2 class="title_bill">Mã Giảm</h2>
								<h2 id="discount_bill" class="bold">0</h2>
							</div>
							<div class="vat_bill">
								<h2 class="title_bill">VAT(10%)</h2>
								<h2 id="vat_bill" class="bold">4500</h2>
							</div>
							<div class="delivery_bill">
								<h2 class="title_bill">Phí vận chuyển</h2>
								<h2 id="delivery_bill" class="bold">20000</h2>
							</div>
							<div class="total_bill">
								<h3 class="title_bill">Thành Tiền</h3>
								<h3 id="total_bill" class="bold">20000</h3>
							</div>
							<button class="animate_btn">MUA HÀNG</button>
						</div>


					</div>
				</div>

			</c:if>
		</div>
	</div>

	<script type="text/javascript">
		function changeQuanty(id) {
			console.log(id);
			var value = document.getElementById(id).value;
			window.location = "EditCart/" + id + "/" + value;
		}

		function formatNumber(number) {
			var temp = number.toString();
			leng = temp.length;
			if (temp.length / 3 > 1) {
				if (temp.length % 3 == 0) {
					for (var i = 0; i < parseInt(leng / 3 - 1); i++) {
						var a = temp.substring(leng - 3 * (i + 1), temp.length);
						var b = temp.substring(0, leng - 3 * (i + 1));
						temp = b + "," + a;
					}
				} else {
					for (var i = 0; i < (parseInt(leng / 3)); i++) {
						var a = temp.substring(leng - 3 * (i + 1), temp.length);
						var b = temp.substring(0, leng - 3 * (i + 1));
						temp = b + "," + a;
					}
				}

				return temp;
			} else {
				return temp;
			}
		}
		var plus_s = document.getElementsByClassName("plus");
		var minus_s = document.getElementsByClassName("minus");

		var value = document.getElementsByClassName("amount");
		var unitPrice = document.getElementsByClassName("cart_price");
		var total = document.getElementsByClassName("cart_total");

		for (var i = 0; i < value.length; i++) {
			var temp = parseInt(value[i].value)
					* parseInt(unitPrice[i].innerText.replace(","));
			total[i].innerHTML = formatNumber(temp);
		}

		function clicked(id) {
			console.log(id);

			for (var i = 0; i < plus_s.length; i++) {
				if (id == plus_s[i].id) {

					value[i].value = parseInt(value[i].value) + 1;
					window.location = "EditCart/" + value[i].id + "/"
							+ value[i].value;
					/*	var temp = parseInt(value[i].value)
					 * parseInt(unitPrice[i].innerText.replace(","));
						total[i].innerHTML = formatNumber(temp);*/
				}
				if (id == minus_s[i].id && value[i].value > 0) {
					window.location = "EditCart/" + value[i].id + "/"
							+ value[i].value;
					/*var temp = parseInt(value[i].value)
					 * parseInt(unitPrice[i].innerText.replace(","));
					total[i].innerHTML = formatNumber(temp);*/
				}
			}
			document.getElementById('total_bill').innerHTML = parseInt(document
					.getElementById("total_item_bill").innerText)
					+ parseInt(document.getElementById("discount_bill").innerText)
					+ parseInt(document.getElementById("vat_bill").innerText)
					+ parseInt(document.getElementById("delivery_bill").innerText)
		}
		var totalItem = 0;

		for (var i = 0; i < total.length; i++) {
			totalItem = totalItem
					+ parseInt(total[i].innerText.replace(",", ""));
		}

		document.getElementById('total_item_bill').innerHTML = totalItem;
		document.getElementById('total_bill').innerHTML = parseInt(document
				.getElementById("total_item_bill").innerText)
				+ parseInt(document.getElementById("discount_bill").innerText)
				+ parseInt(document.getElementById("vat_bill").innerText)
				+ parseInt(document.getElementById("delivery_bill").innerText);

		var sizeS = document.getElementsByClassName("size_1");
		for (var i = 0; i < sizeS.length; i++) {
			sizeS[i].innerHTML = " (size S)";
		}

		var sizeM = document.getElementsByClassName("size_2");
		for (var i = 0; i < sizeM.length; i++) {
			sizeM[i].innerHTML = " (size M)";
		}

		var sizeL = document.getElementsByClassName("size_3");
		for (var i = 0; i < sizeL.length; i++) {
			sizeL[i].innerHTML = " (size L)";
		}
	</script>


</body>