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
<title>購入履歴削除確認</title>
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
				<br>
				<table>
					<tr>
						<th>商品名</th>
						<th>価格</th>
						<th>個数</th>
						<th>合計金額</th>
						<th>決済方法</th>
						<th>購入日</th>
					</tr>
					<s:iterator value="purchaseDeleteList">
						<tr>
							<td><s:property value="itemName" /></td>
							<td>¥<s:property value="itemPrice" /></td>
							<td><s:property value="count" /></td>
							<td>¥<s:property value="totalPrice" /></td>
							<td><s:property value="payment" /></td>
							<td><s:property value="insert_date" /></td>
						</tr>
					</s:iterator>
				</table>
				<div class="center-flex-box">
					<div class="flex-button-box">
						<s:form action="PurchaseHistoryAction">
							<s:submit value="キャンセル" cssClass="button back" />
						</s:form>
					</div>
					<div class="flex-button-box">
						<s:form action="PurchaseHistoryDeleteCompleteAction">
							<s:submit value="OK" cssClass="button" />
						</s:form>
					</div>
				</div>
			</div>
			<div>
				<s:form action="MyPageAction" cssClass="return-button-box">
					<s:submit value="＞マイページに戻る" cssClass="return-button" />
				</s:form>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" flush="true" />
</body>
</html>