<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="./css/style.css"/>
	<link rel="stylesheet" type="text/css" href="./css/list.css" />
	<link href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" rel="stylesheet">
	<title>商品削除確認</title>
</head>
<body>
	<jsp:include page="header.jsp" flush="true" />
	<div id="main">
		<div class="container">
			<div class="index">
				<h2>商品削除</h2>
			</div>
			<div>
				<h3>以下の商品を削除します。よろしいですか。</h3>
				<br>
				<table>
					<tr>
						<th>ID</th>
						<th>商品名</th>
						<th>商品画像</th>
						<th>価格</th>
						<th>在庫</th>
						<th>登録日</th>
					</tr>
					<s:iterator value="deleteItemList">
						<tr>
							<td>
								<s:property value="id" />
							</td>
							<td>
								<s:property value="itemName"/>
							</td>
							<td>
								<div class="item-image">
									<img src="./image/item/<s:property value='id'/>.png"
										alt="item" class="image">
								</div>
							</td>
							<td>
								<s:property value="itemPrice"/>
							</td>
							<td>
								<s:property value="itemStock"/>
							</td>
							<td>
								<s:property value="insertDate"/>
							</td>
						</tr>
					</s:iterator>
				</table>
			</div>
			<div>
				<div class="center-flex-box">
					<div class="flex-button-box">
						<s:form action="ItemListAction">
							<s:submit value="キャンセル" class="button back"/>
						</s:form>
					</div>
					<div class="flex-button-box">
						<s:form action="ItemListDeleteCompleteAction">
							<s:submit value="OK" class="button"/>
						</s:form>
					</div>
				</div>
			</div>
			<div>
				<s:form action="AdminAction" cssClass="return-button-box">
					<s:submit value="＞管理者トップに戻る" cssClass="return-button" />
				</s:form>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" flush="true"/>
</body>
</html>