<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="./css/style.css" />
	<link href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" rel="stylesheet">
	<title>決済方法選択</title>
</head>
<body>
	<jsp:include page="header.jsp" flush="true" />
	<div id="main">
		<div class="container">
			<div class="index">
				<h2>決済方法選択</h2>
			</div>
			<div>
				<h3>まだご注文は確定しておりません。</h3>
			</div>
			<div>
				<table border="1">
					<tr>
						<th></th>
						<th>商品名</th>
						<th>値段</th>
						<th>個数</th>
						<th>合計金額</th>
					</tr>
					<s:iterator value="#session.myCartList">
						<tr>
							<td></td>
							<td>
								<s:property value="itemName"/>
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
						</tr>
					</s:iterator>
					<tr>
						<th>計</th>
						<th></th>
						<th></th>
						<th></th>
						<th><s:property value="#session.purchasePrice"/><span>円</span></th>
					</tr>
				</table>
			</div>
			<s:form action="PurchaseConfirmAction">
				<div class="select">
					<h3>お支払い方法を選択してください</h3>
					<div class="radio">
							<label><input type="radio" name="pay" value="1" checked="checked"/>クレジットカード</label><br>
							<label><input type="radio" name="pay" value="2"/>コンビニ決済</label><br>
							<label><input type="radio" name="pay" value="3"/>銀行振込</label><br>
							<label><input type="radio" name="pay" value="4"/>代金引換</label>
					</div>
				</div>
				<div>
					<s:submit value="次へ" cssClass="purchase-button"/>
				</div>
			</s:form>
			<s:form action="MyCartAction">
				<s:submit value="カートに戻る"/>
			</s:form>
		</div>
	</div>
	<jsp:include page="footer.jsp" flush="true"/>
</body>
</html>