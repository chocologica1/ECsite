<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="./css/style.css" />
	<link rel="stylesheet" type="text/css" href="./css/form.css" />
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
				<s:if test="#session.containsKey('login_user_id')">
					<div class="color-box">
						<h3>
							新規登録するには<a href='<s:url action="LogoutAction"/>'>ログアウト</a>してください。
						</h3>
					</div>
				</s:if>

				<s:else>
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
					<div class="color-box">
						<s:form action="UserCreateConfirmAction" cssClass="form-box">
							<label>ログインID</label><br>
							<input type="text" name="loginUserId" autocomplete="off" class="input-field" />
							<br>
							<label>パスワード</label><br>
							<input type="password" name="loginPassword" autocomplete="new-password" class="input-field" />
							<br>
							<label>ユーザー名</label><br>
							<input type="text" name="userName" autocomplete="off" class="input-field" />
							<br>
							<div class="center-button-box">
								<s:submit value="登録" cssClass="button" />
							</div>
						</s:form>
					</div>
					<s:if test="#session.containsKey('adminId')">
						<s:form action="AdminAction" cssClass="return-button-box">
							<s:submit value="＞管理者トップに戻る" cssClass="return-button" />
						</s:form>
					</s:if>
				</s:else>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" flush="true" />
</body>
</html>