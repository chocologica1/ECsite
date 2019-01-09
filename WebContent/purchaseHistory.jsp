<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="./css/style.css" />
	<link rel="stylesheet" type="text/css" href="./css/list.css" />
	<link href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" rel="stylesheet">
	<title>購入履歴</title>
</head>
<body>
	<jsp:include page="header.jsp" flush="true" />
	<div id="main">
		<div class="container">
			<div class="index">
				<h2>購入履歴</h2>
			</div>
			<div>
				<!-- 削除済み-->
				<s:if test="purchaseList.size() <= 0">
					<br>
					<h3>ご購入情報はありません。</h3>
					<br>
				</s:if>

				<!-- 削除前 -->
				<s:if test="purchaseList.size > 0">
					<h3>ご購入情報は以下になります。</h3>
					<br>
					<table>
						<tr>
							<th>商品名</th>
							<th>価格</th>
							<th>個数</th>
							<th>合計金額</th>
							<th>決済方法</th>
							<th>購入日</th>
							<th></th>
						</tr>
						<s:iterator value="purchaseList">
							<tr>
								<td><s:property value="itemName" /></td>
								<td>¥<s:property value="itemPrice"/></td>
								<td><s:property value="count" /></td>
								<td>¥<s:property value="totalPrice" /></td>
								<td><s:property value="payment" /></td>
								<td><s:property value="insert_date" /></td>
								<td>
									<s:form action="PurchaseHistoryDeleteConfirmAction">
										<input type="hidden"
											value='<s:property value="userBuyItemId"/>'
											name="deleteHistoryId" />
										<s:submit value="削除" />
									</s:form>
								</td>
							</tr>
						</s:iterator>
					</table>
					<s:form action="PurchaseHistoryDeleteConfirmAction" cssClass="center-button-box">
						<s:hidden value="all" name="deleteHistoryId" />
						<s:submit value="全削除" cssClass="button"/>
					</s:form>
				</s:if>
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