<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="./css/style.css"/>
	<link rel="stylesheet" type="text/css" href="./css/form.css"/>
	<link href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" rel="stylesheet">
	<title>ユーザー登録確認</title>
</head>
<body>
	<jsp:include page="header.jsp" flush="true" />
	<div id="main">
	 <div class="container">
		<div class="index">
			<h2>会員登録</h2>
		</div>
		<div class="color-box">
			<p>ご登録内容は以下でよろしいですか。</p>
			<br>
			<table class="confirm-box">
			<s:form action="UserCreateCompleteAction">
				<tr>
					<td><label>ログインID</label></td>
					<td>
						<s:property value="loginUserId" escape="false"/>
					</td>
				</tr>
				<tr>
					<td><label>パスワード</label></td>
					<td>
						<s:property value="loginPassword" escape="false"/>
					</td>
				</tr>
				<tr>
					<td><label>ユーザー名</label></td>
					<td>
						<s:property value="userName" escape="false"/>
					</td>
				</tr>
			</s:form>
			</table>
			<div class="center-flex-box">
				<div class="flex-button-box">
					<s:form action="UserCreateAction" cssClass="">
						<s:submit value="戻って修正する" cssClass="button back"/>
					</s:form>
				</div>
				<div class="flex-button-box">
					<s:form action="UserCreateCompleteAction">
						<s:submit value="完了" cssClass="button ok"/>
					</s:form>
				</div>
			</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" flush="true"/>
</body>
</html>