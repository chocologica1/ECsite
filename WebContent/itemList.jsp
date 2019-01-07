<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="./css/style.css"/>
	<link rel="stylesheet" type="text/css" href="./css/list.css"/>
	<link href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" rel="stylesheet">
	<title>商品管理</title>
</head>
<body>
	<jsp:include page="header.jsp" flush="true" />
	<div id="main">
		<div class="container">
			<div class="index">
				<h2>商品一覧</h2>
			</div>
			<div>
				<s:if test="itemList.size() <= 0">
					<div class="info">
						<p>商品情報はありません。</p>
					</div>
				</s:if>

				<s:if test="itemList.size() > 0">
					<table>
						<tr>
							<th>ID</th>
							<th>商品名</th>
							<th>商品画像</th>
							<th>値段</th>
							<th>在庫数</th>
							<th>登録日</th>
						</tr>
						<s:iterator value="itemList">
							<tr>
								<td>
									<s:property value="id"/>
								</td>
								<td>
									<s:property value="itemName"/>
								</td>
								<td>
									<div class="item-image">
										<img src="./image/item/<s:property value='id'/>.png" alt="item" class="image">
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
					<div>
						<s:form action="ItemListDeleteConfirmAction" cssClass="center-button-box">
							<s:submit value="全削除" cssClass="button"/>
						</s:form>
					</div>
				</s:if>
			</div>
			<div>
				<s:form action="AdminAction" cssClass="return-button-box">
					<s:submit value="＞管理者トップに戻る" cssClass="return-button"/>
				</s:form>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" flush="true"/>
</body>
</html>