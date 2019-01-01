<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="./css/style.css"/>
	<title>ItemCreate画面</title>
</head>
<body>
	<jsp:include page="header.jsp" flush="true" />
	<div id="main">
		<div class="container">
			<div class="index">
				<h2>商品追加</h2>
			</div>
			<div>
				<div class="error">
				<!-- ItemCreateConfirmActionの返り値がerrorの時エラーメッセージを表示 -->
				<s:if test="errorMessage != ''">
					<s:property value="errorMessage"/>
				</s:if>
				<!-- ItemCreateCompleteActionの返り値がerrorの時エラーメッセージを表示 -->
				<s:if test="itemCreateError != ''">
					<s:property value="itemCreateError"/>
				</s:if>
				</div>

				<table>
					<s:form action="ItemCreateConfirmAction">
						<tr>
							<td>商品名</td>
							<td><input type="text" name="itemName" size="18"/></td>
						</tr>
						<tr>
							<td>値段</td>
							<td><input type="text" name="itemPrice" size="16" style="text-align:right;"/>円</td>
						</tr>
						<tr>
							<td>在庫数</td>
							<td><input type="text" name="itemStock" size="16" style="text-align:right;"/>個</td>
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