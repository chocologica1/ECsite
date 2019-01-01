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
	<link rel="stylesheet" type="text/css" href="./css/header.css" />
	<title></title>
</head>
<body>
	<header>
		<div class="container">
			<div class="header-flex">
			<div class="header-logo">
				<p class="logo1">Nullmpool</p>
				<p class="logo2">Official Web Shop</p>
			</div>
			<div class="header-menu">
				<s:if test="#session.login_user_id == null">
					<ul>
						<li><a href='<s:url action="GoHomeAction"/>'>ホーム</a></li>
						<li><a href='<s:url action="LoginAction"/>'>ログイン</a></li>
						<li><a href='<s:url action="UserCreateAction"/>'>会員登録</a></li>
					</ul>
				</s:if>

				<s:elseif test="#session.login_user_id != null">
					<ul>
						<li><a href='<s:url action="GoHomeAction"/>'>ホーム</a></li>
						<li><a href='<s:url action="MyCartAction"/>'>カート</a></li>
						<li><a href='<s:url action="MyPageAction"/>'>マイページ</a></li>
						<li><a href='<s:url action="LogoutAction"/>'>ログアウト</a></li>
					</ul>
				</s:elseif>
			</div>
			</div>
		</div>
	</header>
</body>
</html>