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
	<link rel="stylesheet" type="text/css" href="./css/style.css" />
	<title>AdminLogin画面</title>
</head>
<body>
	<jsp:include page="header.jsp" flush="true" />
	<div id="main">
		<div class="container">
			<div class="index">
				<h2>管理者ログイン</h2>
			</div>
			<div>
				<!-- errorのあと -->
				<div class="error">
				<s:if test="message != ''">
					<h3><s:property value="message"/></h3>
				</s:if>
				</div>

				<h3>IDとパスワードを入力してください。</h3>
				<s:form action="AdminLoginAction">
					<s:textfield name="adminId"/>
					<s:password name="adminPass"/>
					<s:submit value="ログイン"/>
				</s:form>
			</div>
			<div>
				Homeへ戻る場合は<a href='<s:url action="GoHomeAction"/>'>こちら</a>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" flush="true"/>
</body>
</html>