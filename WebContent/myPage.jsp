<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="./css/style.css"/>
	<link href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" rel="stylesheet">
	<title>マイページ</title>
</head>
<body>
	<jsp:include page="header.jsp" flush="true" />
	<div id="main">
	 <div class="container">
		 <div class="index">
	 			<h2><s:property value="#session.userName"/> さんのマイページ</h2>
	 	</div>
	 	<div class="contents-wrapper">
	 		<s:form action="PurchaseHistoryAction" cssClass="menu-box">
	 			<s:submit value="購入履歴を確認する" cssClass="menu-button"/>
	 		</s:form>
	 		<s:form action="MyCartAction" cssClass="menu-box">
	 			<s:submit value="カートをみる" cssClass="menu-button"/>
	 		</s:form>
	 		<s:form action="xxx" cssClass="menu-box">
	 			<s:submit value="アカウント設定　" cssClass="menu-button"/>
	 		</s:form>
	 	</div>
	 </div>
	</div>
	<jsp:include page="footer.jsp" flush="true"/>
</body>
</html>