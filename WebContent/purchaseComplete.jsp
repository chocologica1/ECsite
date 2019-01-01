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
	<link rel="stylesheet" href="./css/style.css" />
	<title>purchaseComplete</title>
</head>
<body>
	<jsp:include page="header.jsp" flush="true" />
	<div id="main">
		<div class="container">
			<div class="index">
				<h2>注文完了</h2>
			</div>
			<div>
				<h3>ありがとうございました。</h3>
				<s:form action="ItemAction">
					<s:submit value="お買い物を続ける"/>
				</s:form>
				<p><a href='<s:url action="MyPageAction"/>'>マイページ</a>で購入履歴の確認ができます。</p>
				<br>
				<p>ログアウトは<a href='<s:url action="LogoutAction"/>'>こちら</a></p>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" flush="true"/>
</body>
</html>