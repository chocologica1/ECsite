<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="./css/style.css"/>
	<title>ItemListDeleteConfirm画面</title>
	<style type="text/css">
		.center {
			display: flex;
			width: 160px;
			margin: 0 auto;
		}

		.button {
			width: 80px;
			padding-bottom: 30px;
		}
	</style>
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
				<table border="1">
					<tr>
						<th>商品名</th>
						<th>値段</th>
						<th>在庫数</th>
						<th>登録日</th>
					</tr>
					<s:iterator value="deleteItemList">
						<tr>
							<td>
								<s:property value="itemName"/>
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
				<div class="center">
					<div class="button">
						<s:form action="ItemListDeleteCompleteAction" theme="simple">
							<s:submit value="OK"/>
						</s:form>
					</div>
					<div class="button">
						<s:form action="ItemListAction" theme="simple">
							<s:submit value="キャンセル"/>
						</s:form>
					</div>
				</div>
			</div>
			<div>
				<span>管理者TOPへ戻る場合は</span><a href='<s:url action="AdminAction"/>'>こちら</a>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" flush="true"/>
</body>
</html>