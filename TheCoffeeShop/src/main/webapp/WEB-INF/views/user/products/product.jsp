
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/layouts/user/taglib.jsp" %>
<head>
<meta charset="utf-8">
<title>${product.name}</title>
<style>
.product-content {
	overflow-x: hidden;
}
</style>
</head>
<body>

	<div class="container" style="margin: 90px 90px 50px 170px;">

		<div class="product_image">
			<img
				src='<c:url value="/assets/user/img/${product.id_category}/${product.img}.jpg" />'
				alt="">
			<div class="description_product">
				<Strong>Thông tin sản phẩm</Strong>
				<h1>Lớp trà oolong đã man mát, nhưng sẽ vị càng thêm vị khi có
					hương bưởi cùng những tép bưởi mọng nước đi kèm - cho bạn 1 cách
					thưởng thức đầy thú vị. Cùng đánh thức vị giác, khởi động 1 ngày
					tươi tắn cùng hương vị mới lạ này nhé!</h1>
			</div>
		</div>
		<div class="menu_item prodcut_text ">

			<form  method="get" action='<c:url value="/AddCart/${product.id}"/>' class="menu_item_info" style="margin: 20px;">
				<h3>${product.name}</h3>
				<div class="size_product">
					<c:forEach var="size" items="${sizeProduct}" varStatus="index">
						<c:if test="${size.idProduct == product.id}">
							<c:if test="${size.size == 1}">
								<div onclick="myFunction(this.id)" id="${size.size}"
									class="animate_btn size active">S</div>
							</c:if>

							<c:if test="${size.size == 2}">
								<div onclick="myFunction(this.id)" id="${size.size}"
									class="animate_btn size">M</div>
							</c:if>

							<c:if test="${size.size == 3}">
								<div onclick="myFunction(this.id)" id="${size.size}"
									class="animate_btn size">L</div>
							</c:if>
						</c:if>
					</c:forEach>
					<input type="hidden" name="cartSize"  id="sizeCart" value="1" >
				</div>
				<c:forEach var="size" items="${sizeProduct}" varStatus="index">
					<c:if test="${size.idProduct == product.id && size.size == 1}">
						<div id="size_price" class="price_product_item">${size.price}
							đ</div>
					</c:if>
				</c:forEach>
				<button function="formSubmit()" type="submit" class="menu_item_action_view add_to_cart ">Mua Ngay
				</button>

			</form>

		</div>

	</div>

	<script type="text/javascript">
		function myFunction(clicked_id) {
			if (clicked_id == "1") {
				document.getElementById("1").classList.add("active");
				document.getElementById("2").classList.remove("active");
				document.getElementById("3").classList.remove("active");
				document.getElementById("sizeCart").value = "1";
				<c:forEach var="size" items="${sizeProduct}" varStatus="index">
					<c:if test="${size.idProduct == product.id && size.size == 1}">
						document.getElementById("size_price").innerHTML = "${size.price} đ";
					</c:if>
				</c:forEach>
			}
			if (clicked_id == "2") {

				document.getElementById("1").classList.remove("active");
				document.getElementById("2").classList.add("active");
				document.getElementById("3").classList.remove("active");
				document.getElementById("sizeCart").value = "2";
				<c:forEach var="size" items="${sizeProduct}" varStatus="index">
					<c:if test="${size.idProduct == product.id && size.size == 2}">
						document.getElementById("size_price").innerHTML = "${size.price} đ";
					</c:if>
				</c:forEach>
			}
			if (clicked_id == "3") {
				document.getElementById("2").classList.remove("active");
				document.getElementById("3").classList.add("active");
				document.getElementById("1").classList.remove("active");
				document.getElementById("sizeCart").value = "3";
				<c:forEach var="size" items="${sizeProduct}" varStatus="index">
					<c:if test="${size.idProduct == product.id && size.size == 3}">
						document.getElementById("size_price").innerHTML = "${size.price} đ";
					</c:if>
				</c:forEach>
			}
		}
		
	</script>

	<div class="container" style="margin-bottom: 50px;">
		<div class="order_product"
			style="margin-bottom: 50px; text-align: center;">
			<h3>Có thể bạn sẽ thích</h3>
		</div>
		<div class="list_product">

			<c:forEach var = "i" begin = "0" end = "3">
				<div class="product_image">
					<img class="img"
						src="/TheCoffeeShop/assets/user/img/${randomProducts[i].id_category}/${randomProducts[i].img}.jpg" alt="">
					<div class="product_name">
						<Strong>${randomProducts[i].name}</Strong>
					</div>
					<div class="animate_btn">
						<a href="<c:url value="/san-pham/${randomProducts[i].id}"/>">Mua Ngay</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>



</body>
