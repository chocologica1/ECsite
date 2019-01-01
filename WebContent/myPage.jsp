<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-type" content="text/html;charset=utf-8"/>
	<meta http-equiv="Content-Style-Type" content="text/css"/>
	<meta http-equiv="Content-Script-Type" content="text/javascript"/>
	<meta http-equiv="imagetoolbar" content="no"/>
	<meta name="description" content=""/>
	<meta name="keywords" content=""/>
	<link rel="stylesheet" type="text/css" href="./css/style.css"/>
	<title>MyPage画面</title>
</head>
<body>
	<jsp:include page="header.jsp" flush="true" />
	<div id="main">
	 <div class="container">
		 <div class="index">
	 			<h2><s:property value="#session.login_user_id"/> さんのマイページ</h2>
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