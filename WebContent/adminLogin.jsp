<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="./css/style.css"/>
	<link rel="stylesheet" type="text/css" href="./css/form.css" />
	<link href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" rel="stylesheet">
	<title>管理者ログイン</title>
</head>
<body>
	<jsp:include page="header.jsp" flush="true" />
	<div id="main">
		<div class="container">
			<div class="index">
				<h2>管理者ログイン</h2>
			</div>
			<!-- errorのあと -->
			<s:if test="message != ''">
				<div class="error">
					<p><s:property value="message" /></p>
				</div>
			</s:if>
			<div class="color-box">
				<s:form action="AdminLoginAction" cssClass="form-box">
					<label>管理者ID</label>
					<br>
					<s:textfield name="adminId" cssClass="input-field"/>
					<br>
					<label>管理者パスワード</label>
					<br>
					<s:password name="adminPass" cssClass="input-field"/>
					<br>
					<div class="center-button-box">
						<s:submit value="ログイン" cssClass="button"/>
					</div>
				</s:form>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" flush="true"/>
</body>
</html>