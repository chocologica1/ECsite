<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="./css/style.css"/>
	<link href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" rel="stylesheet">
	<title>購入履歴削除確認</title>
	<style type="text/css">
		.center {
			display: flex;
			width: 160px;
			margin: 0 auto;
		}

		.button {
			width: 80px;
			margin-top: 20px;
		}
	</style>
</head>
<body>
	<jsp:include page="header.jsp" flush="true" />
	<div id="main">
	 <div class="container">
		<div class="index">
			<h2>購入履歴</h2>
		</div>
		<div>
			<h3>以下の商品の購入履歴を削除します。よろしいですか。</h3>
			<table border="1">
				<tr>
					<th>商品名</th>
					<th>値段</th>
					<th>購入個数</th>
					<th>支払い方法</th>
					<th>購入日</th>
				</tr>
				<s:iterator value="purchaseDeleteList">
					<tr>
						<td>
							<s:property value="itemName"/>
						</td>
						<td>
							<s:property value="totalPrice"/>
						</td>
						<td>
							<s:property value="count"/>
						</td>
						<td>
							<s:property value="payment"/>
						</td>
						<td>
							<s:property value="insert_date"/>
						</td>
					</tr>
				</s:iterator>
			</table>
		</div>
		<div>
			<div class="center">
				<div class="button">
					<s:form action="PurchaseHistoryAction">
						<s:submit value="キャンセル"/>
					</s:form>
				</div>
				<div class="button">
					<s:form action="PurchaseHistoryDeleteCompleteAction">
						<s:submit value="OK"/>
					</s:form>
				</div>
			</div>
		</div>
	 </div>
	</div>
	<jsp:include page="footer.jsp" flush="true"/>
</body>
</html>