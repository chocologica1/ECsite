<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="./css/style.css" />
	<link rel="stylesheet" type="text/css" href="./css/list.css" />
	<link href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" rel="stylesheet">
	<title>決済確認</title>
</head>
<body>
	<jsp:include page="header.jsp" flush="true" />
	<div id="main">
		<div class="container">
			<div class="index">
				<h2>ご注文内容確認</h2>
			</div>
			<div>
				<h3>まだご注文は確定しておりません。</h3>
				<br>
				<table>
					<tr>
						<th>商品名</th>
						<th>価格</th>
						<th>個数</th>
						<th>合計金額</th>
					</tr>
					<s:iterator value="#session.myCartList">
						<tr>
							<td>
								<s:property value="itemName"/>
							</td>
							<td>
								¥<s:property value="itemPrice"/>
							</td>
							<td>
								<s:property value="count"/>
							</td>
							<td>
								¥<s:property value="totalPrice"/>
							</td>
						</tr>
					</s:iterator>
				</table>
				<table class="vertical">
					<tr>
						<th>お支払い金額</th>
						<th>¥<s:property value="#session.purchasePrice"/></th>
					</tr>
					<tr>
						<th>お支払い方法</th>
						<th><s:property value="#session.pay"/></th>
					</tr>
				</table>
			</div>
			<div>
				<div class="center-flex-box">
					<div class="flex-button-box">
						<s:form action="PurchaseAction">
							<s:submit value="修正する" cssClass="button back"/>
						</s:form>
					</div>
					<div class="flex-button-box">
						<s:form action="PurchaseCompleteAction">
							<s:submit value="注文を確定する" cssClass="button go"/>
						</s:form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" flush="true"/>
</body>
</html>