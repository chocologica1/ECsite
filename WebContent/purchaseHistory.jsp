<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="./css/style.css"/>
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
			<s:if test="purchaseList.size() == 0">
				<br>
				<h3>ご購入情報はありません。</h3>
				<br>
			</s:if>

			<!-- 削除前 -->
			<s:elseif test="purchaseList.size > 0">
				<h3>ご購入情報は以下になります。</h3>
				<table border="1">
					<tr>
						<th>商品名</th>
						<th>値段</th>
						<th>購入個数</th>
						<th>支払い方法</th>
						<th>購入日</th>
						<th></th>
					</tr>
					<s:iterator value="purchaseList">
						<tr>
							<td><s:property value="itemName"/></td>
							<td><s:property value="totalPrice"/></td>
							<td><s:property value="count"/></td>
							<td><s:property value="payment"/></td>
							<td><s:property value="insert_date"/></td>
							<td>
								<s:form action="PurchaseHistoryDeleteConfirmAction" theme="simple">
									<input type="hidden" value='<s:property value="userBuyItemId"/>' name="deleteHistoryId"/>
									<s:submit value="削除"/>
								</s:form>
							</td>
						</tr>
					</s:iterator>
					<s:form action="PurchaseHistoryDeleteConfirmAction">
						<s:hidden value="all" name="deleteHistoryId"/>
						<s:submit value="全削除"/>
					</s:form>
				</table>
				<br>

			</s:elseif>

			<div id="text-right">
				<p>カートは<a href='<s:url action="MyCartAction"/>'>こちら</a></p>
				<p>Homeへ戻る場合は<a href='<s:url action="GoHomeAction"/>'>こちら</a></p>
				<p>ログアウトする場合は<a href='<s:url action="LogoutAction"/>'>こちら</a></p>
			</div>
		</div>
	 </div>
	</div>
	<jsp:include page="footer.jsp" flush="true"/>
</body>
</html>