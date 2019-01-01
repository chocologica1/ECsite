<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="./css/style.css" />
	<title>CartComplete画面</title>
</head>
<body>
	<jsp:include page="header.jsp" flush="true" />
	<div id="main">
		<div class="container">
			<div class="index">
			</div>
			<div>
				<h3>カートに商品を追加しました。</h3>
				<br>
				<a href='<s:url action="MyCartAction"/>'>カートへ</a>
				<s:form action="ItemAction">
					<s:submit value="お買い物を続ける" />
				</s:form>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" flush="true"/>
</body>
</html>