<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./css/style.css" />
<link rel="stylesheet" type="text/css" href="./css/list.css" />
<link href="https://use.fontawesome.com/releases/v5.0.10/css/all.css"
	rel="stylesheet">
<title>カート</title>
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
								<td><img src='./image/item/<s:property value="id"/>.png'
									class="cart-image" alt="item" /></td>
								<td><a
									href='<s:url action="ItemSelectAction"><s:param name="id" value="myCartList.id"/></s:url>'
									class="item-link"><s:property value="itemName" /></a></td>
								<td><s:property value="itemPrice" /></td>
								<td><s:property value="count" /></td>
								<td><s:property value="totalPrice" /></td>
								<td><s:property value="insertDate" /></td>
								<td><s:form action="MyCartDeleteConfirmAction"
										theme="simple">
										<input type="hidden" value='<s:property value="userCartId"/>'
											name="deleteCartId" />
										<s:submit value="削除" />
									</s:form></td>
							</tr>
						</s:iterator>
					</table>
					<s:form action="MyCartDeleteConfirmAction" cssClass="center-button-box">
							<s:hidden value="all" name="deleteCartId" />
							<s:submit value="カートを空にする" cssClass="button back"/>
					</s:form>
				</div>
				<div>
					<div class="center-flex-box">
						<div class="flex-button-box">
							<s:form action="ItemAction">
								<s:submit value="お買い物を続ける" cssClass="button" />
							</s:form>
						</div>
						<div class="flex-button-box">
							<s:form action="PurchaseAction">
								<s:submit value="レジへ進む" cssClass="button go" />
							</s:form>
						</div>
					</div>
				</div>
			</s:if>
			<s:else>
				<h3>
					<s:property value="nullMessage" />
				</h3>
				<br>
				<s:form action="ItemAction" cssClass="center-button-box">
					<s:submit value="お買い物を続ける" cssClass="button" />
				</s:form>
			</s:else>
		</div>
	</div>
	<jsp:include page="footer.jsp" flush="true" />
</body>
</html>