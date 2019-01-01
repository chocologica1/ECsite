<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-type" content="text/html;charset=utf-8"/>
	<meta http-equiv="Content-Style-Type" content="text/css"/>
	<meta http-equiv="Content-Script-Type" content="text/javascript"/>
	<meta http-equiv="imagetoolbar" content="no"/>
	<meta name="description" content=""/>
	<meta name="keywords" content=""/>
	<link rel="stylesheet" type="text/css" href="./css/style.css" />
	<title>MyCart画面</title>
	<style type="text/css">
	/* ======横並びボタン======= */
		.center {
			display: flex;
			width: 300px;
			margin: 0 auto;
		}

		.button {
			width: 150px;
		}
	</style>
</head>
<body>
	<jsp:include page="header.jsp" flush="true" />
	<div id="main">
		<div class="container">
			<div class="index">
				<h2>ショッピングカート</h2>
			</div>
			<s:if test="nullMessage == ''">
			<div class="cart-list">
				<table border="1">
					<tr>
						<th colspan="2">商品</th>
						<th>値段</th>
						<th>個数</th>
						<th>合計金額</th>
						<th>追加日</th>
						<th></th>
					</tr>
					<s:iterator value="myCartList">
						<tr>
							<td>
								<img src='./image/item/<s:property value="id"/>.png' class="cart-image" alt="item" />
							</td>
							<td>
								<a href='<s:url action="ItemSelectAction"><s:param name="id" value="myCartList.id"/></s:url>' class="item-link"><s:property value="itemName"/></a>
							</td>
							<td>
								<s:property value="itemPrice"/>
							</td>
							<td>
								<s:property value="count"/>
							</td>
							<td>
								<s:property value="totalPrice"/>
							</td>
							<td>
								<s:property value="insertDate"/>
							</td>
							<td>
								<s:form action="MyCartDeleteConfirmAction" theme="simple">
									<input type="hidden" value='<s:property value="userCartId"/>' name="deleteCartId"/>
									<s:submit value="削除"/>
								</s:form>
							</td>
						</tr>
					</s:iterator>
					<s:form action="MyCartDeleteConfirmAction">
						<s:hidden value="all" name="deleteCartId"/>
						<s:submit value="カートを空にする"/>
					</s:form>
				</table>
			</div>
			<div>
				<div class="center">
					<div class="button">
						<s:form action="ItemAction">
							<s:submit value="お買い物を続ける"/>
						</s:form>
					</div>
					<div class="button">
						<s:form action="PurchaseAction">
							<s:submit value="レジへ進む" cssClass="purchase-button"/>
						</s:form>
					</div>
				</div>
			</div>
			</s:if>
			<s:else>
			<div>
				<h3><s:property value="nullMessage"/></h3>
			</div>
			<div>
				<s:form action="ItemAction">
					<s:submit value="お買い物を続ける"/>
				</s:form>
			</div>
			</s:else>
			<div>
				<p>マイページは<a href='<s:url action="MyPageAction"/>'>こちら</a></p>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" flush="true"/>
</body>
</html>