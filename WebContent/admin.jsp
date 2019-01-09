<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="./css/style.css"/>
	<link rel="stylesheet" type="text/css" href="./css/form.css"/>
	<link href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" rel="stylesheet">
	<title>管理者トップ</title>
</head>
<body>
	<jsp:include page="header.jsp" flush="true" />
	<div id="main">
		<div class="container">
			<div class="index">
				<h2>管理者トップ</h2>
			</div>
			<div class="color-box login-wrapper">
				<div class="login-box">
					<div class="center">
						<p class="title">商品</p>
						<s:form action="ItemCreateAction">
							<s:submit value="新規登録" cssClass="button"/>
						</s:form>
						<br>
						<s:form action="ItemListAction">
							<s:submit value="一覧" cssClass="button"/>
						</s:form>
					</div>
				</div>
				<div class="user-box">
					<div class="center">
						<p class="title">ユーザー</p>
						<s:form action="UserCreateAction">
							<s:submit value="新規登録" cssClass="button"/>
						</s:form>
						<br>
						<s:form action="UserListAction">
							<s:submit value="一覧" cssClass="button"/>
						</s:form>
					</div>
				</div>
			</div>
			<div>
				<s:form action="LogoutAction" cssClass="return-button-box">
					<s:submit value="＞管理者ログアウト" cssClass="return-button" />
				</s:form>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" flush="true"/>
</body>
</html>