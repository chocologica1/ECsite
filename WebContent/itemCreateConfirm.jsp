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
	<title>ItemCreateConfirm画面</title>
	<style type="text/css">
		.center {
			display: flex;
			width: 160px;
			margin: 0 auto;
		}

		.button {
			width: 80px;
		}

	</style>
</head>
<body>
	<jsp:include page="header.jsp" flush="true" />
	<div id="main">
	 <div class="container">
		<div class="index">
			<h2>商品追加</h2>
		</div>
		<div>
			<h3>登録する内容は以下でよろしいですか。</h3>
			<table>
				<s:form action="ItemCreateCompleteAction" theme="simple">
					<tr>
						<td>商品名</td>
						<td><s:property value="#session.itemName"/></td>
					</tr>
					<tr>
						<td>値段</td>
						<td><s:property value="#session.itemPrice"/>円</td>
					</tr>
					<tr>
						<td>在庫数</td>
						<td><s:property value="#session.itemStock"/>個</td>
					</tr>
				</s:form>
			</table>
			<div>
				<div class="center">
					<div class="button">
						<s:form action="ItemCreateAction">
							<s:submit value="戻って修正する"/>
						</s:form>
					</div>
					<div class="button">
						<s:form action="ItemCreateCompleteAction">
							<s:submit value="完了"/>
						</s:form>
					</div>
				</div>
			</div>
		</div>
	 </div>
	</div>
	<jsp:include page="footer.jsp" flush="true"/>
</body>
</html>