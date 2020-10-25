<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/user/taglib.jsp" %>

<header>
	<div class="header">
		<a href="/TheCoffeeShop/trang-chu" class="logo"> <img
			src="<c:url value="/assets/user/img/logo.png"/>" alt=""> <span>ARABICA</span>
		</a>
		<div class="header-right">
			<c:forEach var="item" items="${menus}" varStatus="index">
				<c:if test="${item.position==1}">
					<c:if test="${ item.url == menus[4].url}">
					
						<c:if test="${ userSession != null }">
							<a href="/TheCoffeeShop/user/${userSession.id}">${userSession.username}</a>
						</c:if>
						
						<c:if test="${ userSession == null }">
							<a href="/TheCoffeeShop/${item.url}">${item.name}</a>
						</c:if>
						
					</c:if>
					
					<c:if test="${ item.url != menus[4].url}">
						<a href="/TheCoffeeShop/${item.url}">${item.name}</a>
					</c:if>
				</c:if>
			</c:forEach>
		</div>

		<div class="header-left">
			<c:forEach var="item" items="${menus}" varStatus="index">
				<c:if test="${item.position==0}">
					<c:if test="${item.url == menus[2].url }">
						<a id="${item.url}" href="/TheCoffeeShop/${item.url}">${item.name} (${TotalQuantyCart})</a>
					</c:if>
					<c:if test="${item.url != menus[2].url}">
						<a id="${item.url}" href="/TheCoffeeShop/${item.url}">${item.name} </a>
					</c:if>
				</c:if>

			</c:forEach>
		</div>
	</div>
	<script type="text/javascript">
		//var cartNum = document.getElementById("cart_number").innerText;
		//document.getElementById("cart_number").innerHTML = parseInt(cartNum);
	</script>
</header>