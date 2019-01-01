<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="./css/style.css"/>
	<title>ItemCreateComplete画面</title>
</head>
<body>
	<jsp:include page="header.jsp" flush="true" />
	<div id="main">
		<div class="container">
			<div class="index">
				<h2>商品追加</h2>
			</div>
			<div>
				<h3>商品の登録が完了しました。</h3>
				<br>
				<a href='<s:url action="AdminAction"/>'>管理者TOPへ</a>
				<br><br>
				<span>続けて商品を登録する場合は</span><a href='<s:url action="ItemCreateAction"/>'>こちら</a>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" flush="true"/>
</body>
</html>