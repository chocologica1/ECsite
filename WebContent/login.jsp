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
	<title>Login画面</title>
</head>
<body>
	<jsp:include page="header.jsp" flush="true" />
	<div id="main">
	 <div class="container">
		<div class="index">
			<h2>ログイン</h2>
		</div>
		<div class="login-wrapper">
			<div class="login-box">
				<p class="title">ログイン</p>
				<p class="color333">ショップ会員の方、【Nyamuse-ID】をお持ちの方は以下よりログインしてください。</p>
				<s:form action="LoginAction" theme="simple">
					<label>ログインID</label><br>
					<s:textfield name="loginUserId" cssClass="login-field"/>
					<br>
					<label>パスワード</label><br>
					<s:password name="loginPassword" cssClass="login-field"/>
					<br>
					<div class="login-button-box">
						<s:submit value="ログイン" cssClass="login-button button"/>
					</div>
				</s:form>
			</div>
			<div class="user-box">
				<p class="title">会員登録</p>
				<p class="color333">はじめてご利用いただく際には会員登録(無料)が必要となります。<br>会員登録がお済みで無い方はこちらから登録をお願いいたします。</p>
				<s:form action="UserCreateAction" theme="simple" cssClass="login-button-box">
					<s:submit value="新規登録はこちら" cssClass="login-button button" />
				</s:form>
			</div>
		</div>
	 </div>
	</div>
	<jsp:include page="footer.jsp" flush="true"/>
</body>
</html>