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
	<title>MyCartDeleteComplete画面</title>
</head>
<body>
	<jsp:include page="header.jsp" flush="true" />
	<div id="main">
		<div class="container">
			<div class="index">
				<h2>ショッピングカート</h2>
			</div>
			<div>
				<h3>削除が完了しました。</h3>
				<s:form action="MyCartAction">
					<s:submit value="カートをみる"/>
				</s:form>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" flush="true" />
</body>
</html>