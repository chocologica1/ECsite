<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="./css/style.css" />
	<link href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" rel="stylesheet">
	<title>カート削除確認</title>
	<style type="text/css">
	/* ======横並びボタン======= */
		.center {
			display: flex;
			width: 200px;
			margin: 0 auto;
		}

		.button {
			width: 100px;
		}
	</style>
</head>
<body>
	<jsp:include page="header.jsp" flush="true" />
	<div id="main">
		<div class="container">
			<div class="index">
				<h2>ショッピングカート</h2>
			</div>
			<div>
				<h3>以下の商品を削除します。よろしいですか。</h3>
				<table border="1">
					<tr>
						<th>商品名</th>
						<th>値段</th>
						<th>個数</th>
						<th>合計金額</th>
						<th>追加日</th>
					</tr>
					<s:iterator value="userCartDeleteList">
						<tr>
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
							<td>
								<s:property value="insertDate"/>
							</td>
						</tr>
					</s:iterator>
				</table>
				<div class="center">
					<div class="button">
						<s:form action="MyCartAction">
							<s:submit value="カートに戻る"/>
						</s:form>
					</div>
					<div class="button">
						<s:form action="MyCartDeleteCompleteAction">
							<input type="hidden" value='<s:property value="deleteCartId"/>' name="deleteCartId"/>
							<s:submit value="完了"/>
						</s:form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" flush="true"/>
</body>
</html>