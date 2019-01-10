<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="./css/style.css" />
	<link rel="stylesheet" href="./css/form.css" />
	<link href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" rel="stylesheet">
	<title>決済完了</title>
</head>
<body>
	<jsp:include page="header.jsp" flush="true" />
	<div id="main">
		<div class="container">
			<div class="index">
				<h2>決済完了</h2>
			</div>
			<div class="center">
				<h3>ご注文ありがとうございました。</h3>
				<br>
				<p>マイページからご購入履歴の確認ができます。</p>
				<br>
				<s:form action="ItemAction" cssClass="center-button-box">
					<s:submit value="お買い物を続ける" cssClass="button"/>
				</s:form>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" flush="true"/>
</body>
</html>