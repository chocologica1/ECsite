<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="./css/style.css" />
	<link href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" rel="stylesheet">
	<title>ユーザー登録</title>
</head>
<body>
	<jsp:include page="header.jsp" flush="true" />
	<div id="main">
		<div class="container">
			<div class="index">
				<h2>会員登録</h2>
			</div>
			<div>
				<!-- sessionが残っているとき -->
				<s:if test="#session.login_user_id != null">
					<div class="message-wrapper">
						<p>
							新規登録するには<a href='<s:url action="LogoutAction"/>'>ログアウト</a>してください。
						</p>
					</div>
				</s:if>

				<s:else>
					<div class="create-wrapper">
						<!-- UserCreateConfirmActionの返り値がerrorの時エラーメッセージを表示 -->
						<s:if test="nullMessage != ''">
							<div class="error">
								<s:property value="nullMessage" escape="false" />
							</div>
						</s:if>
						<s:if test="errorMessage != ''">
							<div class="error">
								<s:property value="errorMessage" escape="false" />
							</div>
						</s:if>

						<!-- 入力フォーム -->
						<s:form action="UserCreateConfirmAction" theme="simple" cssClass="form-wrapper">
							<label>ログインID</label>
							<br>
							<input type="text" name="loginUserId" value="" class="login-field"/>
							<br>
							<label>パスワード</label>
							<br>
							<input type="text" name="loginPassword" value="" class="login-field"/>
							<br>
							<label>ユーザー名</label>
							<br>
							<input type="text" name="userName" value="" class="login-field"/>
							<br>
							<div class="login-button-box">
								<s:submit value="登録" cssClass="login-button"/>
							</div>
						</s:form>
					</div>
				</s:else>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" flush="true" />
</body>
</html>