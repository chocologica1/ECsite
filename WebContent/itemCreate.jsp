<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="./css/style.css"/>
	<link href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" rel="stylesheet">
	<title>商品追加</title>
</head>
<body>
	<jsp:include page="header.jsp" flush="true" />
	<div id="main">
		<div class="container">
			<div class="index">
				<h2>商品追加</h2>
			</div>
			<div>
				<!-- ItemCreateConfirmActionの返り値がerrorの時エラーメッセージを表示 -->
				<s:if test="errorMessage != ''">
					<div class="error">
						<s:property value="errorMessage"/>
					</div>
				</s:if>
				<!-- ItemCreateCompleteActionの返り値がerrorの時エラーメッセージを表示 -->
				<s:if test="itemCreateError != ''">
					<div class="error">
						<s:property value="itemCreateError"/>
					</div>
				</s:if>

				<table>
					<s:form action="ItemCreateConfirmAction">
						<tr>
							<td>商品名</td>
							<td><input type="text" name="itemName" class="textfield"/></td>
						</tr>
						<tr>
							<td>値段</td>
							<td><input type="text" name="itemPrice" class="textfield"/>円</td>
						</tr>
						<tr>
							<td>在庫数</td>
							<td><input type="text" name="itemStock" class="textfield"/>個</td>
						</tr>
						<s:submit value="登録"/>
					</s:form>
				</table>
			</div>
			<div>
				<br>
				<span>管理者TOPへ戻る場合は</span><a href='<s:url action="AdminAction"/>'>こちら</a>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" flush="true"/>
</body>
</html>