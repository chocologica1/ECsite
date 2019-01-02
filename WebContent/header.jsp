<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
					<ul class="header-list">
						<li><a href='<s:url action="GoHomeAction"/>'>ホーム</a></li>
						<li><a href='<s:url action="LoginConfirmAction"/>'>ログイン</a></li>
						<li><a href='<s:url action="UserCreateAction"/>'>会員登録</a></li>
					</ul>
				</s:if>

				<s:elseif test="#session.login_user_id != null">
					<ul class="header-list">
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