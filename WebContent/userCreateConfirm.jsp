<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="./css/style.css"/>
	<link href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" rel="stylesheet">
	<title>ユーザー登録確認</title>
	<style type="text/css">
		.center {
			display: flex;
			width: 160px;
			margin: 0 auto;
		}

		.button {
			width: 80px;
			margin: 10px;
		}
	</style>
</head>
<body>
	<jsp:include page="header.jsp" flush="true" />
	<div id="main">
	 <div class="container">
		<div class="index">
			<h2>会員登録</h2>
		</div>
		<div>
			<h3>登録する内容は以下でよろしいですか。</h3>
			<table>
			<s:form action="UserCreateCompleteAction">
				<tr id="box">
					<td><label>ログインID</label></td>
					<td>
						<s:property value="loginUserId" escape="false"/>
					</td>
				</tr>
				<tr id="box">
					<td><label>パスワード</label></td>
					<td>
						<s:property value="loginPassword" escape="false"/>
					</td>
				</tr>
				<tr id="box">
					<td><label>ユーザー名</label></td>
					<td>
						<s:property value="userName" escape="false"/>
					</td>
				</tr>
			</s:form>
			</table>
		</div>
		<div>
			<div class="center">
				<div class="button">
					<s:form action="UserCreateAction">
						<s:submit value="戻って修正する"/>
					</s:form>
				</div>
				<div class="button">
					<s:form action="UserCreateCompleteAction">
						<s:submit value="完了"/>
					</s:form>
				</div>
			</div>
		</div>
	 </div>
	</div>
	<jsp:include page="footer.jsp" flush="true"/>
</body>
</html>