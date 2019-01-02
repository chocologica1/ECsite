<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="./css/style.css"/>
	<link rel="stylesheet" type="text/css" href="./css/form.css"/>
	<link href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" rel="stylesheet">
	<title>ログイン</title>
</head>
<body>
	<jsp:include page="header.jsp" flush="true" />
	<div id="main">
	 <div class="container">
		<div class="index">
			<h2>ログイン</h2>
		</div>
		<s:if test="message != ''">
			<div class="error">
				<s:property value="message"/>
			</div>
		</s:if>
		<div class="login-wrapper color-box">
			<div class="login-box">
				<p class="title">ログイン</p>
				<p class="sentence">ショップ会員の方、【Nyamuse-ID】をお持ちの方は以下よりログインしてください。</p>
				<s:form action="LoginAction">
					<label>ログインID</label><br>
					<s:textfield name="loginUserId" autocomplete="off" cssClass="input-field"/>
					<br>
					<label>パスワード</label><br>
					<s:password name="loginPassword" autocomplete="new-password" cssClass="input-field"/>
					<br>
					<div class="center-button-box">
						<s:submit value="ログイン" cssClass="button"/>
					</div>
				</s:form>
			</div>
			<div class="user-box">
				<p class="title">会員登録</p>
				<p class="sentence">はじめてご利用いただく際には会員登録(無料)が必要となります。<br>会員登録がお済みで無い方はこちらから登録をお願いいたします。</p>
				<s:form action="UserCreateAction" cssClass="center-button-box">
					<s:submit value="新規登録はこちら" cssClass="button" />
				</s:form>
			</div>
		</div>
	 </div>
	</div>
	<jsp:include page="footer.jsp" flush="true"/>
</body>
</html>