<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="./css/style.css"/>
	<title>UserCreateComplete画面</title>
</head>
<body>
	<jsp:include page="header.jsp" flush="true" />
	<div id="main">
	 <div class="container">
		<div class="index">
			<h2>会員登録</h2>
		</div>
		<div>
			<h3>ユーザーの登録が完了しました。</h3>
			<div>
				<br>
				<a href='<s:url action="HomeAction"/>'>ログインへ</a>
			</div>
		</div>
	 </div>
	</div>
	<jsp:include page="footer.jsp" flush="true"/>
</body>
</html>